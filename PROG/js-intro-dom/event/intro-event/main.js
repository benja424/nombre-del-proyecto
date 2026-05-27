document.querySelector('#btn-prueba').addEventListener('click', (e) => {
    console.log(e.type);
    console.log(e.currentTarget);
    console.log(e.target);
});