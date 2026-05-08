
// Variables y Template Literals
const nombrePokemon = "Pikachu";
const tipo = "Electrico";
let nivel = 25;

// Funcion tradicional
function describirPokemon(nombre, tipo, nivel) {
let nombre = "Pikachu";
let tipo = "Electrico";
let msg = '${nombre} es de tipo ${tipo} y nivel ${nivel}';

console.log ("Variable nombre" + msg + " " + typeof(msg))
}