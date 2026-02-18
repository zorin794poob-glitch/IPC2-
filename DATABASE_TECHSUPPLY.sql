                                                                       -- BASE DE DATOS SQL DEL TECHSUPPLY
-- Creacion de la base de Datos TechSupply
CREATE DATABASE SISTEMADB_TECHSUPPLY;
USE SISTEMADB_TECHSUPPLY;

--Creamos las tablas

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Direccion VARCHAR(100) NOT NULL,
    NombreCliente VARCHAR(200) NOT NULL,
    TipoCliente VARCHAR(100) NOT NULL,
    CompraRealizada VARCHAR(500) NOT NULL
);

CREATE TABLE Pedido (
    NumeroPedido INT PRIMARY KEY,
    ID_Cliente INT,
    CantidadProducto INT,
    ProductoAdquirido VARCHAR(500) NOT NULL,
    FechaCompra VARCHAR(500) NOT NULL
);

CREATE TABLE PedidoRealizado(
    NumeroPedido INT,
    CodigoProducto INT
);

CREATE TABLE Producto (
    CodigoProducto INT PRIMARY KEY,
    Precio INT,
    CantidadStock INT,
    NombreProducto VARCHAR(200) NOT NULL,
    DescripcionProducto VARCHAR(500) NOT NULL
);

CREATE TABLE ProveedorProducto (
    CodigoProducto INT,
    NumeroContacto INT
);

CREATE TABLE Proveedor (
    NumeroContacto INT PRIMARY KEY,
    DireccionProveedor VARCHAR (100) NOT NULL,
    NombreProveedor VARCHAR(200) NOT NULL,
    TipoProducto VARCHAR(200) NOT NULL
);

CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY,
    NombreEmpleado VARCHAR(200) NOT NULL,
    CodigoSucursal INT,
    Cargo VARCHAR(200) NOT NULL,
    GestionPedidos INT,
    NumeroPedido INT
);

CREATE TABLE Facturacion (
    NumeroFactura INT PRIMARY KEY,
    EstadoPago BOOLEAN NOT NULL,
    MontoTotal INT,
    ID_Empleado INT,
    FechaEmision VARCHAR(100) NOT NULL
);

CREATE TABLE Sucursal (
    CodigoSucursal INT PRIMARY KEY,
    Ubicacion VARCHAR (100) NOT NULL,
    ListaEmpleados VARCHAR(100) NOT NULL
);

--Creamos lazos con llaves foraneas

ALTER TABLE Pedido 
ADD CONSTRAINT FK_CLIENTE 
FOREIGN KEY(ID_Cliente) REFERENCES Cliente(ID_Cliente);

ALTER TABLE PedidoRealizado 
ADD CONSTRAINT FK_PEDIDO 
FOREIGN KEY(NumeroPedido) REFERENCES Pedido(NumeroPedido);

ALTER TABLE PedidoRealizado 
ADD CONSTRAINT FK_PEDIDOS 
FOREIGN KEY(CodigoProducto) REFERENCES Producto(CodigoProducto);

ALTER TABLE ProveedorProducto 
ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY(NumeroContacto) REFERENCES Proveedor(NumeroContacto);

ALTER TABLE ProveedorProducto 
ADD CONSTRAINT FK_PRODUCTOS
FOREIGN KEY(CodigoProducto) REFERENCES Producto(CodigoProducto);

ALTER TABLE Empleado 
ADD CONSTRAINT FK_EMPLEADO
FOREIGN KEY(CodigoSucursal) REFERENCES Sucursal(CodigoSucursal);

ALTER TABLE Empleado 
ADD CONSTRAINT FK_EMPLEADOS
FOREIGN KEY(NumeroPedido) REFERENCES Pedido(NumeroPedido);

ALTER TABLE Facturacion 
ADD CONSTRAINT FK_FACTURA
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado);
