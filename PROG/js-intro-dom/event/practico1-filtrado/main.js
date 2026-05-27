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


botomesFiltro.forEach((btn) => {
    btn.addEventListener('click', (e) => {
        console.log(btn.dataset.tipo);
    });
});