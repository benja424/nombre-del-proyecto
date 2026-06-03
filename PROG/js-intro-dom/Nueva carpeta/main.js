fetch('https://pokeapi.co/api/v2/pokemon/1')
    // .json() treansforma la respuesta (que esta en formato JSON) a un objeto de js. 
    .then(response => response.json()) 
    .then(data => console.log(data)) // muestro el objeto js en la consola.
    .catch(error => console.error('ERROR 👹👺', error));

    const id = 10;
    async function obtenerPokemon(id) {
        try {
            const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`)
            const data = await response.json(); // este await hace que cuando toda la request llegó, transforma los datos a un objetivo js 
            //                                     y no avanza hasta que haya transformado
            const pokemon = {
                nombre: data.name,
                tipo: data.types[0],
                imagen: data.sprites.other['official-artwork'].front_default,
                // habilidades: ['impactrueno', 'Rayo']
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
            
            // const habilidades = document.createElement('ul');
            // pikachu.habilidades.ForEach(hab => {
                // const li = document.createElement('li');
                // li. textContent = hab;
                // habilidades.appendChild(li);
            // });
            // Ensamblar la card
            card.appendChild(img);
            card.appendChild(nombre);
            card.appendChild(tipo);
            // card.appendChild(habilidades);
            
            // Agregar al DOM
            document.querySelector('#contenedor-pokemon').appendChild(card);
            
            function createCard (pokemon){
                // crear card
                const card = document.createElement('div');
                card.classList.add('pokemon-card');
                
            
            }
            console.log(data);
        }   catch (error) {
            console.error('ERROR 👹👺', error);
        }
    }

obtenerPokemon(id)

