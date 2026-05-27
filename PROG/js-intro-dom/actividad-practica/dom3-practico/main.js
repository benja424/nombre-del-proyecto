// pikapika
const pikachu = {
    nombre: 'Pikachu',
    tipo: 'Electrico',
    imagen: 'pikachu.png',
    habilidades: ['impactrueno', 'Rayo']
};

// Crear card con DOM
const card = document.createElement('div');
card.classList.add('pokemon-card');

const img = document.createELement('img');
img.src = pikachu.imagen;

const nombre = document.createElement('h3');
nombre.textContent = pikachu.nombre;

const tipo = document.createElement('span');
tipo.textContent = pikachu.tipo;
tipo.classList.add('tipo-electrico')

const habilidades = document.createElement('ul');
pikachu.habilidades.ForEach(hab => {
    const li = document.createElement('li');
    li. textContent = hab;
    habilidades.appendChild(li);
});
// Ensamblar la card
card.appendChild(img);
card.appendChild(nombre);
card.appendChild(tipo);
card.appendChild(habilidades);

// Agregar al DOM
document.querySelector('#contenedor-pokemon').appendChild(card);

function createCard (pokemon){
    // crear card
    const card = document.createElement('div');
    card.classList.add('pokemon-card');
    

}
