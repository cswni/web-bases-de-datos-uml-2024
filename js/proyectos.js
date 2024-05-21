//obtener los pryectos desde la api
// usando fetch y mostrarlos en la pagina

//fetch the project from the api
fetch('http://localhost:3000/proyectos')
     .then(response => response.json())
     .then(proyectos => {
        //Obtener el ul de proyectos
        const proyectosUl = document.getElementById('proyectos');
        //recorrer 
        proyectos.forEach(proyecto => {
            //create a Li
            const proyectosLi = document.createElement('li');
            proyectosLi.innerHTML =`
            <a href ="proyectos/${proyecto.id}/actividades">${proyecto.nombre}</a>`;
            //agregra el li al ul
            proyectosUl.appendChild(proyectosLi);
        });          
    });
     // Función para cargar los proyectos desde la API y mostrarlos en la página
function cargarProyectos() {
    fetch('http://localhost:3000/proyectos')
        .then(response => response.json())
        .then(proyectos => {
            const proyectosUl = document.getElementById('proyectos');
            proyectosUl.innerHTML = ''; // Limpiamos la lista antes de agregar los proyectos
            proyectos.forEach(proyecto => {
                const proyectosLi = document.createElement('li');
                proyectosLi.innerHTML = `<a href="proyecto-detalle.html?id=${proyecto.id}">${proyecto.nombre}</a>`;
                proyectosUl.appendChild(proyectosLi);
            });
        });
}





// Llamo  a la función para cargar los proyectos al cargar la página
cargarProyectos();

// Agrego un evento para manejar la sumisión del formulario
document.getElementById('agregar').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(event.target);
    fetch('http://localhost:3000/proyectos', {
        method: 'POST',
        body: JSON.stringify({
            nombre: formData.get('nombre'),
            descripcion: formData.get('descripcion'),
            fecha_inicio: formData.get('fecha_inicio'),
            fecha_fin: formData.get('fecha_fin'),
            presupuesto: formData.get('presupuesto')
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.ok) {
            // Recargo la lista de proyectos
            cargarProyectos();
            // Limpiamos el formulario
            event.target.reset();
        } else {
            console.error('Error al agregar el proyecto');
        }
    });
});
