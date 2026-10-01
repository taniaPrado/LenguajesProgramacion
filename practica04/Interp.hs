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
  deriving (Eq, Show)

data Value
  = NumV Int
  | BooleanV Bool
  | ClosureV Nombre ASA Env
  deriving (Eq, Show)

type Env = [(Nombre, Value)]

-- RETO 1: desazucarado ----------------------------------------------------

-- Convierte una lista no vacia de parametros distintos en funciones
-- unarias anidadas. El primer parametro queda en la funcion exterior.

-- Verifica si una lista no tiene elementos repetidos
sinDuplicados :: [Nombre] -> Bool
sinDuplicados []     = True
sinDuplicados (x:xs) = not (elem x xs) && sinDuplicados xs


curryFun :: [Nombre] -> ASA -> Maybe ASA
curryFun [] _ = Nothing
curryFun params a
  | not (sinDuplicados params) = Nothing
  | otherwise                  = aux params
  where
    aux [x]    = Just (Fun x a)
    aux (x:xs) =
      let Just subArbol = aux xs
      in Just (Fun x subArbol)
    aux []     = Nothing

-- Convierte una aplicacion con uno o mas argumentos en aplicaciones unarias
-- asociadas por la izquierda.
curryApp :: ASA -> [ASA] -> Maybe ASA

curryApp f [] = Nothing

curryApp f [x] = Just (App f x)

curryApp f (x:xs) = curryApp (App f x) xs

-- Convierte dos o mas operandos en operaciones binarias asociadas por la
-- izquierda. El constructor recibido sera Add o Sub.
binaryOp :: (ASA -> ASA -> ASA) -> [ASA] -> Maybe ASA

binaryOp op [] = Nothing

binaryOp op [x] = Nothing
binaryOp op (x:xs) = Just (foldl op x xs)


-- Convierte las ligaduras de let* en let anidados y despues elimina cada let
-- mediante LetS x e1 e2 ==> App (Fun x e2') e1'. La primera ligadura debe
-- quedar en el let exterior para que las siguientes puedan usarla.
desugar :: SASA -> Maybe ASA

-- Casos base
desugar (NumS n) = Just (Num n)
desugar (IdS x)  = Just (Id x)

desugar (BooleanS b) = Just (Boolean b)

desugar (NotS e) = do
  e' <- desugar e
  Just (Not e')

-- Operaciones binarias

-- ops es la lista
-- map M desugar ops: aplica desugar a cada elemento en la lista y los junta (Maybe [ASA])
-- ops' <- : toma la lista ([ASA])
-- binaryOp: termina de darle estructura

desugar (AddS ops) = do
  ops' <- mapM desugar ops
  binaryOp Add ops'

desugar (SubS ops) = do
  ops' <- mapM desugar ops
  binaryOp Sub ops'

-- Funciones y aplicaciones
desugar (FunS params body) = do
  body' <- desugar body
  curryFun params body'

desugar (AppS f args) = do
  f' <- desugar f
  args' <- mapM desugar args
  curryApp f' args'

-- Ligaduras (LetS y LetStarS)
desugar (LetS x e1 e2) = do
  e1' <- desugar e1
  e2' <- desugar e2
  Just (App (Fun x e2') e1')

desugar (LetStarS [] body) = desugar body
desugar (LetStarS ((x, e):binds) body) = do
  desugar (LetS x e (LetStarS binds body))

desugar _ = Nothing


-- RETO 2: evaluacion con cerraduras ---------------------------------------

-- Busca la asociacion mas reciente de un identificador.
lookupEnv :: Nombre -> Env -> Maybe Value

lookupEnv _ [] = Nothing

lookupEnv x ((y,v) : resto)
    | x == y     = Just v
    | otherwise  = lookupEnv x resto


-- Evalua con alcance estatico. Fun produce una cerradura con el ambiente
-- actual. App evalua primero la posicion de funcion, despues el argumento y
-- por ultimo el cuerpo en el ambiente guardado por la cerradura.
-- La aplicacion es ansiosa: el argumento se exige aunque el cuerpo no lo use.
-- Conserva la resta truncada y la convencion de que todo numero cuenta como
-- verdadero cuando aparece como operando de Not.
bigStep :: Env -> ASA -> Maybe Value

bigStep _ (Num n)      =  Just (NumV n)
bigStep _ (Boolean b)  =  Just (BooleanV b)
bigStep env (Id x)     =  lookupEnv x env
bigStep env (Fun x b)  =  Just (ClosureV x b env)


bigStep env (Add e1 e2) = do
    v1 <- bigStep env e1
    v2 <- bigStep env e2
    case (v1, v2) of
        (NumV n1, NumV n2) -> Just (NumV (n1 + n2))
        _                   -> Nothing


bigStep env (Sub e1 e2) = do
    v1 <- bigStep env e1
    v2 <- bigStep env e2
    case (v1, v2) of
        (NumV n1, NumV n2) -> Just (NumV (max 0 (n1 -n2)))
        _                   -> Nothing


bigStep env (Not e) = do
    v <- bigStep env e
    case v of
        NumV _      -> Just (BooleanV False)
        BooleanV b  -> Just (BooleanV (not b))
        _           -> Nothing


bigStep env (App ef ea) = do
    fv <- bigStep env ef
    av <- bigStep env ea
    case fv of
        ClosureV param body cenv -> bigStep((param, av) : cenv) body
        _                        -> Nothing
