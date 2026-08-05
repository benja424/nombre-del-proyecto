<?php
/*
1. Crea una función llamada evaluarEquipo(array $equipo): void
2. Dentro de la función, recorre el array $equipo utilizando un bucle foreach
3. Para cada Pokémon, utiliza el operador de fusión nula (??) para asignarle el apodo
almacenado en el array o el valor por defecto "Sin Apodo" si es null o no existe.
4. Ahora debes indicar en qué categoría está el Pokémon: cuando el nivel sea 50 o
mayor su categoría es “Elite”, cuando su nivel sea mayor o igual a 20 su categoría es
“Intermedio” y en el caso que sea menor a 20 entonces es “Principiante”.
5. Utiliza el operador ternario para determinar, en el listado, cuando el Pokémon está
listo para evolucionar (se considera listo cuando el nivel es mayor o igual a 16).
6. Muestra en pantalla el resumen de cada Pokémon. Podés probar con el siguiente
array:
*/

$miEquipo = [
    ["nombre" => "Pikachu", "nivel" => 25, "apodo" => "Chispas"],
    ["nombre" => "Charizard", "nivel" => 55],
    ["nombre" => "Caterpie", "nivel" => 8, "apodo" => "Pepe"]
];
$apodo = "";
function evaluarEquipo(array $equipo): void {
    foreach ($equipo as $pokemon) {

        $apodo = $pokemon["apodo"] ?? "Sin apodo";
        
        if ($pokemon ["nivel"] >= 50) {
            $categoria = "Elite";
           } elseif ($pokemon ["nivel"] >= 20) {
                $categoria = "Intermedio";
            } else {
                $categoria = "Principiante";
            }
        $evolucionar = ($pokemon["nivel"] >= 16) ? "Si":"No";
        // pokemon: Pikachu (Chispas) | Nivel: 25 | Categorìa: Intermedio | ¿Evolucion Lista?: Si
       // echo "Pokèmon: ". $pokemon["nombre"] . "(".$apodo.") | Nivel: ".$pokemon["nivel"]." | Categorìa: ".$categoria." | ¿Evolucion Lista?: ".$evolucionar."\n";
        echo "Pokèmon: {$pokemon["nombre"]} ($apodo) | Nivel: {$pokemon["nivel"]} | Categorìa: $categoria | ¿Evolucion Lista?: $evolucionar \n";
    }
}
evaluarEquipo($miEquipo);

/*Instrucciones:
1. Define la función entrenarPokemon(string $nombre, int $nivelInicial,
int $nivelObjetivo, string $tipoEntrenamiento): void
2. Ejemplo de llamada a la función:
entrenarPokemon("Bulbasaur", 5, 20, "medio");
3. Los entrenamientos disponibles son:
a. “suave”: suma 1 nivel
b. “medio”: suma 2 niveles
c. “intenso”: suma 5 niveles
4. Se debe informar, con un mensaje, cada vez que el nivel sea múltiplo de 10.
5. Se debe imprime por pantalla el progreso en cada iteración y el resultado final
alcanzado.*/
/*function  entrenarPokemon(string $nombre, int $nivelInicial,
int $nivelObjetivo, string $tipoEntrenamiento): void {
    if ($nivelInicial <= 21 ) {
        if ($tipoEntrenamiento == "suave") {
            $nivelInicial++;
            echo "¡$nombre ahora es nivel $nivelInicial!!";
        } else if ($tipoEntrenamiento == "medio") {
            for ($i = 0; $i < 2; $i++) {
                echo "\nAhora tu $nombre paso de nivel: $nivelInicial";
                $nivelInicial++;
                echo " a nivel: $nivelInicial";
                if ($nivelInicial == 10 || $nivelInicial == 20) {
                echo "\n¡¡$nombre ahora es nivel $nivelInicial!!";
                }
            } 
        } else if ($tipoEntrenamiento == "intenso") {
            $nivelInicial = $nivelInicial + 5;
            echo "¡$nombre ahora es nivel $nivelInicial!!";
        } else {
            echo "ingrese un tipo de entrenamiento válido";
        }
    } else {
        echo "$nombre ya es muy fuerte para este entrenamiento!!";
    }
}
entrenarPokemon("Bulbasaur", 8, 20, "medio");
*/
function  entrenarPokemon(string $nombre, int $nivelInicial,
int $nivelObjetivo, string $tipoEntrenamiento): void {
    $nivelActual = $nivelInicial;
    while ($nivelActual < $nivelObjetivo) {
        if ($tipoEntrenamiento == "suave") {
            $nivelActual++ ;
        } elseif ($tipoEntrenamiento == "medio") {
            $nivelActual += 2;
        } elseif ($tipoEntrenamiento == "intenso") {
            if ($nivelActual += 5 >= $nivelObjetivo) {
                $nivelActual++;
            } else {
            $nivelActual += 5;
        }
        } else {
            echo "Entrenamiento no válido\n";
            break;
        }
        if ($nivelActual % 10 == 0) {
            echo "$nombre ha alcanzado el nivel $nivelActual\n";
        }
        echo "$nombre ha alcanzado el nivel $nivelActual\n";
    }
}
//entrenarPokemon("Bulbasaur", 8, 20, "medio");
entrenarPokemon("Bulbasaur", 8, 100, "intenso");


?>