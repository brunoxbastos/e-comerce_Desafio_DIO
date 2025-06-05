select count(*) from clients;

select * from clients c, orders o where c.id_Clients = o.id_Orders;

-- quais produtos o cliente comprou
select c.id_Clients, c.full_Name, o.id_Orders, p.product_Name 
	from clients c
	join orders o on c.id_clients = o.id_Clients
	join orders_item oi on o.id_Orders = oi.id_Orders
	join product p on oi.id_Product = p.id_Product;

-- quais clientes tem mais de 1 pedido
select c.id_Clients, c.full_Name,
	count(o.id_Orders) as total_pedidos
    from clients c
    join orders o on c.id_Clients = o.id_Clients
    group by c.id_Clients, c.full_Name
    having count(o.id_Orders) > 1;
    
-- quais cidades tiveram pedidos em ordem decrecente
select a.city,
	count(o.id_Orders) as total_pedidos
    from orders o
    join clients c on o.id_Clients = c.id_Clients
    join address a on c.id_Address = a.id_Address
    group by a.city
    order by total_pedidos desc;

-- quais clientes pediram o smartphone x
select c.id_Clients, c.full_Name, o.id_Orders, p.product_name
	from orders o
    join clients c on o.id_Clients = c.id_Clients
    join orders_item oi on o.id_Orders = oi.id_Orders
    join product p on oi.id_Product = p.id_Product
    where p.product_Name = 'Smartphone X';
    
-- quais clientes pediram a camiseta polo por id
select c.id_Clients, c.full_Name, o.id_Orders, p.product_name
	from orders o
    join clients c on o.id_Clients = c.id_Clients
    join orders_item oi on o.id_Orders = oi.id_Orders
    join product p on oi.id_Product = p.id_Product
    where p.id_Product = 2;
    
-- quantos são cada tipo de cliente
select
	type_Clients,
    count(*) as tipos_de_clientes
    from clients
    group by type_Clients;
    
    