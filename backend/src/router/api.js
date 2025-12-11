const express = require('express');
const router = express.Router();
const ProductoController = require('../controllers/ProductoController');


router.get('/productos', ProductoController.listarProductos);
router.get('/productos/:id', ProductoController.obtenerProducto);
router.get('/productos/categoria/:id', ProductoController.productosPorCategoria);
router.post('/productos', ProductoController.crearProducto);
router.put('/productos/:id', ProductoController.actualizarProducto);
router.delete('/productos/:id', ProductoController.eliminarProducto);

module.exports = router;
