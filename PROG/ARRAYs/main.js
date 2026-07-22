
const fila = ['Ana', 'María', 'Juan'];
// 1) Llega un nuevo cliente 'Elena' a la fila.
// 2) Llega un cliente VIP 'Carmen' que debe ser atendida primero.
// 3) Se atiende al primer cliente de la fila.
// 4) Mostrar en consola quién es la última persona en la fila actualmente.
console.log(fila);
fila.push('Elena');
console.log(fila);
fila.unshift('Carmen');
console.log(fila);
fila.pop();
console.log(fila);
console.log(fila[4,3]);

const tags = ['javascript', 'web', 'programación', 'frontend', 'react'];
// 1) Comprobar que la etiqueta 'python' está presente en el array.
// 2) Crear un nuevo array llamado 'principales' que contenga solo las 3 primeras etiquetas.
// 3) Convertir el array 'principales en un solo string separado por comas y espacios.
tags.forEach(element => {
    if(element == 'python')
        console.log("está");
    else
        console.log("no está");
});
tags.find('python');
const principales = [tags[5,0], tags[5,1], tags[5,2]];
console.log(principales);
const pr = principales.join(', ');
console.log(pr);

const productos = ['Teclado', 'Mouse', 'Agotado', 'Monitor'];
// 1) Encontrar el índice dónde se ubica el producto 'Agotado'.
// 2) Reemplazar 'Agotado' por 'Camara Web' (del array productos).
// 3) Invertir el orden de la lista completa para mostrar los últimos ingresados primero.




