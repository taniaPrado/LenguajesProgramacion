{
module Grammars where

import Lexer (Token(..), lexer)
}

%name parse
%tokentype { Token }
%error { parseError }

%token
      nat             { TokenNum $$ }
      bool            { TokenBool $$ }
      '+'             { TokenSuma }
      '-'             { TokenResta }
      '*'             { TokenMul }
      '/'             { TokenDiv }
      "and"           { TokenAnd }
      "or"            { TokenOr }
      "not"           { TokenNot }
      "add1"          { TokenAdd1 }
      "sub1"          { TokenSub1 }
      "zero?"         { TokenZeroP }
      "expt"          { TokenExpt }
      '<'             { TokenLT }
      '>'             { TokenGT }
      "<="            { TokenLE }
      ">="            { TokenGE }
      "eq"            { TokenEq }
      '('             { TokenPA }
      ')'             { TokenPC }

%%

ASA : nat                      { Num $1 }
    | bool                     { Boolean $1 }

-- RETO 2:
-- Agrega las producciones para:
--   * operadores n-arios con al menos dos argumentos;

    | '(' '+' Args ')'    { Add $3}
    | '(' '-' Args ')'    { Sub $3}
    | '(' '*' Args ')'    { Mul $3}
    | '(' '/' Args ')'    { Div $3}
    | '(' "and" Args ')'  { And $3}
    | '(' "or" Args ')'   { Or $3}
    | '(' '<' Args ')'    { Lt $3}
    | '(' '>' Args ')'    { Gt $3}
    | '(' "<=" Args ')'   { Le $3}
    | '(' ">=" Args ')'   { Ge $3}

--   * operadores estrictamente binarios: expt y eq;

    | '(' "expt" ASA ASA ')'   { Expt $3 $4}
    | '(' "eq" ASA ASA ')'         { EqP $3 $4}

--   * operadores unarios: not, add1, sub1, zero?.

    | '(' "not" ASA ')'   { Not $3}
    | '(' "add1" ASA ')'  { Add1 $3}
    | '(' "sub1" ASA ')'  { Sub1 $3}
    | '(' "zero?" ASA ')' { ZeroP $3}

-- RETO 3:
-- Agrega un no terminal para representar dos o mas argumentos.
-- El resultado debe ser una lista de ASA.

Args : ASA ASA    { [$1, $2] }
     | ASA Args   { $1 : $2 }

{
parseError :: [Token] -> a
parseError toks = error ("Parse error: " ++ show toks)

data ASA
  = Num Int
  | Boolean Bool
  | And [ASA]
  | Or [ASA]
  | Add [ASA]
  | Sub [ASA]
  | Mul [ASA]
  | Div [ASA]
  | Lt [ASA]
  | Gt [ASA]
  | Le [ASA]
  | Ge [ASA]
  | Expt ASA ASA
  | EqP ASA ASA
  | Not ASA
  | Add1 ASA
  | Sub1 ASA
  | ZeroP ASA
  deriving (Eq, Show)
}
