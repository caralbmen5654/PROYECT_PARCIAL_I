/*
	Realiza el analisis del modo en que opera la biblioteca de la escuela.
	Anota las reglas de negocio que consideras necesarias para el DE-R.
	Realiza el DE-R y anota cómo se interconecta cada entida y nombre de su relación con otra.
	Indica claramente la cardinalidad y la dirección de la misma.
	Una vez revisado el DE-R por el docente, desarrolla cada una de las entidades con por lo menos 10 registros
	(Pueden ser de prueba), para poder garantizar las consultas que te serán asignadas en el siguiente paso.
	Deberás realizar el totl de las consultas para poder acreditar el proyecto,
	Una vez terminado todo... sube y comparte en tu cuenta de GitHub cada Query realizado con la cuenta de 
	GitHub del docente.
	
	PROYECTO DE RECUPERACION EN CASO DE NO ENTREGAR EL PRIMERO. (Calificación máxima 8).
	Realizar una base de datos del proceso que se lleva a cabo en el área de enfermería (Enf. Benita).
	Para el control de los alumnos que asisten a esta área y son atendidos, medicados, intervenidos,
	o canalizados al centro de salud.
	
	Fecha de entrega: Lunes 18 de Septiembre del 2023
	Hora límite de entrega: 16:00 h
	Formato de entrega: Libreta y Memoria, Códigos en GitHub 
	
	Fecha máxima de la primera revisión (DE-R): Viernes 15 de Septiembe del 2023
	Fecha de entrega máxima de los Querys para las consultas Viernes 15 de Septiembre
*/
CREATE DATABASE BD_BIBLIOTECA_ESCUELA
USE bd_biblioteca_escuela
/*DROP DATABASE bd_biblioteca_escuela*/
CREATE TABLE AUTOR
(
	Cve_Autor VARCHAR(3), Nombre_Autor VARCHAR(20), Apellido_Autor VARCHAR(20), Pais_Autor VARCHAR(20),
	CONSTRAINT pk_autor PRIMARY KEY(Cve_Autor)
)
CREATE TABLE CATEGORIA
(
	Cve_Categoria VARCHAR(3), Nombre_Categoria VARCHAR(30),
	CONSTRAINT pk_categoria PRIMARY KEY(Cve_Categoria)
)
CREATE TABLE EDITORIAL
(
	Cve_Editorial VARCHAR(3), Nombre_Editorial VARCHAR(30),
	CONSTRAINT pk_editorial PRIMARY KEY(Cve_Editorial)
)
CREATE TABLE USUARIO
(
	Cve_Usuario VARCHAR(3), Nombre_Usuario VARCHAR(20), Apellido_Usuario VARCHAR(20), Grupo_Usuario VARCHAR(10), Telefono_Usuario VARCHAR(4),
	CONSTRAINT pk_usuario PRIMARY KEY(Cve_Usuario)
)
CREATE TABLE LIBRO
(
	No_Inventario VARCHAR(4), Titulo_Libro VARCHAR(30),Cve_Categoria3 VARCHAR(3), Cve_Autor1 VARCHAR(3), Cve_Editorial2 VARCHAR(3), Estado_Libro VARCHAR(30),
	CONSTRAINT pk_libro PRIMARY KEY(No_Inventario),
	CONSTRAINT fk_autor FOREIGN KEY(Cve_Autor1) REFERENCES AUTOR(Cve_Autor),
	CONSTRAINT fk_editorial FOREIGN KEY(Cve_Editorial2) REFERENCES EDITORIAL(Cve_Editorial),
	CONSTRAINT fk_cat FOREIGN KEY(Cve_Categoria3) REFERENCES CATEGORIA(Cve_Categoria)
)
CREATE TABLE PRESTAMO
(
	Cve_Prestamo VARCHAR(3), No_Inventario1 VARCHAR(4), Cve_Usuario2 VARCHAR(3), Fecha_Prestamo DATE, Fecha_Devolucion DATE, Garantía VARCHAR(10), Estado VARCHAR(20),
	CONSTRAINT pk_prestamo PRIMARY KEY(Cve_Prestamo),
	CONSTRAINT fk_inv FOREIGN KEY(No_Inventario1) REFERENCES LIBRO(No_Inventario),
	CONSTRAINT fk_user FOREIGN KEY(Cve_Usuario2) REFERENCES USUARIO(Cve_Usuario)
)
CREATE TABLE PAGO
(
	Cve_Pago VARCHAR(3), Cve_Usuario1 VARCHAR(3), Cve_Prestamo2 VARCHAR(3), Monto_$ VARCHAR(3),
	CONSTRAINT pk_pago PRIMARY KEY(Cve_Pago),
	CONSTRAINT fk_userp FOREIGN KEY(Cve_Usuario1) REFERENCES usuario(Cve_Usuario),
	CONSTRAINT fk_prestamo FOREIGN KEY(Cve_Prestamo2) REFERENCES prestamo(Cve_Prestamo)
)

 INSERT INTO autor values
 ('A01','Daniela','Martínez','Colombia'),
 ('A02','Gustavo','Vigil','Venezuela'),
 ('A03','Francisco','Aguilar','Argentina'),
 ('A04','Jesús','Martínez','España'),
 ('A05','Diego','Hernández','Noruega'),
 ('A06','Josué','Chavero','Francia'),
 ('A07','Calorina','Reséndiz','Italia'),
 ('A08','Ana','Alvarado','México'),
 ('A09','Axel','Reyes','Ecuador'),
 ('A10','Isaac','Newton','México')
 INSERT INTO categoria values
 ('C01','Terror'),
 ('C02','Suspenso'),
 ('C03','Comedia'),
 ('C04','Literatura'),
 ('C05','Trigonometría'),
 ('C06','Relatos'),
 ('C07','Fantasía'),
 ('C08','Tecnología'),
 ('C09','Programación'),
 ('C10','Cálculo')
 INSERT INTO editorial values
 ('E01','LibrosNet'),
 ('E02','Del Rincón'),
 ('E03','Lectores'),
 ('E04','Letras'),
 ('E05','XD'),
 ('E06','El Librito'),
 ('E07','lee un Libro'),
 ('E08','Somos Lectores'),
 ('E09','Estudiatec'),
 ('E10','Ghandi')
 INSERT INTO libro values
 ('0001','El Principito','C07','A06','E02','En Inventario'),
 ('0002','Odio Odiar','C03','A02','E07','Perdido'),
 ('0003','Baldor','C09','A08','E08','Prestado'),
 ('0004','Matemáticas I','C05','A09','E10','En Inventario'),
 ('0005','Pesadillas Para Cenar','C01','A07','E04','Prestado'),
 ('0006','Las Mil y Una Noches','C06','A04','E03','Perdido'),
 ('0007','Robots','C08','A01','E05','Perdido'),
 ('0008','Harry Potter','C02','A03','E01','Prestado'),
 ('0009','Puedes Programar','C10','A10','E06','En Inventario'),
 ('0010','Cascanuees','C04','A05','E08','En Inventario')
 INSERT INTO usuario values
 ('U01','Juan','Martínez','5-TPROG','1234'),
 ('U02','Pedro ','Morales','3-TPGA-A','4567'),
 ('U03','Sebastián','Montoya','1-TPGA-B','7890'),
 ('U04','José','Madero','5-TPGA-A','1987'),
 ('U05','Eduardo','Hernández','1-TPROG','7654'),
 ('U06','Kevin','Pérez','5-TPROG','4321'),
 ('U07','Brayan','Pérez','1-TPGA-B','1598'),
 ('U08','Francisco','Vigil','3-TPROG','7532'),
 ('U09','Ernesto','De la Cruz','5-TPROG','2589'),
 ('U10','Enrique','Morán','3-TPGA-A','9632')
 INSERT INTO prestamo values
 ('P01','0002','U09','2023/08/09','2023/08/12','3 Dias','No Entregado'),
 ('P02','0005','U01','2023/09/08','2023/09/03','5 Dias','Garantía'),
 ('P03','0006','U05','2023/08/12','2023/08/20','8 Dias','No Entregado'),
 ('P04','0007','U06','2023/08/03','2023/08/10','7 Dias','No Entregado'),
 ('P05','0003','U09','2023/08/30','2023/08/30','26 Dias','Garantía'),
 ('P06','0008','U02','2023/09/01','2023/09/20','19 Dias','Garantía')
 INSERT INTO pago values
 ('M01','U09','P01','20'),
 ('M02','U05','P03','300'),
 ('M03','U06','P04','450')
 SELECT * FROM autor
 SELECT * FROM categoria
 SELECT * FROM editorial
 SELECT * FROM libro
 SELECT * FROM usuario
 SELECT * FROM prestamo
 SELECT * FROM pago
 
 
/*
	Queremos saber : 	
*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*	1.- A qué categoría pertenece el libro seleccionado.*/
	SELECT Titulo_Libro, Nombre_Categoria
	FROM libro INNER JOIN categoria
	ON libro.Cve_Categoria3 = categoria.Cve_Categoria
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*	2.- Todos los libros que pertenecen a un determinado editorial.*/
	SELECT Titulo_Libro, Nombre_Editorial
	FROM libro INNER JOIN Editorial
	ON libro.Cve_Editorial2 = editorial.Cve_Editorial
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*	3.- Qué libros ha escrito determinado autor.*/
	SELECT Titulo_Libro, Nombre_Autor
	FROM libro INNER JOIN Autor
	ON libro.Cve_Autor1 = autor.Cve_Autor
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*	4.- Qué libros están prestados.*/
	SELECT Titulo_Libro, Estado_Libro
	FROM libro
	WHERE Estado_Libro= 'Prestado'
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/	
/*	5.- Qué personas tienen los libros que se prestaron.*/
	SELECT Cve_Prestamo, Nombre_Usuario, Titulo_Libro, Estado_Libro
	FROM prestamo INNER JOIN libro
	ON prestamo.No_Inventario1 = libro.No_Inventario
	INNER JOIN Usuario
	ON prestamo.Cve_Usuario2= usuario.Cve_Usuario
	WHERE Estado_Libro= 'Prestado'
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/	
/*	6.- Qué personas deben libros pq ya no los entregaron.*/
	SELECT Cve_Prestamo, Nombre_Usuario, Titulo_Libro, Estado
	FROM prestamo INNER JOIN libro
	ON prestamo.No_Inventario1 = libro.No_Inventario
	INNER JOIN Usuario
	ON prestamo.Cve_Usuario2= usuario.Cve_Usuario
	WHERE Estado= 'No entregado'
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/	
/*	7.- Qué personas tienen multas por no regresar libros.*/
	SELECT Cve_Pago, Nombre_Usuario, Estado, Monto_$
	FROM pago INNER JOIN usuario
	ON pago.Cve_Usuario1 = usuario.Cve_Usuario
	INNER JOIN prestamo on
	pago.Cve_Prestamo2= prestamo.Cve_Prestamo
	WHERE Estado='No Entregado'
/*	8.- Cuantos libros son de cada area.(Categoría)*/
	SELECT Titulo_Libro, Nombre_Categoria
	FROM libro INNER JOIN categoria
	ON libro.Cve_Categoria3= categoria.Cve_Categoria
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/	
/*	9.- Cuantos libros son de cada editorial*/
	SELECT Titulo_Libro, Nombre_Editorial
	FROM libro INNER JOIN Editorial
	ON libro.Cve_Editorial2 = editorial.Cve_Editorial
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/	
/*	10.- Qué personas, de qué autores y de qué editoriales tienen libros prestados.*/
	SELECT Nombre_Usuario, Titulo_Libro, Nombre_Autor,Apellido_Autor, Nombre_Editorial, Estado
	FROM prestamo INNER JOIN libro
	ON prestamo.No_Inventario1= libro.No_Inventario
	INNER JOIN autor
	ON libro.Cve_Autor1 = autor.Cve_Autor
	INNER JOIN editorial
	ON libro.Cve_Editorial2= editorial.Cve_Editorial
	INNER JOIN usuario 
	ON prestamo.Cve_Usuario2= usuario.Cve_Usuario
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/	
/*	11.- Qué personas están en garantía de libros.*/
	SELECT Cve_Prestamo, Nombre_Usuario, Titulo_Libro, Estado
	FROM prestamo INNER JOIN libro
	ON prestamo.No_Inventario1 = libro.No_Inventario
	INNER JOIN Usuario
	ON prestamo.Cve_Usuario2= usuario.Cve_Usuario
	WHERE Estado= 'Garantia'
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////////////////////////////////////////////////////////////////////*/	
/*	12.- Qué libros han sido perdidos y no se han repuesto.*/
	SELECT Titulo_Libro, Estado_Libro
	FROM libro
	WHERE Estado_Libro= 'Perdido'  
	