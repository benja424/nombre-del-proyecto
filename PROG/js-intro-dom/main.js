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

// function saludar (nombre){
//     return `Hola ${nombre}`;
// }
// const saludo2 = (nombre) => {
//     return `Hola ${nombre}`;
// }
// console.log (saludar('Maria'));
// console.log (saludo2('Juan'));
// /* Objeto Literal */

// const pokemon = {
//     nombre: 'pikachu',
//     tipo: 'electrico'
// }
// console.log(pokemon.nombre);
// /* ----------------------------------------------------------- */
// const boton = document.getElementById ("btn");
// boton.addEventListener("click", () => {
//     parrafo.textContent = "Cambiando texto desde js";  
// }); 

// document.getElementById("btn-error").addEventListener("click", () => {
//     alert("Error 404");
//     document.getElementsByClassName("texto").textContent = "Hola?";
// });

/* ------------------------------------------------------------ */

const nombrePokemon = "Pikachu";
const tipo = "Electrico";
let nivel = 25;
// funcion tradicinal
function describirPokemon(nombre,tipo,nivel) {
    return `${nombre} es de tipo ${tipo} y nivel ${nivel}`
};
console.log(describirPokemon(nombrePokemon,tipo,nivel));

const esPokemonFuerte = (nivel) => {
    return nivel >= 30;
};
const Pokemon2 = {
    nombre: "Charizard",
    tipo: "fuego",
    Ataques: ["Lanzallamas","Vuelo"],
    //Completar agregando ataque principal
    AtaquePrincipal(){
        return this.Ataques[0];
    }
};

console.log(Pokemon2.AtaquePrincipal());

const Pokedex = [
    {
        nombre: "Charizard",
        nivel: 100,
        tipo: "fuego",
        Ataques: ["Lanzallamas","Vuelo"],
        //Completar agregando ataque principal
        AtaquePrincipal(){
            return this.Ataques[0];
        }
    },
    {
        nombre: "Pikachu",
        nivel: '78',
        tipo: "Electrico",
        Ataques: ["Electrobola","Ataque Rapido"],
        //Completar agregando ataque principal
        AtaquePrincipal(){
            return this.Ataques[0];
        }
    },
    {
        nombre: "Mew",
        nivel: "1000",
        tipo: "Psìquico",
        Ataques: ["Psìquico","Transformación"],
        //Completar agregando ataque principal
        AtaquePrincipal(){
            return this.Ataques[0];
        }
    }
]

        // Pokedex.filter (p => p. tipo == "Fuego")


        console.log(Pokedex.filter (p => p. tipo === "fuego"));
// array.filter devcuelve un array con el elemento (del array) que cumpla la condición establecida.
// quiero quecoide
// nicolas chaitele / papi dame mas leche 
// facu guedikian / quiero mas dulce con flan
//  benja olivera / mama no hay mas panchos en la heladera??? naaaaaa que mandan


        console.log(Pokedex.map(p => p.nombre))



/*
IGUAL VS IDENTICO

El igual == compara el valor del elemento.
el identico === compara valor y tipo de variable.
*/


// sikbidibidibidibidi

// dopdopdopdopdopdopdop

// querri capolla

document.querySelector( ".btn2");
document.querySelector("#btn");