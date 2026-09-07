module Interp where

import Grammars

-- RETO 3: sustitucion nominal que evita captura
freeVars :: ASA -> [String]

freeVars Num = []
freeVars Boolean = []
freeVars Id x = [x]
freeVars Add e1 e2 = freeVars e1 ++ freeVars e2
freeVars Sub e1 e2 = freeVars e1 ++ freeVars e2 
freeVars Let x e1 e2 = freeVars e1 ++ freeVars e2 filter (\= x)     

names :: ASA -> [String]
names = undefined


freshName :: [String] -> String
freshName = undefined

sust :: ASA -> String -> ASA -> ASA
sust = undefined

sustMany :: ASA -> [Binding] -> ASA
sustMany = undefined

-- RETO 4: semantica operacional de paso grande
-- let es simultaneo; let* se evalua directamente, asociacion por asociacion.

bigStep :: ASA -> Maybe ASA
bigStep = undefined