<?PHP
/*Ejercicio 3: Batalla por Turnos
    Se pide crear un script en PHP (php-p1-e3.php) capaz de simular un combate automático
entre dos Pokémon hasta que uno de ellos quede fuera de combate.
    Deberás crear la función simularBatalla(array $pkmn1, array $pkmn2): void
que reciba a dos competidores con sus respectivos nombres y puntos de salud iniciales (hp).
    La función debe ejecutar el enfrentamiento por turnos alternados. En cada turno, un
Pokémon atacará al otro restándole una cantidad de puntos de salud e imprimiendo por
pantalla el daño ocasionado y la vida restante del adversario.
    La pelea debe continuar de forma continua mientras ambos contendientes tengan puntos de
vida. En cuanto la salud de cualquiera de los dos caiga a cero (o menos), el combate debe
detenerse inmediatamente y la función debe anunciar formalmente al ganador de la batalla.

Requisitos:
● Se debe utilizar do-while
● Para calcular el daño utilizar la función rand(int $min, int $max): int
● Para determinar el ganador se debe utilizar un operador ternario.

Ejemplo de funcionamiento:
Batalla: Gengar vs Alakazam
    Turno 1:
Gengar ataca a Alakazam causando 20 de daño. (HP de Alakazam: 30)
    Turno 2:
Alakazam ataca a Gengar causando 14 de daño. (HP de Gengar: 36)
    Turno 3:
Gengar ataca a Alakazam causando 22 de daño. (HP de Alakazam: 8)
    Turno 4:
Alakazam ataca a Gengar causando 12 de daño. (HP de Gengar: 24)
    Turno 5:
Gengar ataca a Alakazam causando 24 de daño. (HP de Alakazam: 0)*/



function simularBatalla(array $pkmn1, array $pkmn2): void {
    

    $hp1 = $pkmn1["hp"];
    $hp2 = $pkmn2["hp"];
    $turno = 1;    
    
    do {
        $damage = rand (5,20);
        if ($turno % 2 == 0) {
            $hp1 -= $damage;
            echo "{$pkmn2["nombre"]} ataca a {$pkmn1["nombre"]} causando $damage de daño. (HP de {$pkmn1["nombre"]}: $hp1)\n";
            $turno++;
        } else {
            $hp2 -= $damage;
            echo "{$pkmn1["nombre"]} ataca a {$pkmn2["nombre"]} causando $damage de daño. (HP de {$pkmn2["nombre"]}: $hp2)\n";
            $turno++;  
        }
    } while ($hp1 > 0 && $hp2 > 0) ;
}

$poke1 = [
    "nombre" => "Gengar",
    "hp"=> 50
    ];
$poke2 = [  
    "nombre" => "Alacazam",
    "hp"=> 50
    ];
simularBatalla($poke1, $poke2); 

?>