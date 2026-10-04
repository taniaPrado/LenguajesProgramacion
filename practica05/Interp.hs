module Interp where

import Grammars

data ASA
  = Id Nombre
  | Num Int
  | Boolean Bool
  | Add ASA ASA
  | Sub ASA ASA
  | Not ASA
  | Fun Nombre ASA
  | App ASA ASA
  | If ASA ASA ASA
  deriving (Eq, Show)

data Value
  = NumV Int
  | BooleanV Bool
  | ClosureV Nombre ASA Env
  | ExprV ASA Env
  deriving (Eq, Show)

type Env = [(Nombre, Value)]


-- RETO 3: desazucarado ----------------------------------------------------

-- Recupera estas funciones del laboratorio 4. Las funciones y aplicaciones
-- del nucleo siguen siendo unarias, y las operaciones siguen siendo binarias.

sinDuplicados :: [Nombre] -> Bool
sinDuplicados [] = True
sinDuplicados (x:xs) = not (elem x xs) && sinDuplicados xs

curryFun :: [Nombre] -> ASA -> Maybe ASA

curryFun [] _ = Nothing
curryFun params a
  | not (sinDuplicados params) = Nothing
  | otherwise = aux params
  where
    aux [x] = Just (Fun x a)
    aux (x:xs) =
      let Just subArbol = aux xs
      in Just (Fun x subArbol)
    aux [] = Nothing


curryApp :: ASA -> [ASA] -> Maybe ASA

curryApp f [] = Nothing

curryApp f [x] = Just (App f x)
curryApp f (x:xs) = curryApp (App f x) xs

binaryOp :: (ASA -> ASA -> ASA) -> [ASA] -> Maybe ASA

binaryOp op [] = Nothing

binaryOp op [x] = Nothing
binaryOp op (x:xs) = Just (foldl op x xs)


-- Desazucara las clausulas ordinarias de cond en If anidados. La alternativa
-- else es el ultimo argumento y se conserva como la rama final.

-- Rregresa Just [ASA] solo si todos los elementos son Just sino regresa Nothing

extraerMaybes :: [Maybe ASA] -> Maybe [ASA]
extraerMaybes [] = Just []
extraerMaybes (mx : mxs) =    --mx: es el primer elemento de la lista (de tipo Maybe ASA) y mxs: el resto de la lista (de tipo [Maybe ASA])
  let mmxs = extraerMaybes mxs -- llama recursivamente a extraerMaybes con el resto de la list
  in if mx /= Nothing && mmxs /= Nothing --asegura que tanto la cabeza como el resto sean válidos
     then let Just x = mx  --de ser un Maybe ASA pasa a ser un ASA
              Just xs = mmxs --de ser un Maybe ASA pasa a ser un ASA
          in Just (x : xs) -- forma la lista completa como un ASA
     else Nothing

desugarCond :: [(SASA, SASA)] -> SASA -> Maybe ASA

desugarCond [] e3 = desugar e3

desugarCond ((c1, e1) : xs) e3 =
  let mc1 = desugar c1
      me1 = desugar e1
      mresto = desugarCond xs e3
  in if mc1 /= Nothing && me1 /= Nothing && mresto /= Nothing
     then let Just c1' = mc1
              Just e1' = me1
              Just resto' = mresto
          in Just (If c1' e1' resto')
     else Nothing

-- Elimina toda la sintaxis superficial. CondS se traduce a If anidados.
-- LetRecS f definicion cuerpo se traduce usando el identificador Y:
--
--   LetS f (AppS (IdS "Y") (FunS [f] definicion)) cuerpo
--
-- y despues se elimina tambien ese LetS. LetRecS no pertenece al nucleo.

desugar :: SASA -> Maybe ASA

-- todo lo que comienza con un "m..." , es porque al aplicar desugar pasa a ser un Maybe ASA
-- todo lo que tiene un (') es porque pasa a ser un ASA

--Casos base

desugar (NumS n) = Just (Num n)
desugar (IdS x) = Just (Id x)
desugar (BooleanS b) = Just (Boolean b)

desugar (NotS e) =
  let me = desugar e
  in if me /= Nothing
     then let Just e' = me
          in Just (Not e')
     else Nothing

-- Operaciones binarias

desugar (AddS ops) =
  let mops = extraerMaybes (map desugar ops)
  in if not (null ops) && mops /= Nothing
     then let Just ops' = mops
          in Just (foldl1 Add ops')
     else Nothing

desugar (SubS ops) =
  let mops = extraerMaybes (map desugar ops)
  in if not (null ops) && mops /= Nothing
     then let Just ops' = mops
          in Just (foldl1 Sub ops')
     else Nothing

--Funciones y aplicaciones
desugar (LetS x e1 e2) =
  let me1 = desugar e1
      me2 = desugar e2
  in if me1 /= Nothing && me2 /= Nothing
     then let Just e1' = me1
              Just e2' = me2
          in Just (App (Fun x e2') e1')
     else Nothing

desugar (LetStarS [] body) = desugar body
desugar (LetStarS ((x, e):binds) body) =
  let mSubLet = desugar (LetStarS binds body)
      me = desugar e
  in if me /= Nothing && mSubLet /= Nothing
     then let Just e' = me
              Just subLet' = mSubLet
          in Just (App (Fun x subLet') e')
     else Nothing

desugar (FunS params body) =
  let mBody = desugar body
  in if not (null params) && mBody /= Nothing
     then let Just body' = mBody
          in curryFun params body'
     else Nothing

desugar (AppS f args) =
  let mf = desugar f
      margs = extraerMaybes (map desugar args)
  in if not (null args) && mf /= Nothing && margs /= Nothing
     then let Just f' = mf
              Just args' = margs
          in curryApp f' args'
     else Nothing

desugar (IfS c t e) =   --c = cond, t = then, e = else
  let mcond = desugar c
      mthen = desugar t
      melse = desugar e
  in if mcond /= Nothing && mthen /= Nothing && melse /= Nothing
     then let Just c' = mcond
              Just t' = mthen
              Just e' = melse
          in Just (If c' t' e')
     else Nothing

desugar (CondS [] e3) = desugar e3
desugar (CondS ((c1, e1): xs) e3) =
  let mc1 = desugar c1
      me1 = desugar e1
      mIf = desugar (CondS xs e3)
  in if mc1 /= Nothing && me1 /= Nothing && mIf /= Nothing
     then let Just c1' = mc1
              Just e1' = me1
              Just if' = mIf
          in Just (If c1' e1' if')
     else Nothing

desugar (LetRecS f e c) =
  let equivalenteSASA = LetS f (AppS (IdS "Y") [FunS [f] e]) c
  in desugar equivalenteSASA


-- RETO 4: evaluacion perezosa con alcance estatico ------------------------

-- Busca la asociacion mas reciente sin exigir su contenido.
lookupEnv :: Nombre -> Env -> Maybe Value
lookupEnv = lookup

-- Exige una cerradura de expresion usando el ambiente guardado. Si al
-- evaluarla se obtiene otra ExprV, continua hasta producir otro valor.
strict :: Value -> Maybe Value
strict (ExprV e env) = bigStep env e >>= strict
strict v = Just v

-- Semantica de paso grande con alcance estatico y evaluacion perezosa.
--
-- * Id devuelve directamente la asociacion encontrada.
-- * Fun produce ClosureV con el ambiente de definicion.
-- * App exige la posicion de funcion, pero liga el argumento como
--   ExprV argumento ambienteDeLaLlamada.
-- * Add, Sub y Not exigen sus operandos.
-- * If exige solamente la condicion y evalua una sola rama.
--
-- La resta sobre naturales permanece truncada en cero.
bigStep :: Env -> ASA -> Maybe Value

bigStep env (Id x) = lookupEnv x env

bigStep _ (Num n) = Just (NumV n)

bigStep _ (Boolean b) = Just (BooleanV b)

bigStep env (Add a b) = do
    x <- exigeNum env a
    y <- exigeNum env b
    Just (NumV (x + y))

bigStep env (Sub a b) = do
    x <- exigeNum env a
    y <- exigeNum env b
    Just (NumV (max 0 (x - y)))

bigStep env (Not e) = do
    b <- exigeBool env e
    Just (BooleanV (not b))

bigStep env (Fun x cuerpo) = Just (ClosureV x cuerpo env)

bigStep env (App f arg) = do
    funcion <- bigStep env f >>= strict
    case funcion of
        ClosureV x cuerpo envClausura ->
            bigStep ((x, ExprV arg env) : envClausura) cuerpo
        _ -> Nothing

bigStep env (If c t e) = do
    b <- exigeBool env c
    if b then bigStep env t else bigStep env e

--Auxiliares

exigeNum :: Env -> ASA -> Maybe Int
exigeNum env e = do
    v <- bigStep env e >>= strict
    case v of
        NumV n -> Just n
        _ -> Nothing

exigeBool :: Env -> ASA -> Maybe Bool
exigeBool env e = do
    v <- bigStep env e >>= strict
    case v of
        BooleanV b -> Just b
        _ -> Nothing
