module Main where

import Grammars
import Interp
import Lexer
import MiniLispPlusPlus (evalua)
import Test.QuickCheck hiding (Fun)

parsea :: String -> SASA
parsea = parse . lexer

programaAlcance :: Int -> Int -> Int -> ASA
programaAlcance exterior interior argumento =
  App
    (Fun
      "x"
      (App
        (Fun
          "f"
          (App
            (Fun "x" (App (Id "f") (Num argumento)))
            (Num interior)))
        (Fun "y" (Add (Id "x") (Id "y")))))
    (Num exterior)

programaRecursivoFuente :: SASA
programaRecursivoFuente =
  LetRecS
    "f"
    (FunS
      ["b"]
      (IfS
        (IdS "b")
        (NumS 7)
        (AppS (IdS "f") [BooleanS True])))
    (AppS (IdS "f") [BooleanS False])

programaRecursivoNucleo :: ASA
programaRecursivoNucleo =
  App
    (Fun "f" (App (Id "f") (Boolean False)))
    (App
      (Id "Y")
      (Fun
        "f"
        (Fun
          "b"
          (If
            (Id "b")
            (Num 7)
            (App (Id "f") (Boolean True))))))

-- Reto 1: analisis lexico -------------------------------------------------

prop_lexer_nuevas_reservadas :: Bool
prop_lexer_nuevas_reservadas =
  lexer "if cond else letrec ifx cond1"
    == [ TokenIf,
         TokenCond,
         TokenElse,
         TokenLetRec,
         TokenId "ifx",
         TokenId "cond1"
       ]

prop_lexer_conserva_laboratorio04 :: Bool
prop_lexer_conserva_laboratorio04 =
  lexer "let let* lambda not"
    == [TokenLet, TokenLetStar, TokenLambda, TokenNot]

-- Reto 2: analisis sintactico --------------------------------------------

prop_parse_if :: Bool
prop_parse_if =
  parsea "(if #t 1 2)"
    == IfS (BooleanS True) (NumS 1) (NumS 2)

prop_parse_cond_con_else :: Bool
prop_parse_cond_con_else =
  parsea "(cond (#f 1) ((not #f) 2) (else 3))"
    == CondS
      [ (BooleanS False, NumS 1),
        (NotS (BooleanS False), NumS 2)
      ]
      (NumS 3)

prop_parse_letrec :: Bool
prop_parse_letrec =
  parsea "(letrec (f (lambda (b) (if b 7 (f #t)))) (f #f))"
    == programaRecursivoFuente

-- Reto 3: desazucarado ----------------------------------------------------

prop_currificacion_heredada :: Bool
prop_currificacion_heredada =
  and
    [ curryFun ["x", "y"] (Add (Id "x") (Id "y"))
        == Just (Fun "x" (Fun "y" (Add (Id "x") (Id "y")))),
      curryApp (Id "f") [Num 1, Num 2]
        == Just (App (App (Id "f") (Num 1)) (Num 2)),
      binaryOp Sub [Num 8, Num 3, Num 2]
        == Just (Sub (Sub (Num 8) (Num 3)) (Num 2))
    ]

prop_cond_se_anida_a_la_derecha :: Bool
prop_cond_se_anida_a_la_derecha =
  desugar
    (CondS
      [ (BooleanS False, NumS 1),
        (BooleanS True, NumS 2)
      ]
      (NumS 3))
    == Just
      (If
        (Boolean False)
        (Num 1)
        (If (Boolean True) (Num 2) (Num 3)))

prop_letrec_usa_y :: Bool
prop_letrec_usa_y =
  desugar programaRecursivoFuente == Just programaRecursivoNucleo

-- Reto 4: alcance estatico y evaluacion perezosa --------------------------

prop_lookup_no_exige :: Bool
prop_lookup_no_exige =
  let expresion = ExprV (Add (Num 1) (Num 2)) []
   in lookupEnv "x" [("x", expresion)] == Just expresion

prop_strict_usa_ambiente_guardado :: Int -> Bool
prop_strict_usa_ambiente_guardado n =
  strict (ExprV (Id "x") [("x", NumV n)]) == Just (NumV n)

prop_argumento_no_usado :: Bool
prop_argumento_no_usado =
  bigStep [] (App (Fun "x" (Num 7)) (Id "libre"))
    == Just (NumV 7)

prop_puntos_estrictos :: Bool
prop_puntos_estrictos =
  and
    [ bigStep [] (Add (Id "libre") (Num 1)) == Nothing,
      bigStep [] (Not (Id "libre")) == Nothing,
      bigStep [] (If (Boolean True) (Num 4) (Id "libre"))
        == Just (NumV 4),
      bigStep [] (If (Id "libre") (Num 4) (Num 5)) == Nothing,
      bigStep [] (App (Id "libre") (Num 1)) == Nothing
    ]

prop_alcance_estatico :: Int -> Int -> Int -> Bool
prop_alcance_estatico exterior interior argumento =
  bigStep [] (programaAlcance exterior interior argumento)
    == Just (NumV (exterior + argumento))

prop_resta_permanece_en_naturales ::
  NonNegative (Small Int) -> NonNegative (Small Int) -> Bool
prop_resta_permanece_en_naturales
  (NonNegative (Small n))
  (NonNegative (Small m)) =
    bigStep [] (Sub (Num n) (Num m))
      == Just (NumV (max 0 (n - m)))

-- Reto 5: Y e integracion -------------------------------------------------

prop_evalua_perezosamente :: Bool
prop_evalua_perezosamente =
  evalua "((lambda (x) 7) libre)" == Just (NumV 7)

prop_evalua_if_y_cond :: Bool
prop_evalua_if_y_cond =
  and
    [ evalua "(if #t 4 libre)" == Just (NumV 4),
      evalua "(cond (#f libre) ((not #f) 8) (else otro))"
        == Just (NumV 8)
    ]

prop_evalua_letrec_con_y :: Bool
prop_evalua_letrec_con_y =
  evalua "(letrec (f (lambda (b) (if b 7 (f #t)))) (f #f))"
    == Just (NumV 7)

prop_letrec_no_exige_definicion_no_usada :: Bool
prop_letrec_no_exige_definicion_no_usada =
  evalua "(letrec (loop (lambda (x) (loop x))) 5)"
    == Just (NumV 5)

main :: IO ()
main =
  putStrLn "Reto 1: nuevas palabras reservadas" >>
  quickCheck prop_lexer_nuevas_reservadas >>
  quickCheck prop_lexer_conserva_laboratorio04 >>
  putStrLn "Reto 2: if, cond y letrec" >>
  quickCheck prop_parse_if >>
  quickCheck prop_parse_cond_con_else >>
  quickCheck prop_parse_letrec >>
  putStrLn "Reto 3: desazucarado" >>
  quickCheck prop_currificacion_heredada >>
  quickCheck prop_cond_se_anida_a_la_derecha >>
  quickCheck prop_letrec_usa_y >>
  putStrLn "Reto 4: evaluacion perezosa con alcance estatico" >>
  quickCheck prop_lookup_no_exige >>
  quickCheckWith stdArgs {maxSuccess = 200} prop_strict_usa_ambiente_guardado >>
  quickCheck prop_argumento_no_usado >>
  quickCheck prop_puntos_estrictos >>
  quickCheckWith stdArgs {maxSuccess = 200} prop_alcance_estatico >>
  quickCheckWith stdArgs {maxSuccess = 200} prop_resta_permanece_en_naturales >>
  putStrLn "Reto 5: combinador Y e integracion" >>
  quickCheck prop_evalua_perezosamente >>
  quickCheck prop_evalua_if_y_cond >>
  quickCheck prop_evalua_letrec_con_y >>
  quickCheck prop_letrec_no_exige_definicion_no_usada
