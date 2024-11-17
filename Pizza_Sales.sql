create database Pizzahut;

use pizzahut;

create table orders (
order_id int not null,
order_date date not null,
order_Time time not null, 
primary key(order_id)
);

create table order_details (
order_details_id int not null,
order_id int not null,
pizza_id text not null, 
quantity int not null,
primary key(order_details_id)
);

-- Retrieve the total number of orders placed.

select 
  count(order_id) as total_orders 
from 
  orders;

-- Calculate the total revenue generated from pizza sales.

select 
  round(
    sum(
      order_details.quantity * pizzas.price
    ), 
    2
  ) as total_sales 
from 
  order_details 
  join pizzas on pizzas.pizza_id = order_details.pizza_id;


-- Identify the highest-priced pizza.

select 
  pizza_types.name, 
  pizzas.price 
from 
  pizza_types 
  join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id 
order by 
  pizzas.price desc 
limit 1;

-- Identify the most common pizza size ordered.

select 
  pizzas.size, 
  count(order_details.order_details_id) as order_count 
from 
  pizzas 
  join order_details on pizzas.pizza_id = order_details.pizza_id 
group by 
  pizzas.size 
order by 
  order_count desc;

-- List the top 5 most ordered pizza types along with their quantities.








 