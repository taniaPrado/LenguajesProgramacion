module Interp where

import Grammars

-- RETO 3: sustitucion nominal que evita captura
freeVars :: ASA -> [String]

freeVars (Num _) = []
freeVars (Boolean _) = []
freeVars (Id x) = [x]

freeVars (Add e) = concat (map freeVars e)
freeVars (Sub e) = concat (map freeVars e)
freeVars (Mul e) = concat (map freeVars e)
freeVars (Div e) = concat (map freeVars e)
freeVars (And e) = concat (map freeVars e)
freeVars (Or e) = concat (map freeVars e)
freeVars (Lt e) = concat (map freeVars e)
freeVars (Gt e) = concat (map freeVars e)
freeVars (Le e) = concat (map freeVars e)
freeVars (Ge e) = concat (map freeVars e)
freeVars (Expt e1 e2) = freeVars e1 ++ freeVars e2
freeVars (EqP e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Not e) = freeVars e
freeVars (Add1 e) = freeVars e
freeVars (Sub1 e) = freeVars e
freeVars (ZeroP e) = freeVars e

freeVars (Let bindings e) = concat (map (freeVars . snd) bindings) ++ filter (\x -> x `notElem` map fst bindings) (freeVars e)

-- binding -> ("fst", snd)

-- concat (map (freeVars . snd) bindings) -> toma el valor de cada binding, es decir, snd y calcula sus variables libres
-- filter (\x -> x `notElem` map fst bindings) (freeVars e) -> toma las variables libres del cuerpo del let, después el primer elemento de cada binding (fst) y
-- utiliza filter para que solo queden las varibles que no esten entre los primeros elementos (fst) de los bindings

freeVars (LetStar bindings e) =
    aux bindings e where
    aux [] e =  freeVars e -- ya no quedan bindings, ahora revisa el cuerpo e del let
    aux ((x,e1):bindings) e = freeVars e1 ++ filter (/= x)  (aux bindings e)

-- aux ((x,e1):bindings) e -> toma el primer binding de la lista de bindings
-- freeVars e1 -> calcula las variables libres del primer binding
-- (aux bindings e) -> recorre los bindings del let
-- filter (/= x) quita de la lista todas las apariciones de x (fst)


names :: ASA -> [String]

names (Num _) = []
names (Boolean _) = []
names (Id x) = [x]

names (Add e) = concat (map names e)
names (Sub e) = concat (map names e)
names (Mul e) = concat (map names e)
names (Div e) = concat (map names e)
names (And e) = concat (map names e)
names (Or e) =  concat (map names e)
names (Lt e) = concat (map names e)
names (Gt e) = concat (map names e)
names (Le e) = concat (map names e)
names (Ge e) = concat (map names e)
names (Expt e1 e2) = names e1 ++ names e2
names (EqP e1 e2) = names e1 ++ names e2
names (Not e) = names e
names (Add1 e) = names e
names (Sub1 e) = names e
names (ZeroP e) = names e

names (Let bindings e) = map fst bindings ++ concat (map (names . snd) bindings) ++ names e
names (LetStar bindings e) = map fst bindings ++ concat (map (names . snd) bindings) ++ names e

-- map fst bindings -> obtiene los nombres de cada fst de cada binding
-- concat (map (names . snd) bindings) -> obtiene los nombres de cada snd de cada binding
-- names e -> nombres del cuerpo e del let


freshName :: [String] -> String
freshName xs = head [x | x <- ["x" ++ show n | n <- [0..]], x `notElem` xs]


sust :: ASA -> String -> ASA -> ASA

sust (Num n) _ _ = Num n
sust (Boolean b) _ _ =  Boolean b
sust (Id y) x s
    | y == x = s
    | otherwise = Id y

sust (Add e) x s = Add (map (\e1 -> sust e1 x s) e)
sust (Sub e) x s = Sub (map (\e1 -> sust e1 x s) e)
sust (Mul e) x s = Mul (map (\e1 -> sust e1 x s) e)
sust (Div e) x s = Div (map (\e1 -> sust e1 x s) e)
sust (And e) x s = And (map (\e1 -> sust e1 x s) e)
sust (Or e) x s = Or (map (\e1 -> sust e1 x s) e)
sust (Lt e) x s = Lt (map (\e1 -> sust e1 x s) e)
sust (Gt e) x s = Gt (map (\e1 -> sust e1 x s) e)
sust (Le e) x s = Le (map (\e1 -> sust e1 x s) e)
sust (Ge e) x s = Ge (map (\e1 -> sust e1 x s) e)
sust (Expt e1 e2) x s = Expt (sust e1 x s) (sust e2 x s)
sust (EqP e1 e2) x s = EqP (sust e1 x s) (sust e2 x s)
sust (Not e) x s = Not (sust e x s)
sust (Add1 e) x s = Add1 (sust e x s)
sust (Sub1 e) x s = Sub1 (sust e x s)
sust (ZeroP e) x s = ZeroP (sust e x s)

sust (Let bindings e) x s
    | x `elem` map fst bindings =
        Let (map (\(y,e1) -> (y, sust e1 x s)) bindings) e
    | otherwise =
        let (bindings', e') = sustLetBody bindings e x s
        in Let bindings' e'

sust (LetStar [] e) x s = LetStar [] (sust e x s)

sust (LetStar ((y,e1):bindings) e) x s
    | y == x =
        LetStar ((y, sust e1 x s) : bindings) e

    | y `elem` freeVars s =
        let z = freshName (names (LetStar bindings e) ++ names s ++ [x, y])
            resto' = sust (LetStar bindings e) y (Id z)
        in case resto' of
             LetStar bindingsRenombrados eRenombrado ->
               LetStar
                 ((z, sust e1 x s)
                   : map (\(w, ew) -> (w, sust ew x s)) bindingsRenombrados)
                 (sust eRenombrado x s)

    | otherwise =
        case sust (LetStar bindings e) x s of
          LetStar bindingsRestantes eRestante ->
            LetStar ((y, sust e1 x s) : bindingsRestantes) eRestante

sustLetBody :: [Binding] -> ASA -> String -> ASA -> ([Binding], ASA)
sustLetBody bindings e x s
    | any (\(y,_) -> y `elem` freeVars s) bindings =
        let y = head [y | (y,_) <- bindings, y `elem` freeVars s]
            z = freshName (names e ++ names s ++ [x, y])
            e' = sust e y (Id z)
            bindings' = map (\(w,e1) -> if w == y
                                         then (z, sust e1 x s)
                                         else (w, sust e1 x s)) bindings
        in (bindings', sust e' x s)
    | otherwise =
        (map (\(w,e1) -> (w, sust e1 x s)) bindings, sust e x s)



sustMany :: ASA -> [Binding] -> ASA
sustMany e bindings =
    let usados = names e ++ concatMap (names . snd) bindings ++ map fst bindings
        temporales = tomaFrescos usados (length bindings)
        paso1 = foldl (\acc ((x,_), t) -> sust acc x (Id t)) e (zip bindings temporales)
        paso2 = foldl (\acc (t, (_,s)) -> sust acc t s) paso1 (zip temporales bindings)
    in paso2

tomaFrescos :: [String] -> Int -> [String]
tomaFrescos _ 0 = []
tomaFrescos usados n =
    let t = freshName usados
    in t : tomaFrescos (t : usados) (n - 1)

-- RETO 4: semantica operacional de paso grande
-- let es simultaneo; let* se evalua directamente, asociacion por asociacion.

bigStep :: ASA -> Maybe ASA
bigStep (Num n) = Just (Num n)
bigStep (Boolean b) = Just (Boolean b)
bigStep (Id _) = Nothing

bigStep (And es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of
                                Boolean _ -> True
                                _ -> False) vs ->
            Just (Boolean (all (\(Boolean b) -> b) vs))
        _ -> Nothing

bigStep (Or es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of
                                Boolean _ -> True
                                _ -> False) vs ->
            Just (Boolean (any (\(Boolean b) -> b) vs))
        _ -> Nothing

bigStep (Add es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            Just (Num (sum [n | Num n <- vs]))
        _ -> Nothing

bigStep (Sub es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            case [n | Num n <- vs] of
                [] -> Nothing
                (n:ns) -> Just (Num (foldl (\a b -> max 0 (a - b)) n ns))
        _ -> Nothing

bigStep (Mul es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            Just (Num (product [n | Num n <- vs]))
        _ -> Nothing

bigStep (Div es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            case [n | Num n <- vs] of
                [] -> Nothing
                (n:ns) ->
                    if any (== 0) ns
                    then Nothing
                    else Just (Num (foldl div n ns))
        _ -> Nothing

bigStep (Lt es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            Just (Boolean (and (zipWith (<) ns (tail ns))))
          where
            ns = [n | Num n <- vs]
        _ -> Nothing

bigStep (Gt es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            Just (Boolean (and (zipWith (>) ns (tail ns))))
          where
            ns = [n | Num n <- vs]
        _ -> Nothing

bigStep (Le es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            Just (Boolean (and (zipWith (<=) ns (tail ns))))
          where
            ns = [n | Num n <- vs]
        _ -> Nothing

bigStep (Ge es) =
    case mapM bigStep es of
        Just vs | all (\v -> case v of Num _ -> True; _ -> False) vs ->
            Just (Boolean (and (zipWith (>=) ns (tail ns))))
          where
            ns = [n | Num n <- vs]
        _ -> Nothing

bigStep (Expt e1 e2) =
    case (bigStep e1, bigStep e2) of
        (Just (Num n), Just (Num m)) -> Just (Num (n ^ m))
        _ -> Nothing

bigStep (EqP e1 e2) =
    case (bigStep e1, bigStep e2) of
        (Just (Num n), Just (Num m)) ->
            Just (Boolean (n == m))
        (Just (Boolean b), Just (Boolean c)) ->
            Just (Boolean (b == c))
        _ -> Nothing

bigStep (Not e) =
    case bigStep e of
        Just (Boolean b) -> Just (Boolean (not b))
        Just (Num _) -> Just (Boolean False)
        Nothing -> Nothing

bigStep (Add1 e) =
    case bigStep e of
        Just (Num n) -> Just (Num (n + 1))
        _ -> Nothing

bigStep (Sub1 e) =
    case bigStep e of
        Just (Num n) -> Just (Num (max 0 (n - 1)))
        _ -> Nothing

bigStep (ZeroP e) =
    case bigStep e of
        Just (Num n) -> Just (Boolean (n == 0))
        _ -> Nothing

bigStep (Let bindings e) =
    if length (map fst bindings)
       /= length (filter (\x -> length [y | y <- map fst bindings, y == x] == 1)
                    (map fst bindings))
    then Nothing
    else
        case mapM (bigStep . snd) bindings of
            Just vs -> bigStep (sustMany e (zip (map fst bindings) vs))
            Nothing -> Nothing

bigStep (LetStar [] e) = bigStep e

bigStep (LetStar ((x,e1):bindings) e) =
    case bigStep e1 of
        Just v -> bigStep (sust (LetStar bindings e) x v)
        Nothing -> Nothing
