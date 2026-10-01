module Main where

import Grammars
import Interp
import Lexer
import MiniLispPlusPlus (evalua)
import Test.QuickCheck hiding (Fun)

parsea :: String -> SASA
parsea = parse . lexer

-- Infraestructura provista -------------------------------------------------

prop_lexer_let_star :: Bool
prop_lexer_let_star =
  lexer "let* let letx"
    == [TokenLetStar, TokenLet, TokenId "letx"]

prop_parser_formas_fuente :: Bool
prop_parser_formas_fuente =
  and
    [ parsea "(+ 1 2 3)" == AddS [NumS 1, NumS 2, NumS 3],
      parsea "(- 10 3 2)" == SubS [NumS 10, NumS 3, NumS 2],
      parsea "(lambda (x y) (+ x y))"
        == FunS ["x", "y"] (AddS [IdS "x", IdS "y"]),
      parsea "(let* ((x 2) (y (+ x 3))) (- y x))"
        == LetStarS
          [("x", NumS 2), ("y", AddS [IdS "x", NumS 3])]
          (SubS [IdS "y", IdS "x"])
    ]

-- Reto 1: desazucarado ----------------------------------------------------

prop_currifica_funciones :: Bool
prop_currifica_funciones =
  and
    [ curryFun ["x", "y", "z"] (Id "x")
        == Just (Fun "x" (Fun "y" (Fun "z" (Id "x")))),
      curryFun [] (Num 0) == Nothing,
      curryFun ["x", "y", "x"] (Id "x") == Nothing
    ]

prop_currifica_aplicaciones :: Bool
prop_currifica_aplicaciones =
  and
    [ curryApp (Id "f") [Num 1, Num 2, Num 3]
        == Just (App (App (App (Id "f") (Num 1)) (Num 2)) (Num 3)),
      curryApp (Id "f") [] == Nothing
    ]

prop_operaciones_binarias :: Bool
prop_operaciones_binarias =
  and
    [ binaryOp Add [Num 1, Num 2, Num 3]
        == Just (Add (Add (Num 1) (Num 2)) (Num 3)),
      binaryOp Sub [Num 10, Num 3, Num 2]
        == Just (Sub (Sub (Num 10) (Num 3)) (Num 2)),
      binaryOp Add [Num 1] == Nothing,
      desugar (AddS [NumS 1, NumS 2, NumS 3])
        == Just (Add (Add (Num 1) (Num 2)) (Num 3))
    ]

prop_let_star_es_secuencial :: Bool
prop_let_star_es_secuencial =
  desugar
    (LetStarS
      [("x", NumS 2), ("y", AddS [IdS "x", NumS 3])]
      (SubS [IdS "y", IdS "x"]))
    == Just
      (App
        (Fun "x"
          (App
            (Fun "y" (Sub (Id "y") (Id "x")))
            (Add (Id "x") (Num 3))))
        (Num 2))

prop_desazucara_todas_las_formas :: Bool
prop_desazucara_todas_las_formas =
  desugar
    (AppS
      (FunS ["x", "y"] (NotS (BooleanS False)))
      [NumS 1, NumS 2])
    == Just
      (App
        (App (Fun "x" (Fun "y" (Not (Boolean False)))) (Num 1))
        (Num 2))

-- Reto 2: interpretacion con cerraduras ----------------------------------

prop_lookup_respeta_sombreado :: Int -> Int -> Bool
prop_lookup_respeta_sombreado reciente anterior =
  lookupEnv
    "x"
    [("x", NumV reciente), ("y", BooleanV True), ("x", NumV anterior)]
    == Just (NumV reciente)

prop_funcion_produce_cerradura :: Int -> Bool
prop_funcion_produce_cerradura n =
  let env = [("x", NumV n)]
   in bigStep env (Fun "y" (Add (Id "x") (Id "y")))
        == Just (ClosureV "y" (Add (Id "x") (Id "y")) env)

prop_alcance_estatico :: Int -> Int -> Int -> Bool
prop_alcance_estatico exterior interior argumento =
  let programa =
        App
          (Fun "x"
            (App
              (Fun "f"
                (App
                  (Fun "x" (App (Id "f") (Num argumento)))
                  (Num interior)))
              (Fun "y" (Add (Id "x") (Id "y")))))
          (Num exterior)
   in bigStep [] programa == Just (NumV (exterior + argumento))

prop_cerradura_puede_escapar :: Int -> Int -> Bool
prop_cerradura_puede_escapar n m =
  let programa =
        App
          (App
            (Fun "x" (Fun "y" (Add (Id "x") (Id "y"))))
            (Num n))
          (Num m)
   in bigStep [] programa == Just (NumV (n + m))

prop_aplicacion_es_ansiosa :: Bool
prop_aplicacion_es_ansiosa =
  and
    [ bigStep [] (App (Fun "x" (Num 1)) (Id "libre")) == Nothing,
      bigStep [] (App (Num 0) (Num 1)) == Nothing
    ]

prop_primitivas_comprueban_tipos :: Bool
prop_primitivas_comprueban_tipos =
  and
    [ bigStep [] (Add (Num 3) (Num 4)) == Just (NumV 7),
      bigStep [] (Sub (Num 3) (Num 5)) == Just (NumV 0),
      bigStep [] (Not (Boolean False)) == Just (BooleanV True),
      bigStep [] (Not (Num 0)) == Just (BooleanV False),
      bigStep [] (Add (Boolean True) (Num 1)) == Nothing
    ]

prop_integracion :: Bool
prop_integracion =
  and
    [ evalua
        "(let* ((x 3) (f (lambda (y) (+ x y))) (x 5)) (f 4))"
        == Just (NumV 7),
      evalua
        "(let (make (lambda (x y) (+ x y))) (let (add2 (make 2)) (add2 5)))"
        == Just (NumV 7),
      evalua "(- 10 3 2)" == Just (NumV 5)
    ]

main :: IO ()
main = do
  putStrLn "Infraestructura: lexer y parser"
  quickCheck prop_lexer_let_star
  quickCheck prop_parser_formas_fuente

  putStrLn "Reto 1: desazucarado"
  quickCheck prop_currifica_funciones
  quickCheck prop_currifica_aplicaciones
  quickCheck prop_operaciones_binarias
  quickCheck prop_let_star_es_secuencial
  quickCheck prop_desazucara_todas_las_formas

  putStrLn "Reto 2: interpretacion con cerraduras"
  quickCheck prop_lookup_respeta_sombreado
  quickCheck prop_funcion_produce_cerradura
  quickCheck prop_alcance_estatico
  quickCheck prop_cerradura_puede_escapar
  quickCheck prop_aplicacion_es_ansiosa
  quickCheck prop_primitivas_comprueban_tipos
  quickCheck prop_integracion
