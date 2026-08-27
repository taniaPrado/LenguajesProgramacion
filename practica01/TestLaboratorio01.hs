module Main where

import Data.List (intersperse)
import Laboratorio01
import Test.QuickCheck

aprox :: Double -> Double -> Bool
aprox x y = abs (x - y) <= 1e-7

prop_distanciaOrigen :: Small Int -> Small Int -> Property
prop_distanciaOrigen (Small x) (Small y) =
  let dx = fromIntegral x
      dy = fromIntegral y
      d = distanciaOrigen dx dy
      esperado = dx * dx + dy * dy
   in counterexample ("distanciaOrigen " ++ show dx ++ " " ++ show dy ++ " = " ++ show d) $
        d >= 0 .&&. aprox (d * d) esperado

prop_sumaCuadradosPares :: [Small Int] -> Bool
prop_sumaCuadradosPares xs =
  let ys = map getSmall xs
   in sumaCuadradosPares ys == sum [n * n | n <- ys, even n]

prop_aplicaTresVeces_suma :: Small Int -> Bool
prop_aplicaTresVeces_suma (Small x) =
  aplicaTresVeces (+ 1) x == x + 3

prop_aplicaTresVeces_not :: Bool -> Bool
prop_aplicaTresVeces_not b =
  aplicaTresVeces not b == not b

prop_varianza2 :: Small Int -> Small Int -> Property
prop_varianza2 (Small x) (Small y) =
  let dx = fromIntegral x
      dy = fromIntegral y
      media = (dx + dy) / 2
      esperado = ((dx - media) ^ (2 :: Int) + (dy - media) ^ (2 :: Int)) / 2
      obtenido = varianza2 dx dy
   in counterexample ("varianza2 " ++ show dx ++ " " ++ show dy ++ " = " ++ show obtenido) $
        obtenido >= 0 .&&. aprox obtenido esperado .&&. aprox obtenido (varianza2 dy dx)

clasificaRef :: Int -> String
clasificaRef t
  | t <= 0 = "frio extremo"
  | t <= 15 = "frio"
  | t <= 25 = "templado"
  | t <= 35 = "calido"
  | otherwise = "calor extremo"

prop_clasificaTemperatura :: Int -> Bool
prop_clasificaTemperatura t =
  clasificaTemperatura t == clasificaRef t

prop_intercala :: Int -> [Int] -> Bool
prop_intercala sep xs =
  intercala sep xs == intersperse sep xs

evalRef :: Expr -> Int
evalRef (Lit n) = n
evalRef (Suma e1 e2) = evalRef e1 + evalRef e2
evalRef (Producto e1 e2) = evalRef e1 * evalRef e2

instance Arbitrary Expr where
  arbitrary = sized genExpr
    where
      genExpr 0 = Lit . getSmall <$> arbitrary
      genExpr n =
        oneof
          [ Lit . getSmall <$> arbitrary,
            Suma <$> genExpr (n `div` 2) <*> genExpr (n `div` 2),
            Producto <$> genExpr (n `div` 2) <*> genExpr (n `div` 2)
          ]

  shrink (Lit n) = [Lit n' | n' <- shrink n]
  shrink (Suma e1 e2) =
    [e1, e2]
      ++ [Suma e1' e2 | e1' <- shrink e1]
      ++ [Suma e1 e2' | e2' <- shrink e2]
  shrink (Producto e1 e2) =
    [e1, e2]
      ++ [Producto e1' e2 | e1' <- shrink e1]
      ++ [Producto e1 e2' | e2' <- shrink e2]

prop_evalua :: Expr -> Bool
prop_evalua e =
  evalua e == evalRef e

main :: IO ()
main = do
  putStrLn "Reto 1: tipos basicos"
  quickCheck prop_distanciaOrigen
  putStrLn "Reto 2: funciones predefinidas"
  quickCheck prop_sumaCuadradosPares
  putStrLn "Reto 3: definicion de funciones"
  quickCheck prop_aplicaTresVeces_suma
  quickCheck prop_aplicaTresVeces_not
  putStrLn "Reto 4: expresiones let y where"
  quickCheck prop_varianza2
  putStrLn "Reto 5: condicional if y guardias"
  quickCheck prop_clasificaTemperatura
  putStrLn "Reto 6: recursion en listas"
  quickCheck prop_intercala
  putStrLn "Reto 7: definicion de tipos"
  quickCheck prop_evalua
