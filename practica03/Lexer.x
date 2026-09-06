{
module Lexer (Token(..), lexer) where

import Data.Char (isSpace)
}

%wrapper "basic"

$white = [\x20\x09\x0A\x0D\x0C\x0B]
$digit = 0-9
$nonzero = 1-9
$letter = [A-Za-z_]
$idrest = [A-Za-z0-9_]

@nat = 0 | $nonzero $digit*

tokens :-

  $white+               ;

  -- Sintaxis heredada del laboratorio 02
  \(                    { \_ -> TokenPA }
  \)                    { \_ -> TokenPC }
  \+                    { \_ -> TokenSuma }
  \-                    { \_ -> TokenResta }
  \*                    { \_ -> TokenMul }
  \/                    { \_ -> TokenDiv }
  "<="                  { \_ -> TokenLE }
  ">="                  { \_ -> TokenGE }
  \<                    { \_ -> TokenLT }
  \>                    { \_ -> TokenGT }
  and                   { \_ -> TokenAnd }
  or                    { \_ -> TokenOr }
  not                   { \_ -> TokenNot }
  add1                  { \_ -> TokenAdd1 }
  sub1                  { \_ -> TokenSub1 }
  "zero?"               { \_ -> TokenZeroP }
  expt                  { \_ -> TokenExpt }
  eq                    { \_ -> TokenEq }

  "#t"                  { \_ -> TokenBool True }
  "#f"                  { \_ -> TokenBool False }

  0$digit+              { \s -> error ("Lexical error: natural con cero inicial = "
                                      ++ show s) }
  @nat                  { \s -> TokenNum (read s) }

  -- RETO 1
  -- Agrega, en el orden correcto, las reglas para:
  --   let, let* e identificadores.

  .                     { \s -> error ("Lexical error: caracter no reconocido = "
                                      ++ show s
                                      ++ " | codepoints = "
                                      ++ show (map fromEnum s)) }

{
data Token
  = TokenId String
  | TokenNum Int
  | TokenBool Bool
  | TokenSuma
  | TokenResta
  | TokenMul
  | TokenDiv
  | TokenAnd
  | TokenOr
  | TokenNot
  | TokenAdd1
  | TokenSub1
  | TokenZeroP
  | TokenExpt
  | TokenLT
  | TokenGT
  | TokenLE
  | TokenGE
  | TokenEq
  | TokenLet
  | TokenLetStar
  | TokenPA
  | TokenPC
  deriving (Eq, Show)

normalizeSpaces :: String -> String
normalizeSpaces = map (\c -> if isSpace c then '\x20' else c)

lexer :: String -> [Token]
lexer = alexScanTokens . normalizeSpaces
}
