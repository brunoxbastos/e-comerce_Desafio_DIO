INSERT INTO address (CEP, Street, Neighborhood, City, State)
VALUES
('01001000', 'Av Paulista', 'Bela Vista', 'São Paulo', 'SP'),
('20040002', 'Rua Uruguaiana', 'Centro', 'Rio de Janeiro', 'RJ'),
('30140071', 'Av Afonso Pena', 'Centro', 'Belo Horizonte', 'MG'),
('40010000', 'Av Sete de Setembro', 'Centro', 'Salvador', 'BA'),
('60055000', 'Rua dos Expedicionários', 'Meireles', 'Fortaleza', 'CE'),
('88015000', 'Av Beira Mar', 'Centro', 'Florianópolis', 'SC');

INSERT INTO clients (type_Clients, full_Name, doc_Number, birth_Date, id_Address)
VALUES
('pf', 'Carlos', '12345678901', '1990-06-20', 1),
('pj', 'TechCorp', '12345678000199', NULL, 2),
('pf', 'Mariana', '98765432100', '1985-02-14', 4),
('pf', 'João', '11122233344', '1995-09-10', 5),
('pj', 'FoodInc', '33221100019900', NULL, 6);

INSERT INTO pay_method (cardNumber, cardName, Expiration_date, cvv, nickName)
VALUES
('1234123412341234', 'Carlos Silva', '2027-05-31', '123', 'Cartão Carlos'),
('5678567856785678', 'TechCorp LTDA', '2028-11-30', '456', 'Cartão Empresa'),
('9999888877776666', 'Mariana Costa', '2026-10-31', '321', 'Cartão Mari'),
('5555444433332222', 'João Pedro', '2028-03-31', '654', 'Visa João'),
('7777666655554444', 'FoodInc LTDA', '2029-07-31', '789', 'Cartão Empresa 2');

INSERT INTO supplier (Legal_name, CNPJ, Email, Telephone, id_Address)
VALUES
('EletronicX', '45678912000122', 'contato@eletronicx.com', '1122334455', 1),
('FastFood', '98765432000155', 'vendas@fastfood.com', '11999887766', 3),
('MegaToys', '12121212000134', 'contato@megatoystoys.com', '1133445566', 4),
('RoupasTop', '45454545000177', 'vendas@roupastop.com', '11987654321', 5),
('DoceBom', '78787878000111', 'contato@docebom.com', '1144221133', 6);

INSERT INTO warehouse (id_Address, Quantity)
VALUES
(1, 500),
(2, 800),
(4, 1000),
(5, 1200),
(6, 1500);

INSERT INTO product (product_Name, Category, descProduct, Price, expiration_date)
VALUES
('Smartphone X', 'eletronico', 'Celular de última geração', 2999.90, NULL),
('Camiseta Polo', 'vastuario', 'Camiseta de algodão premium', 129.90, NULL),
('Boneco Super-Herói', 'briquedos', 'Boneco articulado de 30cm', 89.90, NULL),
('Chocolate Gourmet', 'alimento', 'Chocolate artesanal 70% cacau', 25.50, '2025-12-31'),
('Tablet Z', 'eletronico', 'Tablet 10 polegadas com 64GB', 1599.00, NULL),
('Calça Jeans', 'vastuario', 'Calça jeans slim masculina', 199.90, NULL),
('Boneca Princesa', 'briquedos', 'Boneca 35cm com acessórios', 129.50, NULL),
('Bolo de Pote', 'alimento', 'Bolo artesanal de chocolate', 12.00, '2025-11-15');

INSERT INTO product_inventory (id_Product, id_Supplier, id_Warehouse, Quantity, Batch)
VALUES
(1, 1, 1, 100, 'Lote20240601'),
(4, 2, 2, 300, 'Lote20240602'),
(2, 5, 5, 200, 'Lote20240603'),
(3, 3, 4, 150, 'Lote20240604'),
(5, 1, 3, 80, 'Lote20240605'),
(6, 5, 5, 100, 'Lote20240606'),
(7, 4, 4, 220, 'Lote20240607'),
(8, 3, 3, 500, 'Lote20240608');

INSERT INTO shipping_status (ship_Status, traking_Code, Carrier, ship_Date, estimated_Delivery)
VALUES
('processando produto', 'BR123456789SP', 'Correios', '2025-06-05', '2025-06-12'),
('enviado', 'BR987654321RJ', 'Jadlog', '2025-06-03', '2025-06-10'),
('enviado', 'BR123987456SP', 'Total Express', '2025-06-05', '2025-06-11'),
('em transporte', 'BR456789123RJ', 'Jadlog', '2025-06-04', '2025-06-10'),
('entregue', 'BR789456123MG', 'Correios', '2025-06-01', '2025-06-05');

INSERT INTO orders (id_Clients, id_Pay_Method, id_Status, ShippingCost)
VALUES
(1, 1, 1, 14.00),
(2, 2, 2, 25.00),
(3, 3, 3, 20.00),
(2, 2, 4, 30.00),
(1, 1, 5, 14.00);

INSERT INTO orders_item (id_Orders, id_Product, Quantity, unit_Price)
VALUES
(1, 1, 1, 2999.90),
(2, 4, 5, 25.50),
(3, 2, 2, 129.90),
(4, 7, 10, 129.50),
(5, 1, 1, 2999.90),
(5, 8, 4, 12.00);


desc product_inventory;

