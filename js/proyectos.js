// Obtener los proyectos desde la api
// usando fetch y mostrarlos en la página

// Fetch the projects from the API
fetch('http://localhost:3000/proyectos')
    .then(response => response.json())
    .then(proyectos => {
        // Obtener el UL de proyectos
        const proyectosUL = document.getElementById('proyectos');
        // Recorrer
        proyectos.forEach(proyecto => {
            // Crear un LI
            const proyectoLi = document.createElement('li');
            // Agregar enlace para el proyecto
            proyectoLi.innerHTML = `<a href="proyecto/${proyecto.id}/actividades">
            ${proyecto.nombre}</a>`;
            // Agregar el LI al UL
            proyectosUL.appendChild(proyectoLi);
        });
    });