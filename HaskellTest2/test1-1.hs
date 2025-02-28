module Main where
import qualified Data.Set as Set
import qualified Data.Map as Map

--Ejemplo de lista
marcasDeAutos::[String]
marcasDeAutos = ["Kia", "Toyota", "Ferrari"]

--Ejemplo de tuplas (Marca de telefono, número de teléfono)
telefono::(String,Int)
telefono = ("Samsung", 57694710)

--Ejemplo de matrices
ejMatriz::[[Int]]
ejMatriz = [[1,2,3], [3,2,8]]

--Ejemplo de set
digitos:: Set.Set Int
digitos = Set.fromList[0,1,2,3,4,5,6,7,8,9]


--Ejemplo de map
edadesFamilia:: Map.Map String Int
edadesFamilia = Map.fromList[("papá", 41), ("mamá", 41), ("hermano", 16), ("hermana", 16), ("yo", 21)]

--Ejemplo de maybe
dividirConMaybe::Float->Float->Maybe Float
dividirConMaybe _ 0 = Nothing
dividirConMaybe x y = Just (x/y)

--Ejemplo de maybe
dividirConEither::Float->Float->Either String Float
dividirConEither _ 0 = Left "No se puede dividir con 0"
dividirConEither x y = Right (x/y)

main::IO()
main = do
    putStrLn "Ejemplo de lista: Marcas de autos"
    print marcasDeAutos

    putStrLn "Ejemplo de Tupla: Teléfono y número"
    print telefono

    putStrLn "Ejemplo de Matriz"
    print ejMatriz

    putStrLn "Ejemplo de set: Digitos del 0 al 9"
    print digitos

    putStrLn "Ejemplo de map: Miembros de mi familia y edades"
    print edadesFamilia

-- Maybe y Either tienen el mismo método para ver funcionamiento que tienen
    putStrLn "Ejemplo de maybe: Divisiones"
    print (dividirConMaybe 10 2)
    print (dividirConMaybe 10 0)

    putStrLn "Ejemplo de either: Divisiones"
    print (dividirConEither 10 2)
    print (dividirConEither 10 0)