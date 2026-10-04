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
      "if"            { TokenIf }
      "cond"          { TokenCond }
      "else"          { TokenElse }
      "letrec"        { TokenLetRec }
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

     -- RETO 2
     -- Agrega aqui las producciones de:
     --   (if <condicion> <consecuente> <alternativa>)
     --   (cond (<condicion> <rama>) ... (else <alternativa>))
     --   (letrec (<nombre> <definicion>) <cuerpo>)
     --
     -- Un cond debe contener al menos una clausula ordinaria y terminar
     -- siempre con una clausula else. Consume la primera clausula ordinaria
     -- en la produccion de cond y define un no terminal Clauses para las
     -- clausulas restantes y el else final.

     | '(' "if" SASA SASA SASA ')'             { IfS $3 $4 $5 }
     | '(' "cond" '(' SASA SASA ')' Clauses ')'  { CondS (($4, $5) : fst $7) (snd $7) }
     | '(' "letrec" '(' var SASA ')' SASA ')'  {LetRecS $4 $5 $7 }

Clauses : '(' "else" SASA ')' { ([], $3) }
        | '(' SASA SASA ')' Clauses { (($2, $3) : (fst $5), snd $5) }

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
  | IfS SASA SASA SASA
  | CondS [(SASA, SASA)] SASA
  | LetRecS Nombre SASA SASA
  deriving (Eq, Show)
}
