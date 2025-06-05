create database e_comerce;

use e_comerce;
drop database e_comerce;
drop table  pay_method;

create table address(
	id_Address int auto_increment unique primary key,
    CEP varchar(8) not null,
    Street varchar(30) not null,
    Neighborhood varchar(20) not null,
    city varchar(20) not null,
    State varchar(15) not null,
    constraint uc_address unique (Street, Neighborhood, City, State)
    );

create table clients (
	id_Clients int auto_increment primary key,
    type_Clients enum('pf', 'pj') not null,
    full_Name varchar(10) not null,
    doc_Number char(14) not null,
    birth_Date date,
    id_Address int,
	constraint unique_doc_number_client unique (doc_Number),
    constraint fk_adress_clients foreign key (id_Address) references address(id_Address),
    constraint chk_type_document check (
		(type_clients = 'pf' and char_length(doc_Number) = 11) 
		OR 
		(type_clients = 'pj' and char_length(doc_Number) = 14)),
	constraint chk_birth_date check (
		(type_clients = 'pf' and birth_Date is not null) 
		OR 
		(type_clients = 'pj' and birth_Date is null))
    );
    
create table pay_method(
	id_Pay_Method int auto_increment primary key,
    cardNumber char(16) not null,
    cardName varchar(30) not null,
    Expiration_date date not null,
    cvv char(3) not null,
    nickName varchar(20),
    constraint unique_Pay_Method unique (id_Pay_Method)
    );
    
create table supplier(
	id_Supplier int auto_increment primary key,
    Legal_name varchar(10) not null,
    CNPJ varchar(14) not null,
    Email varchar(40) not null,
    Telephone char(20),
    id_Address int,
    constraint unique_supplier unique (CNPJ),
    constraint unique_Legal_name unique (legal_name),
    constraint fk_adress_supplier foreign key (id_Address) references address(id_Address)
    );
    
create table warehouse(
	id_Warehouse int auto_increment primary key,
    id_Address int not null,
    Quantity int default 0,
    constraint fk_adress_warehouse foreign key (id_Address) references address(id_Address)
    );    
    
create table product(
	id_Product int auto_increment primary key,
    product_Name varchar(50) not null,
    Category enum('eletronico', 'vastuario', 'briquedos', 'alimento') not null,
    descProduct text(100),
    Price decimal(10, 2) not null,
    expiration_date date
    );

create table product_inventory(
	id_Product int,
    id_Supplier int,
    id_Warehouse int,
    Quantity int not null default 0,
    Batch varchar(20),
    primary key (id_Product, id_warehouse),
    constraint fk_inv_pro FOREIGN KEY (id_product) REFERENCES product(id_Product),
    constraint fk_inv_supp FOREIGN KEY (id_supplier) REFERENCES supplier(id_Supplier),
    constraint fk_inv_warehouse FOREIGN KEY (id_warehouse) REFERENCES warehouse(id_Warehouse)
    );
    
create table shipping_status(
	id_Status int auto_increment primary key,
    ship_Status enum('procesando pagamento', 'processando produto', 'enviado', 'em transporte', 'entregue') not null,
    traking_Code varchar(20),
    Carrier varchar(30),
    ship_Date date,
    estimated_Delivery date
    );
    
  create table orders(
	id_Orders int auto_increment primary key,
    id_Clients int,
    id_Pay_Method int,
    id_Status int,
    ShippingCost decimal(10,2) default 14.00,
    orders_Date timestamp default current_timestamp,
    constraint unique_orders unique (id_Orders),
    constraint fk_orders_clients foreign key (id_Clients) references clients(id_Clients),
    constraint fk_orders_pay foreign key (id_Pay_Method) references pay_method(id_Pay_Method),
    constraint fk_orders_status foreign key (id_Status) references shipping_status(id_Status)
);  

create table orders_item(
	id_Orders int,
    id_Product int,
    Quantity int not null,
    unit_Price decimal(10,2) not null,
    primary key (id_Orders, id_Product),
	constraint fk_item_orders foreign key (id_Orders) references orders(id_Orders),
    constraint fk_item_product foreign key (id_Product) references product(id_Product)
);    