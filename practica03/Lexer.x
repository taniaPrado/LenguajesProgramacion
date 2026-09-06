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
    \0                   { \_ -> TokenNum 0 }
    \1                   { \_ -> TokenNum 1 }
    \2                   { \_ -> TokenNum 2 }
    \3                   { \_ -> TokenNum 3 }
    \4                   { \_ -> TokenNum 4 }
    \5                   { \_ -> TokenNum 5 }
    \6                   { \_ -> TokenNum 6 }
    \7                   { \_ -> TokenNum 7 }
    \8                   { \_ -> TokenNum 8 }
    \9                   { \_ -> TokenNum 9 }
    a                    { \_ -> TokenId "a" }
    b                    { \_ -> TokenId "b" }
    c                    { \_ -> TokenId "c" }
    d                    { \_ -> TokenId "d" }
    e                    { \_ -> TokenId "e" }
    f                    { \_ -> TokenId "f" }
    g                    { \_ -> TokenId "g" }
    h                    { \_ -> TokenId "h" }
    i                    { \_ -> TokenId "i" }
    j                    { \_ -> TokenId "j" }
    k                    { \_ -> TokenId "k" }
    l                    { \_ -> TokenId "l" }
    m                    { \_ -> TokenId "m" }
    n                    { \_ -> TokenId "n" }
    o                    { \_ -> TokenId "o" }
    p                    { \_ -> TokenId "p" }
    q                    { \_ -> TokenId "q" }
    r                    { \_ -> TokenId "r" }
    s                    { \_ -> TokenId "s" }
    t                    { \_ -> TokenId "t" }
    u                    { \_ -> TokenId "u" }
    v                    { \_ -> TokenId "v" }
    x                    { \_ -> TokenId "x" }
    y                    { \_ -> TokenId "y" }
    z                    { \_ -> TokenId "z" }
    let                  { \_ -> TokenLet }
    "let*"               { \_ -> TokenLetStar }
    

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
