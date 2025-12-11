const API_URL = "http://localhost:3000/api/productos/"

fetch(API_URL).then(response => response.json()).then(data =>{

  //aqui pintamos con el DOM
  if (data.success) {
    renderizarProductos(data.data);
  } else {
    console.error('Error al cargar productos:', data.message);
  }

})

// Función para renderizar productos en el catálogo
function renderizarProductos(productos) {
    const catalogoContainer = document.querySelector('#Catálogo .row');

    // Limpiar contenido existente
    catalogoContainer.innerHTML = '';

    productos.forEach(producto => {
        const card = document.createElement('div');
        card.className = 'col';
        card.innerHTML = `
            <div class="card h-100">
                <img src="./assets/${producto.imagen_url}" class="card-img-top" alt="${producto.nombre}" onerror="this.src='./assets/default.jpg'">
                <div class="card-body">
                    <h5 class="card-title">${producto.nombre}</h5>
                    <p class="card-text">Color ${producto.color}.</p>
                    <p class="fw-bold">$${producto.precio.toLocaleString()}</p>
                    <button class="btn btn-primary" onclick="comprarProducto(${producto.id_producto})">Comprar</button>
                </div>
            </div>
        `;
        catalogoContainer.appendChild(card);
    });
}

// Función para manejar la compra (placeholder)
function comprarProducto(idProducto) {
    alert(`Producto ${idProducto} agregado al carrito. Funcionalidad completa próximamente.`);
}
