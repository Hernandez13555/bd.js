show databases;

use node_adso2894667;

-- eliminar la restricción de clave foránea en 'productos'
alter table productos drop foreign key productos_ibfk_1;

-- eliminar la tabla 'categorias' si ya existe
drop table if exists categorias;

-- eliminar la tabla 'productos' si ya existe
drop table if exists productos;

-- crear la tabla 'categorias'
create table categorias (
  id int auto_increment primary key, -- id de la categoría (clave primaria)
  nombre varchar(255) not null, -- nombre de la categoría
  descripcion text, -- descripción opcional de la categoría
  created_at timestamp default current_timestamp, -- fecha de creación
  updated_at timestamp default current_timestamp on update current_timestamp -- fecha de actualización
);

-- crear la tabla 'productos'
create table productos (
  id int auto_increment primary key, -- id del producto (clave primaria)
  nombre varchar(255) not null, -- nombre del producto
  descripcion text, -- descripción opcional del producto
  precio decimal(10, 2), -- precio del producto
  categoria_id int, -- clave foránea que referencia a la tabla 'categorias'
  created_at timestamp default current_timestamp, -- fecha de creación
  updated_at timestamp default current_timestamp on update current_timestamp, -- fecha de actualización
  foreign key (categoria_id) references categorias(id) on delete set null -- establece la relación y comportamiento al eliminar una categoría
);

-- insertar datos en la tabla 'categorias'
insert into categorias (nombre, descripcion) values
('electrónica', 'categoría para productos electrónicos'),
('ropa', 'categoría para prendas de vestir'),
('alimentos', 'categoría para productos alimenticios');

-- insertar datos en la tabla 'productos'
insert into productos (nombre, descripcion, precio, categoria_id) values
('smartphone', 'teléfono inteligente con 64gb de almacenamiento', 499.99, 1),
('laptop', 'portátil con pantalla de 15 pulgadas', 799.99, 1),
('camiseta', 'camiseta de algodón para hombre', 19.99, 2),
('manzanas', 'manzanas frescas de calidad', 5.99, 3);

-- consultar todas las categorías
select * from categorias;

-- consultar todos los productos
select * from productos;

-- consultar productos con su categoría
select p.id, p.nombre as producto, p.descripcion, p.precio, c.nombre as categoria
from productos p
join categorias c on p.categoria_id = c.id;

-- consultar categorías con los productos asociados
select c.id, c.nombre as categoria, p.nombre as producto
from categorias c
left join productos p on c.id = p.categoria_id;
 
-- lo ultimo se utiliza por si se elimina la tabla principal se vuelve nulo
insert into categorias (nombre, descripcion) values ('Reinel','Prueba de mysql');
select * from categorias;
update categorias set nombre='hola', descripcion='xd' WHERE id = 1;
