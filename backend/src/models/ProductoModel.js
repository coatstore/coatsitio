const DB = require('../config/database');

class ProductoModel {
    static async getAll() {
        try {
            const [rows] = await DB.query('SELECT * FROM productos ORDER BY fecha_creacion DESC');
            return rows;
        } catch (error) {
            throw new Error('Error al obtener productos: ' + error.message);
        }
    }

    static async getById(id) {
        try {
            const [rows] = await DB.query('SELECT * FROM productos WHERE id_producto = ?', [id]);
            return rows[0];
        } catch (error) {
            throw new Error('Error al obtener producto: ' + error.message);
        }
    }

    static async getByCategoria(id_categoria) {
        try {
            const [rows] = await DB.query('SELECT * FROM productos WHERE id_categoria = ? ORDER BY fecha_creacion DESC', [id_categoria]);
            return rows;
        } catch (error) {
            throw new Error('Error al obtener productos por categoría: ' + error.message);
        }
    }

    static async create(data) {
        try {
            const [result] = await DB.query(
                'INSERT INTO productos (nombre, descripcion, precio, color, id_categoria, imagen_url, stock) VALUES (?, ?, ?, ?, ?, ?, ?)',
                [data.nombre, data.descripcion, data.precio, data.color, data.id_categoria, data.imagen_url, data.stock]
            );
            return result.insertId;
        } catch (error) {
            throw new Error('Error al crear producto: ' + error.message);
        }
    }

    static async update(id, data) {
        try {
            const [result] = await DB.query(
                'UPDATE productos SET nombre = ?, descripcion = ?, precio = ?, color = ?, id_categoria = ?, imagen_url = ?, stock = ? WHERE id_producto = ?',
                [data.nombre, data.descripcion, data.precio, data.color, data.id_categoria, data.imagen_url, data.stock, id]
            );
            return result.affectedRows > 0;
        } catch (error) {
            throw new Error('Error al actualizar producto: ' + error.message);
        }
    }

    static async delete(id) {
        try {
            const [result] = await DB.query('DELETE FROM productos WHERE id_producto = ?', [id]);
            return result.affectedRows > 0;
        } catch (error) {
            throw new Error('Error al eliminar producto: ' + error.message);
        }
    }
}

module.exports = ProductoModel;
