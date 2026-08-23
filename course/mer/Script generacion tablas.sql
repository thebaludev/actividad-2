CREATE TABLE `refugios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `direccion` varchar(255),
  `ciudad` varchar(255),
  `telefono` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `especies` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255) UNIQUE COMMENT 'perro, gato, conejo, ave, otro'
);

CREATE TABLE `mascotas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `refugio_id` int NOT NULL,
  `especie_id` int NOT NULL,
  `raza` varchar(255),
  `edad` int,
  `sexo` varchar(255) COMMENT 'macho | hembra',
  `tamano` varchar(255) COMMENT 'pequeno | mediano | grande',
  `descripcion` text,
  `vacunado` boolean DEFAULT false,
  `esterilizado` boolean DEFAULT false,
  `apto_ninos` boolean DEFAULT false,
  `estado` varchar(255) DEFAULT 'disponible' COMMENT 'disponible | en_proceso | adoptado',
  `fecha_ingreso` date,
  `imagen_principal` varchar(255)
);

CREATE TABLE `imagenes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `mascota_id` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `orden` int DEFAULT 0
);

CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `email` varchar(255) UNIQUE NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` varchar(255) DEFAULT 'admin' COMMENT 'admin | cliente'
);

CREATE TABLE `comentarios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `mascota_id` int NOT NULL,
  `usuario_id` int,
  `comentario` text NOT NULL,
  `fecha` timestamp DEFAULT (now())
);

ALTER TABLE `refugios` COMMENT = 'Refugios aliados que registran mascotas para adopción';

ALTER TABLE `mascotas` COMMENT = 'Ficha central de cada mascota disponible para adopción';

ALTER TABLE `comentarios` COMMENT = 'usuario_id nulo permite preguntas sin registro';

ALTER TABLE `mascotas` ADD FOREIGN KEY (`refugio_id`) REFERENCES `refugios` (`id`);

ALTER TABLE `mascotas` ADD FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`);

ALTER TABLE `imagenes` ADD FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`);

ALTER TABLE `comentarios` ADD FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`);

ALTER TABLE `comentarios` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
