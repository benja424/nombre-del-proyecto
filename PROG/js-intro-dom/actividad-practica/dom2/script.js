// 1) querrySelector
document
.querySelector('#btn').addEventListener('click', () => {
    alert('primer button')
});

document.querySelector('.btn').addEventListener('click', () => {
    alert('segundo button')
});

// 2) innerHTML y appendChild

document.querySelector('#contenedorInnerHTML').innerHTML = '<h3>❤😍 Borramos </h3>'

const contenedorInnerHTML = document.querySelector('#contenedorInnerHTML');
contenedorInnerHTML.innerHTML =  '<h3>❤😍 Borramos x2 </h3>';

const textXSS = document.querySelector('#xss');
textXSS.addEventListener('keydown', (e) => {
    if(e.key === 'Enter')
       document.querySelector('#txtXSS').textContent = `Hola, ${textXSS.value}`
        // document.querySelector('#txtXSS').innerHTML = `Hola, ${textXSS.value}`
});

const contenedor = document.querySelector('#createElem');
const card = document.createElement('div');
card.style.backgroundColor = 'red';
const titulo = document.createElement ('h3')
titulo.textContent = 'Soy un h3 creado de forma dianmica';

card.appendChild(titulo);
contenedor.appendChild(card);

//crear elementos
const card2 = document.createElement ('div');
const img = document.createElement ('img');
const nombre = document.createElement ('h3');

//Configurar contenido
img.src = '../dom3-practico/pikachu.png';
nombre.textContent = 'Pikachu';

// Agregar estilos
card2.classList.add ('pokemon-card');

//Construir estructura
card2.appendChild(img);
card2.appendChild(nombre);

//Agregar al DOM
document.querySelector('#createElem').appendChild(card2);

const botonFav = document.querySelector ('#btn-favorito');
const textPikachu = document.querySelector ('#card-pikachu');
botonFav.addEventListener('click', () => {
   textPikachu.classList.toggle('favorito');
    if (textPikachu.classList.contains('favorito'))
        botonFav.textContent = '❤️ Favorito';
    else
        botonFav.textContent = '🤍 Favorito';
});





