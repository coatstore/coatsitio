const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const apiRoutes = require('./router/api');
app.use('/api', apiRoutes);

app.get('/', (req, res) => {
    res.json({
        success: true,
        message: 'API de Coat Store funcionando correctamente',
        version: '1.0.0'
    });
});

// Manejo de errores 404
app.use((req, res) => {
    res.status(404).json({
        success: false,
        message: 'Ruta no encontrada'
    });
});

// Manejo de errores global
app.use((error, req, res, next) => {
    console.error(error.stack);
    res.status(500).json({
        success: false,
        message: 'Error interno del servidor'
    });
});

app.listen(PORT, () => {
    console.log(` Servidor corriendo en el puerto ${PORT}`);
});

module.exports = app;
