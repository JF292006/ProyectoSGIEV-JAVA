-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyecto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8mb4 ;
USE `proyecto` ;

-- -----------------------------------------------------
-- Table `proyecto`.`mensajeria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`mensajeria` (
  `idmensajeria` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_mensajeria` VARCHAR(45) NULL DEFAULT NULL,
  `tel_mensajeria` BIGINT(20) NULL DEFAULT NULL,
  `direccion_mensajeria` VARCHAR(60) NULL DEFAULT NULL,
  `cobertura` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idmensajeria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `proyecto`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`usuarios` (
  `id_usuario` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `num_identificacion` BIGINT(20) NOT NULL,
  `tipo_usu` VARCHAR(15) NOT NULL,
  `clave` VARCHAR(15) NOT NULL,
`p_nombre` VARCHAR(15) NOT NULL,
  `s_nombre` VARCHAR(15) NULL DEFAULT NULL,
  `p_apellido` VARCHAR(15) NOT NULL,
  `s_apellido` VARCHAR(15) NULL DEFAULT NULL,
  `correo` VARCHAR(70) NOT NULL,
  `telefono` BIGINT(20) NULL DEFAULT NULL,
  `salario` BIGINT(20) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `correo` (`correo` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `proyecto`.`envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`envio` (
  `idenvio` INT(11) NOT NULL AUTO_INCREMENT,
  `estado_envio` VARCHAR(15) NULL DEFAULT NULL,
  `fecha_envio` DATE NULL DEFAULT NULL,
  `fecha_entrega` DATE NULL DEFAULT NULL,
  `direccion_envio` VARCHAR(60) NULL DEFAULT NULL,
  `direccion_salida` VARCHAR(60) NULL DEFAULT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  `novedades` TEXT NULL DEFAULT NULL,
  `fk_mensajeria` INT(11) NOT NULL,
  `usuarios_id_usuario` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idenvio`),
  INDEX `fk_mensajeria` (`fk_mensajeria` ASC) ,
  INDEX `usuarios_id_usuario` (`usuarios_id_usuario` ASC) ,
  CONSTRAINT `envio_ibfk_1`
    FOREIGN KEY (`fk_mensajeria`)
    REFERENCES `proyecto`.`mensajeria` (`idmensajeria`),
  CONSTRAINT `envio_ibfk_2`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `proyecto`.`usuarios` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `proyecto`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`proveedor` (
  `idproveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `correo_proveedor` VARCHAR(70) NULL DEFAULT NULL,
  `telefono` BIGINT(20) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `proyecto`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`producto` (
  `idproducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(60) NOT NULL,
  `precio_producto` INT(11) NOT NULL,
  `descripcion_producto` VARCHAR(95) NULL DEFAULT NULL,
  `nombre_tipo` TINYINT(4) NOT NULL,
  `registrosanitario` VARCHAR(45) NOT NULL,
  `proveedor_idproveedor` INT(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `proveedor_idproveedor` (`proveedor_idproveedor` ASC) ,
  CONSTRAINT `producto_ibfk_2`
    FOREIGN KEY (`proveedor_idproveedor`)
    REFERENCES `proyecto`.`proveedor` (`idproveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `proyecto`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`inventario` (
  `idinventario` INT(11) NOT NULL AUTO_INCREMENT,
  `cantidad_existente` SMALLINT(6) NULL DEFAULT NULL,
  `stock_max` SMALLINT(6) NULL DEFAULT NULL,
  `stock_min` TINYINT(4) NULL DEFAULT NULL,
  `num_lote` BIGINT(20) NULL DEFAULT NULL,
  `fecha_vencimiento` DATE NULL DEFAULT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  `fecha_entrada` DATE NULL DEFAULT NULL,
  `fecha_salida` DATE NULL DEFAULT NULL,
  `productos_idproducto` INT(11) NOT NULL,
  PRIMARY KEY (`idinventario`),
  INDEX `productos_idproducto` (`productos_idproducto` ASC) ,
  CONSTRAINT `inventario_ibfk_1`
    FOREIGN KEY (`productos_idproducto`)
    REFERENCES `proyecto`.`producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `proyecto`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`venta` (
  `idfactura` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_factura` DATE NULL DEFAULT NULL,
  `subtotal` INT(11) NOT NULL,
  `descuento` TINYINT(4) NULL DEFAULT NULL,
  `abono` INT(11) NULL DEFAULT NULL,
  `valor_total` INT(11) NOT NULL,
  `observaciones` TEXT NULL DEFAULT NULL,
  `usuarios_id_usuario` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idfactura`),
  INDEX `usuarios_id_usuario` (`usuarios_id_usuario` ASC) ,
  CONSTRAINT `venta_ibfk_1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `proyecto`.`usuarios` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `proyecto`.`venta_has_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto`.`venta_has_producto` (
  `venta_idfactura` INT(11) NOT NULL,
  `productos_idproducto` INT(11) NOT NULL,
  PRIMARY KEY (`venta_idfactura`, `productos_idproducto`),
  INDEX `productos_idproducto` (`productos_idproducto` ASC) ,
  CONSTRAINT `venta_has_producto_ibfk_1`
    FOREIGN KEY (`venta_idfactura`)
    REFERENCES `proyecto`.`venta` (`idfactura`),
  CONSTRAINT `venta_has_producto_ibfk_2`
    FOREIGN KEY (`productos_idproducto`)
    REFERENCES `proyecto`.`producto` (`idproducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Insertar mensajeria
DELIMITER //
CREATE PROCEDURE insertar_mensajeria(IN nombre VARCHAR(45), IN tel BIGINT, IN direccion VARCHAR(60), IN cobertura VARCHAR(45))
BEGIN
  INSERT INTO mensajeria(nombre_mensajeria, tel_mensajeria, direccion_mensajeria, cobertura)
  VALUES(nombre, tel, direccion, cobertura);
END //
DELIMITER ;

-- Actualizar mensajeria
DELIMITER //
CREATE PROCEDURE actualizar_mensajeria(IN id INT, IN nombre VARCHAR(45), IN tel BIGINT, IN direccion VARCHAR(60), IN cobertura VARCHAR(45))
BEGIN
  UPDATE mensajeria
  SET nombre_mensajeria = nombre,
      tel_mensajeria = tel,
      direccion_mensajeria = direccion,
      cobertura = cobertura
  WHERE idmensajeria = id;
END //
DELIMITER ;

-- Eliminar mensajeria
DELIMITER //
CREATE PROCEDURE eliminar_mensajeria(IN id INT)
BEGIN
  DELETE FROM mensajeria WHERE idmensajeria = id;
END //
DELIMITER ;

-- Insertar usu
DELIMITER //
CREATE PROCEDURE insertar_usuario(IN num_id BIGINT, IN tipo VARCHAR(15), IN clav varchar(15), IN pnom VARCHAR(15), IN snom VARCHAR(15),
                                  IN papell VARCHAR(15), IN sapell VARCHAR(15), IN correo VARCHAR(70),
                                  IN tel BIGINT, IN salario BIGINT, IN fecha_nac DATE, IN direccion VARCHAR(60))
BEGIN
  INSERT INTO usuarios(num_identificacion, tipo_usu, clave, p_nombre, s_nombre, p_apellido, s_apellido, correo, telefono, salario, fecha_nacimiento, direccion)
  VALUES(num_id, tipo, pnom, snom, papell, sapell, correo, tel, salario, fecha_nac, direccion);
END //
DELIMITER ;

-- Actualizar usu
DELIMITER //
CREATE PROCEDURE actualizar_usuario(IN id BIGINT, IN tipo VARCHAR(15),IN clav varchar(15), IN pnom VARCHAR(15), IN snom VARCHAR(15),
                                    IN papell VARCHAR(15), IN sapell VARCHAR(15), IN correo VARCHAR(70),
                                    IN tel BIGINT, IN salario BIGINT, IN fecha_nac DATE, IN direccion VARCHAR(60))
BEGIN
  UPDATE usuarios
  SET tipo_usu = tipo,
  clave = clav,
      p_nombre = pnom,
      s_nombre = snom,
      p_apellido = papell,
      s_apellido = sapell,
      correo = correo,
      telefono = tel,
      salario = salario,
      fecha_nacimiento = fecha_nac,
      direccion = direccion
  WHERE id_usuario = id;
END //
DELIMITER ;

-- Eliminar usu
DELIMITER //
CREATE PROCEDURE eliminar_usuario(IN id BIGINT)
BEGIN
  DELETE FROM usuarios WHERE id_usuario = id;
END //
DELIMITER ;

-- Insertar envio
DELIMITER //
CREATE PROCEDURE insertar_envio(IN estado VARCHAR(15), IN fecha_env DATE, IN fecha_ent DATE,
                                 IN dir_env VARCHAR(60), IN dir_sal VARCHAR(60), IN obs TEXT, IN nov TEXT,
                                 IN fk_mensaj INT, IN fk_user BIGINT)
BEGIN
  INSERT INTO envio(estado_envio, fecha_envio, fecha_entrega, direccion_envio, direccion_salida, observaciones, novedades, fk_mensajeria, usuarios_id_usuario)
  VALUES(estado, fecha_env, fecha_ent, dir_env, dir_sal, obs, nov, fk_mensaj, fk_user);
END //
DELIMITER ;

-- Actualizar envio
DELIMITER //
CREATE PROCEDURE actualizar_envio(IN id INT, IN estado VARCHAR(15), IN fecha_env DATE, IN fecha_ent DATE,
                                  IN dir_env VARCHAR(60), IN dir_sal VARCHAR(60), IN obs TEXT, IN nov TEXT,
                                  IN fk_mensaj INT, IN fk_user BIGINT)
BEGIN
  UPDATE envio
  SET estado_envio = estado,
      fecha_envio = fecha_env,
      fecha_entrega = fecha_ent,
      direccion_envio = dir_env,
      direccion_salida = dir_sal,
      observaciones = obs,
      novedades = nov,
      fk_mensajeria = fk_mensaj,
      usuarios_id_usuario = fk_user
  WHERE idenvio = id;
END //
DELIMITER ;

-- Eliminar envio
DELIMITER //
CREATE PROCEDURE eliminar_envio(IN id INT)
BEGIN
  DELETE FROM envio WHERE idenvio = id;
END //
DELIMITER ;

-- Insertar proveedor
DELIMITER //
CREATE PROCEDURE insertar_proveedor(IN nombre VARCHAR(45), IN correo VARCHAR(70), IN tel BIGINT, IN direccion VARCHAR(60))
BEGIN
  INSERT INTO proveedor(nombre_proveedor, correo_proveedor, telefono, direccion)
  VALUES(nombre, correo, tel, direccion);
END //
DELIMITER ;

-- Actualizar proveedor
DELIMITER //
CREATE PROCEDURE actualizar_proveedor(IN id INT, IN nombre VARCHAR(45), IN correo VARCHAR(70), IN tel BIGINT, IN direccion VARCHAR(60))
BEGIN
  UPDATE proveedor
  SET nombre_proveedor = nombre,
      correo_proveedor = correo,
      telefono = tel,
      direccion = direccion
  WHERE idproveedor = id;
END //
DELIMITER ;

-- Eliminar proveedor
DELIMITER //
CREATE PROCEDURE eliminar_proveedor(IN id INT)
BEGIN
  DELETE FROM proveedor WHERE idproveedor = id;
END //
DELIMITER ;

-- Insertar inventario
DELIMITER //
CREATE PROCEDURE insertar_inventario(IN cantidad SMALLINT, IN stockmax SMALLINT, IN stockmin TINYINT,
                                     IN lote BIGINT, IN venc DATE, IN obs TEXT, IN entrada DATE, IN salida DATE, IN idprod INT)
BEGIN
  INSERT INTO inventario(cantidad_existente, stock_max, stock_min, num_lote, fecha_vencimiento, observaciones, fecha_entrada, fecha_salida, productos_idproducto)
  VALUES(cantidad, stockmax, stockmin, lote, venc, obs, entrada, salida, idprod);
END //
DELIMITER ;

-- Actualizar inventario
DELIMITER //
CREATE PROCEDURE actualizar_inventario(IN id INT, IN cantidad SMALLINT, IN stockmax SMALLINT, IN stockmin TINYINT,
                                       IN lote BIGINT, IN venc DATE, IN obs TEXT, IN entrada DATE, IN salida DATE, IN idprod INT)
BEGIN
  UPDATE inventario
  SET cantidad_existente = cantidad,
      stock_max = stockmax,
      stock_min = stockmin,
      num_lote = lote,
      fecha_vencimiento = venc,
      observaciones = obs,
      fecha_entrada = entrada,
      fecha_salida = salida,
      productos_idproducto = idprod
  WHERE idinventario = id;
END //
DELIMITER ;

-- Eliminar inventario
DELIMITER //
CREATE PROCEDURE eliminar_inventario(IN id INT)
BEGIN
  DELETE FROM inventario WHERE idinventario = id;
END //
DELIMITER ;

-- Insertar venta
DELIMITER //
CREATE PROCEDURE insertar_venta(IN fecha DATE, IN subtotal INT, IN descu TINYINT,
                                 IN abono INT, IN total INT, IN obs TEXT, IN idusuario BIGINT)
BEGIN
  INSERT INTO venta(fecha_factura, subtotal, descuento, abono, valor_total, observaciones, usuarios_id_usuario)
  VALUES(fecha, subtotal, descu, abono, total, obs, idusuario);
END //
DELIMITER ;

-- Actualizar venta
DELIMITER //
CREATE PROCEDURE actualizar_venta(IN id INT, IN fecha DATE, IN subtotal INT, IN descu TINYINT,
                                   IN abono INT, IN total INT, IN obs TEXT, IN idusuario BIGINT)
BEGIN
  UPDATE venta
  SET fecha_factura = fecha,
      subtotal = subtotal,
      descuento = descu,
      abono = abono,
      valor_total = total,
      observaciones = obs,
      usuarios_id_usuario = idusuario
  WHERE idfactura = id;
END //
DELIMITER ;

-- Eliminar venta
DELIMITER //
CREATE PROCEDURE eliminar_venta(IN id INT)
BEGIN
  DELETE FROM venta WHERE idfactura = id;
END //
DELIMITER ;

-- Insertar producto
DELIMITER //
CREATE PROCEDURE insertar_producto(IN nombre VARCHAR(60), IN precio INT, IN descripcion VARCHAR(95),
                                   IN tipo TINYINT, IN registro VARCHAR(45), IN idprov INT)
BEGIN
  INSERT INTO producto(nombre_producto, precio_producto, descripcion_producto, nombre_tipo, registrosanitario, proveedor_idproveedor)
  VALUES(nombre, precio, descripcion, tipo, registro, idprov);
END //
DELIMITER ;

-- Actualizar producto
DELIMITER //
CREATE PROCEDURE actualizar_producto(IN id INT, IN nombre VARCHAR(60), IN precio INT, IN descripcion VARCHAR(95),
                                     IN tipo TINYINT, IN registro VARCHAR(45), IN idprov INT)
BEGIN
  UPDATE producto
  SET nombre_producto = nombre,
      precio_producto = precio,
      descripcion_producto = descripcion,
      nombre_tipo = tipo,
      registrosanitario = registro,
      proveedor_idproveedor = idprov
  WHERE idproducto = id;
END //
DELIMITER ;

-- Eliminar producto
DELIMITER //
CREATE PROCEDURE eliminar_producto(IN id INT)
BEGIN
  DELETE FROM producto WHERE idproducto = id;
END //
DELIMITER ;
