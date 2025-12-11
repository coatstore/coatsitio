const ProductoModel = require('../models/ProductoModel');

class ProductoController {
    static async listarProductos(req, res) {
        try {
            const productos = await ProductoModel.getAll();
            res.json({
                success: true,
                data: productos
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: error.message
            });
        }
    }

    static async obtenerProducto(req, res) {
        try {
            const { id } = req.params;
            const producto = await ProductoModel.getById(id);

            if (!producto) {
                return res.status(404).json({
                    success: false,
                    message: 'Producto no encontrado'
                });
            }

            res.json({
                success: true,
                data: producto
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: error.message
            });
        }
    }

    static async productosPorCategoria(req, res) {
        try {
            const { id } = req.params;
            const productos = await ProductoModel.getByCategoria(id);

            res.json({
                success: true,
                data: productos
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: error.message
            });
        }
    }

    static async crearProducto(req, res) {
        try {
            const data = req.body;

            if (!data.nombre || !data.precio) {
                return res.status(400).json({
                    success: false,
                    message: 'Datos incompletos: nombre y precio son requeridos'
                });
            }

            const id = await ProductoModel.create(data);

            res.status(201).json({
                success: true,
                message: 'Producto creado exitosamente',
                data: { id_producto: id }
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: error.message
            });
        }
    }

    static async actualizarProducto(req, res) {
        try {
            const { id } = req.params;
            const data = req.body;

            const affectedRows = await ProductoModel.update(id, data);

            if (affectedRows === 0) {
                return res.status(404).json({
                    success: false,
                    message: 'Producto no encontrado'
                });
            }

            res.json({
                success: true,
                message: 'Producto actualizado exitosamente'
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: error.message
            });
        }
    }

    static async eliminarProducto(req, res) {
        try {
            const { id } = req.params;

            const affectedRows = await ProductoModel.delete(id);

            if (affectedRows === 0) {
                return res.status(404).json({
                    success: false,
                    message: 'Producto no encontrado'
                });
            }

            res.json({
                success: true,
                message: 'Producto eliminado exitosamente'
            });
        } catch (error) {
            res.status(500).json({
                success: false,
                message: error.message
            });
        }
    }
}

module.exports = ProductoController;
