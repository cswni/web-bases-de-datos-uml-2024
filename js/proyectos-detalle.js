//obtener el proyecto tomando el id del proyecto de la url//
//y mostar//



//get the id from url
const url = new URL(window.location.href);
const id = url.searchParams.get('id');

fetch('http://localhost:3000/proyecto/' + id)
.then(response => response.json())
.then(proyecto =>{
    //obtener el url de proyectos


// Formatear las fechas para asegurarse de que se adapten al campo de tipo date
const formatearFecha = (fecha) => {
    return new Date(fecha).toISOString().split('T')[0];
};
//ajustar los datos del proyecto de los respectivos
//campos en el formulario usando id de cada campo
// Ajustar los datos del proyecto en los respectivos campos del formulario
document.getElementById('nombre').value = proyecto.nombre;
document.getElementById('descripcion').value = proyecto.descripcion;
document.getElementById('fecha-inicio').value = formatearFecha(proyecto.fecha_inicio);
document.getElementById('fecha-fin').value = formatearFecha(proyecto.fecha_fin);
document.getElementById('presupuesto').value = proyecto.presupuesto;
})
.catch(error => console.error('Error al obtener el proyecto:', error));

document.getElementById('agregar').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevenir la recarga de la página

    const url = new URL(window.location.href);
    const id = url.searchParams.get('id');

    // Capturar los datos del formulario
    const nombre = document.getElementById('nombre').value;
    const descripcion = document.getElementById('descripcion').value;
    const fecha_inicio = document.getElementById('fecha-inicio').value;
    const fecha_fin = document.getElementById('fecha-fin').value;
    const presupuesto = document.getElementById('presupuesto').value;

    // Crear el objeto con los datos del proyecto
    const proyectoActualizado = {
        nombre,
        descripcion,
        fecha_inicio,
        fecha_fin,
        presupuesto
    };

    // Enviar una solicitud PUT al servidor para actualizar el proyecto
    fetch('http://localhost:3000/proyecto/' + id, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(proyectoActualizado)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Error al actualizar el proyecto');
        }
        return response.json();
    })
    .then(data => {
        console.log('Proyecto actualizado exitosamente:', data);
        alert('Proyecto actualizado exitosamente');
    })
    .catch(error => console.error('Error:', error));
});