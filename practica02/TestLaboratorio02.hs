module Main where

import Control.Exception (SomeException, evaluate, try)
import Grammars
import Lexer
import Test.QuickCheck

data BienFormada = BienFormada ASA
  deriving (Show)

render :: ASA -> String
render (Num n) = show (abs n)
render (Boolean True) = "#t"
render (Boolean False) = "#f"
render (And xs) = renderNary "and" xs
render (Or xs) = renderNary "or" xs
render (Add xs) = renderNary "+" xs
render (Sub xs) = renderNary "-" xs
render (Mul xs) = renderNary "*" xs
render (Div xs) = renderNary "/" xs
render (Lt xs) = renderNary "<" xs
render (Gt xs) = renderNary ">" xs
render (Le xs) = renderNary "<=" xs
render (Ge xs) = renderNary ">=" xs
render (Expt a b) = "(expt " ++ render a ++ " " ++ render b ++ ")"
render (EqP a b) = "(eq " ++ render a ++ " " ++ render b ++ ")"
render (Not a) = "(not " ++ render a ++ ")"
render (Add1 a) = "(add1 " ++ render a ++ ")"
render (Sub1 a) = "(sub1 " ++ render a ++ ")"
render (ZeroP a) = "(zero? " ++ render a ++ ")"

renderNary :: String -> [ASA] -> String
renderNary op xs = "(" ++ unwords (op : map render xs) ++ ")"

genArgs :: Int -> Gen [ASA]
genArgs n = do
  k <- chooseInt (2, 4)
  vectorOf k (genASA (n `div` 2))

genASA :: Int -> Gen ASA
genASA 0 =
  oneof
    [ Num . getNonNegative <$> arbitrary,
      Boolean <$> arbitrary
    ]
genASA n =
  frequency
    [ (4, genASA 0),
      (1, And <$> genArgs n),
      (1, Or <$> genArgs n),
      (2, Add <$> genArgs n),
      (2, Sub <$> genArgs n),
      (2, Mul <$> genArgs n),
      (2, Div <$> genArgs n),
      (1, Lt <$> genArgs n),
      (1, Gt <$> genArgs n),
      (1, Le <$> genArgs n),
      (1, Ge <$> genArgs n),
      (1, Expt <$> genASA (n `div` 2) <*> genASA (n `div` 2)),
      (1, EqP <$> genASA (n `div` 2) <*> genASA (n `div` 2)),
      (1, Not <$> genASA (n `div` 2)),
      (1, Add1 <$> genASA (n `div` 2)),
      (1, Sub1 <$> genASA (n `div` 2)),
      (1, ZeroP <$> genASA (n `div` 2))
    ]

instance Arbitrary BienFormada where
  arbitrary = sized (fmap BienFormada . genASA)
  shrink _ = []

parsea :: String -> ASA
parsea = parse . lexer

prop_lexer_basico :: Bool
prop_lexer_basico =
  lexer "(+ 1 2 3)"
    == [TokenPA, TokenSuma, TokenNum 1, TokenNum 2, TokenNum 3, TokenPC]

prop_lexer_operadores_nuevos :: Bool
prop_lexer_operadores_nuevos =
  lexer "(and #t (or #f #t) (<= 1 2) (>= 3 2) (zero? 0))"
    == [ TokenPA,
         TokenAnd,
         TokenBool True,
         TokenPA,
         TokenOr,
         TokenBool False,
         TokenBool True,
         TokenPC,
         TokenPA,
         TokenLE,
         TokenNum 1,
         TokenNum 2,
         TokenPC,
         TokenPA,
         TokenGE,
         TokenNum 3,
         TokenNum 2,
         TokenPC,
         TokenPA,
         TokenZeroP,
         TokenNum 0,
         TokenPC,
         TokenPC
       ]

prop_parse_narios :: Bool
prop_parse_narios =
  and
    [ parsea "(+ 1 2 3 4)" == Add [Num 1, Num 2, Num 3, Num 4],
      parsea "(* 2 3 4)" == Mul [Num 2, Num 3, Num 4],
      parsea "(and #t (or #f #t) (not #f))"
        == And [Boolean True, Or [Boolean False, Boolean True], Not (Boolean False)],
      parsea "(<= 1 2 3)" == Le [Num 1, Num 2, Num 3]
    ]

prop_parse_binarios_y_unarios :: Bool
prop_parse_binarios_y_unarios =
  and
    [ parsea "(expt 2 (add1 3))" == Expt (Num 2) (Add1 (Num 3)),
      parsea "(eq #t (zero? 0))" == EqP (Boolean True) (ZeroP (Num 0)),
      parsea "(sub1 (add1 10))" == Sub1 (Add1 (Num 10))
    ]

prop_roundtrip_asa :: BienFormada -> Property
prop_roundtrip_asa (BienFormada a) =
  counterexample (render a) $
    parsea (render a) == a

falla :: String -> IO Bool
falla s = do
  resultado <- try (evaluate (length (show (parsea s)))) :: IO (Either SomeException Int)
  pure $ case resultado of
    Left _ -> True
    Right _ -> False

prop_rechaza_malformadas :: Property
prop_rechaza_malformadas =
  ioProperty $ do
    resultados <-
      mapM
        falla
        [ "(+ 1)",
          "(and #t)",
          "(expt 2 3 4)",
          "(eq #t)",
          "(not #t #f)",
          "(zero? 0 1)",
          "007",
          "(< 1)"
        ]
    pure (and resultados)

main :: IO ()
main = do
  putStrLn "Reto 1: Lexer.x reconoce tokens de MiniLisp++"
  quickCheck prop_lexer_basico
  quickCheck prop_lexer_operadores_nuevos
  putStrLn "Reto 2 y 3: Grammars.y construye ASA correctos"
  quickCheck prop_parse_narios
  quickCheck prop_parse_binarios_y_unarios
  quickCheck prop_roundtrip_asa
  putStrLn "Casos que deben rechazarse"
  quickCheck prop_rechaza_malformadas
