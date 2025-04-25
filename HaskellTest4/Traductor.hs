module Traductor where
import Data.List (sortBy)
import Data.Char (toLower)
import qualified Data.Map as Mp

--Creación del tipo diccionario Español -> Kaqchikel basado en un mapa
type Diccionario = Mp.Map String String

--Creación de diccionario con palabras simples 
diccionarioBasico :: Diccionario
diccionarioBasico = Mp.fromList [
    ("niño","ak'wal"),
    ("niña","ak'wal"),
    ("pollo","äk'"),
    ("ardilla","kuk"),
    ("zapote","tulul"),
    ("sangre","kik'"),
    ("gracias","matyox"),
    ("araña","öm"),
    ("sol","q'ij"),
    ("gorra","tzatz")
    ]

--Caso de traducción exacta. Tiene de entrada el diccionario y una palabra, el valor de retorno puede ser un String o nada
traduccion :: Diccionario -> String -> Maybe String
traduccion dic palabra = Mp.lookup (map toLower palabra) dic --Revisa que una llave este dentro del mapa declarado

--Recomendación en caso de que no se encuentre la palabra. Se ingresa un diccionario y la palabra, retorna una lista de strings
posiblesPalabras :: Diccionario -> String -> [String]
posiblesPalabras dic palabra =
    let palabras = Mp.keys dic
        similitudes p = length (filter (`elem` p) (map toLower palabra))
    in take 3 $ sortBy (\a b -> compare (similitudes b) (similitudes a)) palabras

--Traducción, función usada dentro del método main, recibe un diccionario y un string
traducir:: Diccionario -> String -> IO()
traducir dic palabra = case traduccion dic palabra of
    Just trad -> putStrLn $ "Traduccion encontrada: "++ palabra ++ " = " ++ trad
    Nothing -> do
        putStrLn $ "La palabra " ++ palabra ++ " no se encontró en el diccionario"
        let sugerencias = posiblesPalabras dic palabra
        if null sugerencias
            then putStrLn "No se encotraron coincidencias"
            else putStrLn $ "¿Era alguna de estas palabras: " ++ unwords sugerencias ++ "?"

main:: IO()
main = do
    putStrLn "--- Traductor Español -> Kaqchikel ---"
    putStrLn "Ingrese una palabra o 'salir' para terminar"
    loop diccionarioBasico
    where 
        loop :: Diccionario -> IO()
        loop dic = do
            input <- getLine
            if map toLower input == "salir"
                then putStrLn "Nos vemos!"
                else do
                    putStrLn "-------------------------------------------------"
                    traducir dic input
                    putStrLn "-------------------------------------------------"
                    loop dic