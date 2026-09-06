module MiniLispPlusPlus where

import Grammars
import Interp
import Lexer
import System.Console.Haskeline (runInputT, defaultSettings, getInputLine)
import Control.Monad.IO.Class (liftIO)

-- Infraestructura provista: no forma parte de los cuatro retos.
evalua :: String -> ASA
evalua entrada =
  case bigStep (parse (lexer entrada)) of
    Just valor -> valor
    Nothing -> error "Evaluacion bloqueada"
    
repl :: IO ()
repl = runInputT defaultSettings loop
  where
    loop = do
      minput <- getInputLine "MiniLisp++> "
      case minput of
        Nothing -> pure ()
        Just ":q" -> pure ()
        Just entrada -> do
          case bigStep (parse (lexer entrada)) of
            Just valor -> liftIO $ print valor
            Nothing    -> liftIO $ putStrLn "Error: Evaluación bloqueada"
          loop

main :: IO ()
main = repl