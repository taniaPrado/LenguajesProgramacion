{
module Grammars where

import Lexer (Token(..))
}

%name parse
%tokentype { Token }
%error { parseError }

%token
      var             { TokenId $$ }
      nat             { TokenNum $$ }
      bool            { TokenBool $$ }
      '+'             { TokenSuma }
      '-'             { TokenResta }
      "not"           { TokenNot }
      "let"           { TokenLet }
      "let*"          { TokenLetStar }
      "lambda"        { TokenLambda }
      '('             { TokenPA }
      ')'             { TokenPC }

%%

SASA : var                               { IdS $1 }
     | nat                               { NumS $1 }
     | bool                              { BooleanS $1 }
     | '(' '+' Operands ')'              { AddS $3 }
     | '(' '-' Operands ')'              { SubS $3 }
     | '(' "not" SASA ')'                { NotS $3 }
     | '(' "let" '(' var SASA ')' SASA ')'
                                         { LetS $4 $5 $7 }
     | '(' "let*" '(' Bindings ')' SASA ')'
                                         { LetStarS $4 $6 }
     | '(' "lambda" '(' Params ')' SASA ')'
                                         { FunS $4 $6 }
     | '(' SASA Arguments ')'            { AppS $2 $3 }

Params : var                             { [$1] }
       | var Params                      { $1 : $2 }

Arguments : SASA                         { [$1] }
          | SASA Arguments               { $1 : $2 }

Operands : SASA SASA                     { [$1, $2] }
         | SASA Operands                 { $1 : $2 }

Bindings : '(' var SASA ')'              { [($2, $3)] }
         | '(' var SASA ')' Bindings     { ($2, $3) : $5 }

{
parseError :: [Token] -> a
parseError tokens = error ("Parse error: " ++ show tokens)

type Nombre = String

data SASA
  = IdS Nombre
  | NumS Int
  | BooleanS Bool
  | AddS [SASA]
  | SubS [SASA]
  | NotS SASA
  | LetS Nombre SASA SASA
  | LetStarS [(Nombre, SASA)] SASA
  | FunS [Nombre] SASA
  | AppS SASA [SASA]
  deriving (Eq, Show)
}
