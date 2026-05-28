const pokedex = [
    {
        nombre: 'Charizard',
        tipo: 'icons/fire.svg'
    },
    {
        nombre: 'Blastoise',
        tipo: 'icons/water.svg'
    },
    {
        nombre: 'Venusaur',
        tipo: 'icons/grass.svg'
    },
    {
        nombre: 'Arcanine',
        tipo: 'icons/fire.svg'
    }
];
// Seleccionamos todos los button que estan dentro del contenedor con id 'filtros'
const botomesFiltro = document.querySelectorAll('#filtros button');

//Selecciono la coleccion de divs que tienen la clase pokemon-card
const cards =document.querySelectorAll('.pokemon-card'); 

botomesFiltro.forEach((btn) => {
    btn.addEventListener('click', (e) => {
        console.log(btn.dataset.tipo);

        const tipoSeleccionado = btn.dataset.tipo; // <- tipo del button seleccionado 
        
        cards.forEach((card) => {
            if(tipoSeleccionado == card.dataset.tipo || tipoSeleccionado == 'todos') {
                // La card que se quiere mostrar 
                card.style.display = 'flex';
              }  else  {
                // La card que no se quiere mostrar u ocultar 
                card.style.display = 'none';
        }
        });
        

    });
});

const inputFiltro = document.querySelector("#txtFiltro");

inputFiltro.addEventListener('input', () => {
    const textoFiltro = inputFiltro.value.toLowerCase(); // textto de filtro en minuscula
   
    cards.forEach((card) => {
        if(card.dataset.tipo.includes(textoFiltro) || textoFiltro.includes('todos')){

        // if(textoFiltro == card.dataset.tipo || textoFiltro == 'todos') {
            // La card que se quiere mostrar 
            card.style.display = 'flex';
          }  else  {
            // La card que no se quiere mostrar u ocultar 
            card.style.display = 'none';
    }
    });

});