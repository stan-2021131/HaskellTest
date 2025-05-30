import Data.List (maximumBy)
import Data.Ord (comparing)

-- Función que genera la secuencia de Collatz para un número
collatz :: Integer -> [Integer]
collatz 1 = [1] 
collatz n
    | even n    = n : collatz (n `div` 2)         
    | otherwise = n : collatz (3 * n + 1)        

-- Función que devuelve la longitud de la secuencia
collatzLength :: Integer -> Int
collatzLength = length . collatz

-- Función que devuelve el valor máximo de la secuencia
collatzMax :: Integer -> Integer
collatzMax = maximum . collatz

-- Función que analiza la Conjetura de Collatz en un rango dado
analyzeRange :: Integer -> Integer -> IO ()
analyzeRange start end = do
    let numbers = [start..end] 
        sequences = map collatz numbers  
        lengths = zip numbers (map length sequences)  -- Pares (número, longitud de secuencia)
        maxLengths = maximumBy (comparing snd) lengths  -- Número con secuencia más larga
        maxValues = zip numbers (map maximum sequences)  -- Pares (número, valor máximo en la secuencia)
        maxPeaks = maximumBy (comparing snd) maxValues  -- Número que alcanza el mayor valor en su secuencia
        totalLength = sum (map length sequences)
        count = length numbers
        avgLength = fromIntegral totalLength / fromIntegral count  -- Promedio de longitud

    putStrLn $ "Número con la secuencia más larga: " ++ show (fst maxLengths)
             ++ " (longitud: " ++ show (snd maxLengths) ++ ")"
    putStrLn $ "Número con el valor más alto en su secuencia: " ++ show (fst maxPeaks)
             ++ " (máximo: " ++ show (snd maxPeaks) ++ ")"
    putStrLn $ "Promedio de longitud de las secuencias: " ++ show avgLength

main :: IO ()
main = do
    putStrLn "Analizando la Conjetura de Collatz en el rango 1 a 10..."
    analyzeRange 1 10
