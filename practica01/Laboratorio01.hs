module Laboratorio01 where

-- Ejercicio 1
distanciaOrigen :: Double -> Double -> Double

distanciaOrigen x y  = sqrt (x * x + y * y)

-- Ejercicio 2
sumaCuadradosPares :: [Int] -> Int

sumaCuadradosPares xs =  sum (map (^2) (filter even xs))

-- Ejercicio 3
aplicaTresVeces :: (a -> a) -> a -> a

aplicaTresVeces f x = f(f(f x))

-- Ejercicio 4
varianza2 :: Double -> Double -> Double
varianza2 x y =
    let media = (x + y) / 2
        d1 = x - media
        d2 = y - media
    in (d1 * d1 + d2 * d2) / 2

-- Ejercicio 5
clasificaTemperatura :: Int -> String

clasificaTemperatura n
    | n <= 0  = "frio extremo"
    | n <= 15 = "frio"
    | n <= 25 = "templado"
    | n <= 35 = "calido"
    | otherwise = "calor extremo"

-- Ejercicio 6
intercala :: a -> [a] -> [a]

intercala x [] = []
intercala x [y] =  [y]
intercala x (y:ys) = y : x : intercala x ys

data Expr
  = Lit Int
  | Suma Expr Expr
  | Producto Expr Expr
  deriving (Eq, Show)

-- Ejercicio 7
evalua :: Expr -> Int
evalua (Lit n) = n
evalua (Suma a b) = evalua a + evalua b
evalua (Producto a b) = evalua a * evalua b
