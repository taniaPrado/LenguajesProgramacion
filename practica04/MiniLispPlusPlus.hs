module MiniLispPlusPlus where

import Control.Monad.IO.Class (liftIO)
import Grammars
import Interp
import Lexer
import System.Console.Haskeline (defaultSettings, getInputLine, runInputT)

-- Integra el analisis, el desazucarado y la evaluacion desde el ambiente
-- vacio. Propaga Nothing desde cualquiera de las dos etapas finales.
evalua :: String -> Maybe Value

evalua entrada = do
    let sasa = parse (lexer entrada)
    arbol <- desugar sasa
    bigStep [] arbol

-- Infraestructura provista: no forma parte de los retos.
repl :: IO ()
repl = runInputT defaultSettings loop
  where
    loop = do
      minput <- getInputLine "MiniLisp++> "
      case minput of
        Nothing -> pure ()
        Just ":q" -> pure ()
        Just entrada -> do
          case evalua entrada of
            Just valor -> liftIO $ print valor
            Nothing -> liftIO $ putStrLn "Error: evaluacion bloqueada"
          loop

main :: IO ()
main = repl
