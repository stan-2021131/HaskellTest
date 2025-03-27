module BinarySearch where
import Text.XHtml (input)

main:: IO()
main = do
    putStrLn "Bienvenido al buscador binario"
    dato <- initGame
    binSe dato 1 100 -- Límites para iniciar el juego

initGame :: IO Int
initGame = do
    putStrLn "Ingrese un número entre el rango de 1 y 100"
    input <- getLine
    return (read input :: Int)

binSe :: Int -> Int -> Int -> IO()
binSe valEvaluar limInf limSup = do
    let mitad = (limInf + limSup) `div` 2
    putStrLn ("El valor que ingresaste es: " ++ show mitad ++ "(1. Si 2. No)")
    selection <- getLine
    if selection == "1" 
        then if valEvaluar == mitad 
            then putStrLn "Valor encontrado, juego terminado!!!"
            else putStrLn "Mentiroso, este no es el valor"
    else if selection == "2" 
        then do
            putStrLn "¿El valor es mayor o menor? (1.Mayor 2.Menor)"
            selection2 <- getLine
            if selection2 == "1" 
                then if valEvaluar > mitad
                    then binSe valEvaluar (mitad + 1) limSup
                    else putStrLn "Mentiroso, por aquí no es"
                else if selection2 == "2" 
                    then if valEvaluar < mitad
                        then binSe valEvaluar limInf (mitad-1)
                        else putStrLn "Mentiroso, por aquí no es"
                else putStrLn "Opción no valida"
    else putStr "Opción no valida, intente de nuevo"