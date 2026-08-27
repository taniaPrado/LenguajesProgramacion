{
module Lexer (Token(..), lexer) where

import Data.Char (isSpace)
}

%wrapper "basic"

$white = [\x20\x09\x0A\x0D\x0C\x0B]
$digit = 0-9
$nonzero = 1-9

@nat = 0 | $nonzero $digit*

tokens :-

  $white+               ;

  -- Tokens ya presentes en MINILISP01
  \(                    { \_ -> TokenPA }
  \)                    { \_ -> TokenPC }
  \+                    { \_ -> TokenSuma }
  \-                    { \_ -> TokenResta }
  not                   { \_ -> TokenNot }

  "#t"                  { \_ -> TokenBool True }
  "#f"                  { \_ -> TokenBool False }

  0$digit+              { \s -> error ("Lexical error: natural con cero inicial = "
                                      ++ show s) }
  @nat                  { \s -> TokenNum (read s) }

  -- RETO 1:
  -- Agrega aqui las reglas lexicas para:
  --   and, or, *, /, expt, <, >, <=, >=, eq, add1, sub1, zero?
  -- Recuerda reconocer <= y >= como tokens completos.

  .                     { \s -> error ("Lexical error: caracter no reconocido = "
                                      ++ show s
                                      ++ " | codepoints = "
                                      ++ show (map fromEnum s)) }

{
data Token
  = TokenNum Int
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
  | TokenPA
  | TokenPC
  deriving (Eq, Show)

normalizeSpaces :: String -> String
normalizeSpaces = map (\c -> if isSpace c then '\x20' else c)

lexer :: String -> [Token]
lexer = alexScanTokens . normalizeSpaces
}
