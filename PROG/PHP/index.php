<?php

echo "Hola <br> \n Chau";

$pokemon = "Pikachu";
$nivel = 25;
$altura = 0.4;
$legendario = false;

echo "Variable pokemon: $pokemon\n";
// '' comilla simple string literal
// "" comilla doble interpreta valors de variables
// . para concatenar strings
// \n salto de lìnea (en consola)
echo 'El valor de la variable $pokemon es'. " $pokemon\n";

echo "El tipo de la vaeriable pokemon es: ".gettype($pokemon)."\n";
echo "El tipo de la vaeriable nivel es: ".gettype($nivel)."\n";
echo "El tipo de la vaeriable altura es: ".gettype($altura)."\n";
echo "El tipo de la vaeriable legendario es: ".gettype($legendario)."\n";
$arr = array(1,2,3);
echo 'El tipo de la variable $arr es: '.gettype($arr)."\n";

var_dump($pokemon);
var_dump($nivel);
var_dump($altura);
var_dump($legendario);
var_dump($arr);

$pokemones = ["Pikachu", "Charizard", "Bulbasaur"];
foreach ($pokemones as $p ) {
    echo "$p\n";
}
foreach ($pokemones as $index => $p)  {
    echo "$index: $p\n";
}
in_array("Pikachu", $pokemones);

$pokepoke = [
    "nombre"=> "Pikachu",
    "tipo"=> "Elèctrico",
    "nivel"=> 25
];
foreach ($pokepoke as $clave => $valor) {
    echo "$clave: $valor\n";
}

?>