// Promesas - El futuro de JavaScript

// JSON.parse()
// Convierte un texto JSON en un objeto JavaScript

// JSON.stringify()
// Convierte un objeto JavaScript en texto JSON

// dos) Promesas
fetch('https://pokeapi.co/api/v2/pokemon/1')
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));

// 3) fetch()

fetch('https://pokeapi.co/api/v2/pokemon/1')
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error('ERROR ', error));

const poke_id = 5;
fetch(`https://pokeapi.co/api/v2/pokemon/${poke_id}`)
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error('ERROR ', error));

fetch('https://pokeapi.co/api/v2/pokemon/1')
  .then(response => {
    console.log('Código', response.status)
    return response.json()
  })
  .then(data => console.log(data))
  .catch(error => console.error('ERROR ', error));

// fetch('https://pokeapi.co/api/v2/pokemon/100000')
//   .then(response => {
//     console.log('Código', response.status)
//     return response.json()
//   })
//   .then(data => console.log(data))
//   .catch(error => console.error('ERROR ', error));


// 4) async/await

async function obtenerPokemon(id) {
  try {
    const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${poke_id}`);
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.log('ERROR', error);
  }
}

async function mostrarPokemon(id) {
  try {
    const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
    const pokemon = await response.json();
    
    // Crear card
    const card = document.createElement('div');
    card.classList.add('pokemon-card');

    // Crear elementos
    const img = document.createElement('img');
    const nombre = document.createElement('h3');
    const tipo = document.createElement('span');
    const ul = document.createElement('ul');

    // Configurar contenido. Ojo: hacer referencia al parámetro
    img.src = pokemon.sprites.other['official-artwork'].front_default;
    const name = pokemon.name;
    nombre.textContent = name.charAt(0).toUpperCase() + name.slice(1);;
    tipo.textContent = pokemon.types[0].type.name;
    tipo.classList.add('tipo-electrico');

    // pokemon.habilidades.forEach((hab) => {
    //     console.log(hab);
    //     const li = document.createElement('li');
    //     li.textContent = hab;
    //     ul.appendChild(li);
    // });

    // Ensamblar la card
    card.appendChild(img);
    card.appendChild(nombre);
    card.appendChild(tipo);
    card.appendChild(ul);
    document.querySelector('#contenedor-pokemon').appendChild(card);

  } catch (error) {
    console.error('ERROR', error);
  }
}

document.querySelector('#filtros button').addEventListener('click', (e) => {
   // Obtenemos el valor del input
   const num = document.querySelector("#txtFiltro").value;
  // Obtenemos el primer hijo (es el unico) del div#contenedor-pokemon 
  const hijo = document.querySelector('#contenedor-pokemon').firstChild;
  // Usamos los conceptos de truthy y falsy, y al evaluar en el if sabemos cuando es nulo y cuando no.
  // truthy son los valores que se evalúan como verdaderos.
  // falsy son los valores que se evalúan como falsos.
  if(hijo){
    // Eliminamos el hijo en caso que exista.
    document.querySelector('#contenedor-pokemon').removeChild(hijo);
  }
  //Llamamos a la funcion que se encarga de crear la card con el numero de Pokemon deseado por el usuario.
  mostrarPokemon(`${num}`);
});


