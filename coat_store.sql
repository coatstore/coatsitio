-- Base de datos para Coat Store
CREATE DATABASE IF NOT EXISTS coat_store;
USE coat_store;

-- Tabla de Categorías de Productos
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla de Productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50),
    id_categoria INT,
    imagen_url VARCHAR(255),
    stock INT DEFAULT 0,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla de Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    ciudad VARCHAR(50),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Pendiente', 'Procesando', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    total DECIMAL(10, 2),
    metodo_pago VARCHAR(50),
    direccion_envio TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla de Detalle de Pedidos
CREATE TABLE detalle_pedidos (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla de Mensajes de Contacto
CREATE TABLE mensajes_contacto (
    id_mensaje INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    leido BOOLEAN DEFAULT FALSE
);

-- Tabla de Promociones
CREATE TABLE promociones (
    id_promocion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    porcentaje_descuento DECIMAL(5, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- Insertar datos de ejemplo - Categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Chaquetas Medianas', 'Chaquetas de tamaño mediano para mujer'),
('Chaquetas Toreras', 'Chaquetas estilo torera'),
('Chalecos', 'Chalecos sin mangas'),
('Gabanes', 'Gabanes largos elegantes');

-- Insertar datos de ejemplo - Productos basados en la página
INSERT INTO productos (nombre, descripcion, precio, color, id_categoria, imagen_url, stock) VALUES
('Chaqueta Mediana Fox', 'Chaqueta mediana de alta calidad', 120000.00, 'Beige', 1, 'med1.jpg', 15),
('Chaqueta Mediana Lukin', 'Chaqueta mediana estilo Lukin', 120000.00, 'Negro', 1, 'medlukinnegra.jpg', 12),
('Chaqueta Mediana Fox', 'Chaqueta mediana Fox', 120000.00, 'Gris', 1, 'medianagris.jpg', 10),
('Chaqueta Torera Fox', 'Chaqueta estilo torera', 120000.00, 'Caramelo', 2, 'torerabeige.jpg', 8),
('Chaleco Mediano Fox', 'Chaleco sin mangas', 80000.00, 'Negro', 3, 'chalecofox.jpg', 20),
('Chaqueta Mediana Fox', 'Chaqueta mediana Fox', 120000.00, 'Blanco', 1, 'medbl.jpg', 14),
('Gaban Lukin', 'Gaban largo elegante', 199000.00, 'Beige', 4, 'med2.jpg', 6),
('Gaban Euro', 'Gaban estilo europeo', 199900.00, 'Blanco', 4, 'med3.jpg', 5),
('Chaqueta Mediana Lukin', 'Chaqueta mediana Lukin', 120000.00, 'Blanco', 1, 'med4.jpg', 11),
('Chaqueta Torera Lukin', 'Chaqueta torera Lukin', 120000.00, 'Blanco', 2, 'med5.jpg', 9),
('Chaleco Mediano Fox', 'Chaleco mediano Fox', 80000.00, 'Blanco', 3, 'med6.jpg', 18),
('Chaleco Mediano Lukin', 'Chaleco mediano Lukin', 80000.00, 'Negro', 3, 'med7.jpg', 16),
('Chaqueta Mediana Fox', 'Chaqueta mediana Fox', 120000.00, 'Azul Noche', 1, 'med8.jpg', 13),
('Chaqueta Mediana Lukin', 'Chaqueta mediana Lukin', 120000.00, 'Jaspeado', 1, 'med9.jpg', 10),
('Gaban Hondas', 'Gaban Hondas elegante', 199000.00, 'Negro', 4, 'gabanhondasnegro.jpg', 7),
-- Más productos para testing
('Chaqueta Mediana Fox', 'Chaqueta mediana Fox edición especial', 130000.00, 'Rojo', 1, 'med10.jpg', 8),
('Chaqueta Torera Fox', 'Chaqueta torera Fox premium', 125000.00, 'Negro', 2, 'torera_negra.jpg', 12),
('Chaleco Mediano Lukin', 'Chaleco mediano Lukin con capucha', 85000.00, 'Gris', 3, 'chaleco_gris.jpg', 15),
('Gaban Euro', 'Gaban Euro largo', 210000.00, 'Marrón', 4, 'gaban_marron.jpg', 4),
('Chaqueta Mediana Fox', 'Chaqueta mediana Fox invierno', 135000.00, 'Verde', 1, 'med_verde.jpg', 10),
('Chaqueta Torera Lukin', 'Chaqueta torera Lukin casual', 115000.00, 'Azul', 2, 'torera_azul.jpg', 9),
('Chaleco Mediano Fox', 'Chaleco mediano Fox acolchado', 95000.00, 'Rosa', 3, 'chaleco_rosa.jpg', 11),
('Gaban Hondas', 'Gaban Hondas premium', 220000.00, 'Beige', 4, 'gaban_beige.jpg', 6),
('Chaqueta Mediana Lukin', 'Chaqueta mediana Lukin slim', 118000.00, 'Morado', 1, 'med_morado.jpg', 7),
('Chaqueta Torera Fox', 'Chaqueta torera Fox oversized', 128000.00, 'Amarillo', 2, 'torera_amarilla.jpg', 5),
('Chaleco Mediano Lukin', 'Chaleco mediano Lukin básico', 78000.00, 'Naranja', 3, 'chaleco_naranja.jpg', 13),
('Gaban Euro', 'Gaban Euro corto', 185000.00, 'Turquesa', 4, 'gaban_turquesa.jpg', 3),
('Chaqueta Mediana Fox', 'Chaqueta mediana Fox vintage', 140000.00, 'Marrón Claro', 1, 'med_marron.jpg', 9),
('Chaqueta Torera Lukin', 'Chaqueta torera Lukin moderna', 122000.00, 'Rosa Pastel', 2, 'torera_rosa.jpg', 8),
('Chaleco Mediano Fox', 'Chaleco mediano Fox elegante', 88000.00, 'Violeta', 3, 'chaleco_violeta.jpg', 10),
('Gaban Hondas', 'Gaban Hondas clásico', 205000.00, 'Gris Oscuro', 4, 'gaban_gris.jpg', 5),
('Chaqueta Mediana Lukin', 'Chaqueta mediana Lukin urbana', 132000.00, 'Celeste', 1, 'med_celeste.jpg', 6),
('Chaqueta Torera Fox', 'Chaqueta torera Fox sport', 119000.00, 'Verde Lima', 2, 'torera_verde.jpg', 11),
('Chaleco Mediano Lukin', 'Chaleco mediano Lukin fashion', 92000.00, 'Coral', 3, 'chaleco_coral.jpg', 12),
('Gaban Euro', 'Gaban Euro moderno', 215000.00, 'Azul Marino', 4, 'gaban_azul.jpg', 4);

-- Insertar promociones de ejemplo
INSERT INTO promociones (nombre, descripcion, porcentaje_descuento, fecha_inicio, fecha_fin, activo) VALUES
('Oferta de Bienvenida', 'Descuento del 10% en primera compra siguiendo redes sociales', 10.00, '2024-01-01', '2024-12-31', TRUE),
('Envío Gratis', 'Envío gratis en compras superiores a $90,000', 0.00, '2024-01-01', '2024-12-31', TRUE),
('Compra en Paquete', '15% de descuento en el segundo abrigo', 15.00, '2024-01-01', '2024-12-31', TRUE);

-- Vistas útiles
CREATE VIEW vista_productos_disponibles AS
SELECT 
    p.id_producto,
    p.nombre,
    p.precio,
    p.color,
    c.nombre AS categoria,
    p.stock
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0;

CREATE VIEW vista_pedidos_clientes AS
SELECT 
    pe.id_pedido,
    c.nombre AS cliente,
    c.email,
    pe.fecha_pedido,
    pe.estado,
    pe.total
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
ORDER BY pe.fecha_pedido DESC;