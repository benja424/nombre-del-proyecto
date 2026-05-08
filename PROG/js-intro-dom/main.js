console.log("Hola Mundo desde archivo js");

/**/
let saludo = "Hola ¿Como estas?";
let num = 25;
let num_coma = 2.5;
let existe = true;

console.log("Variable saludo " + saludo + " " + (typeof saludo))
console.log("Variable num " + num + " " + (typeof num))
console.log("Variable num_coma " + num_coma + " " + (typeof num_coma))
console.log("Variable existe " + existe + " " + (typeof existe))



/* typeof es una funcion que nos indica el tipo 
de la variable en ese momento de la ejecucion */

const parrafo = document.getElementById("txt");
// parrafo.textContent = "Cambiando texto desde js"
/* ----------------------------------------------------------- */
var nombre = "Omar";
console.log(nombre);
var nombre = "Javier";
console.log(nombre);
let apellido = "Garrido";
console.log(apellido);
apellido = "Barrido";
console.log(apellido);
/*Forma de armar strings: */
// console.log('Su nombre es #[nombre] y su apellido es #{apellido}');

function saludar (nombre){
    return `Hola ${nombre}`;
}
const saludo2 = (nombre) => {
    return `Hola ${nombre}`;
}
console.log (saludar('Maria'));
console.log (saludo2('Juan'));
/* Objeto Literal */

const pokemon = {
    nombre: 'pikachu',
    tipo: 'electrico'
}
console.log(pokemon.nombre);
/* ----------------------------------------------------------- */
const boton = document.getElementById ("btn");
boton.addEventListener("click", () => {
    parrafo.textContent = "Cambiando texto desde js";  
}); 

document.getElementById("btn-error").addEventListener("click", () => {
    alert("Error 404");
    document.getElementsByClassName("texto").textContent = "Hola?";
});