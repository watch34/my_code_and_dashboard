-- create table menu which 4 columns 
create table menu (
    menu_id int,
    menu_name text,
    price numeric,    
    primary key(menu_id)
);

--insert data in table menu
insert into menu values
    (1,"Papaya salad", 100),
    (2,"Stewrd pork leg on rice", 60),
    (3,"Tom Yum Kung", 120),
    (4, "Fried pork crackling", 200),
    (5, "Massa man Curry", 150),
    (6, "Beer Thai", 70),
    (7, "Water", 20),
    (8, "Iced Tea", 50),
    (9, "Black Coffee", 90),
    (10, "Soda water", 55);

-- create table customer which 5 columns 
create table customer (
    customer_id int,
    customer_name text,
    city text,
    employee_id int,
    menu_id int,
    primary key(customer_id),
    foreign key(menu_id) references menu(menu_id)
);

--insert data in table customer
insert into customer values
    (1, "watch", "Bangkok", 1, 5),
    (2, "nam", "ChiangRai", 2, 6),
    (3, "kathi", "Nonthaburi", 3, 1),
    (4, "mumy", "Rayong", 4, 2),
    (5, "happy", "Saraburi", 5, 9),
    (6, "toy", "Samutsakhon", 6, 7),
    (7, "john", "Yasothon", 7, 4),
    (8, "sara", "Surin", 8, 1),
    (9, "emma", "Trang", 9, 2),
    (10, "mom", "Songkhal", 10, 3);

-- create table employee which 4 columns 
create table employee (
    id_emp int,
    name text,
    salary int,
    position text,
    primary key(id_emp)
);

--insert data in table employee
insert into employee values
    (1, "Aleister", 18500, "General_Manager"),
    (2, "Capheny", 20000, "Chef"),
    (3, "Murad", 15000, "Bartender"),
    (4, "Emily", 16000,"Cashier"),
    (5, "Violet",25000, "Kitchen_Manager"),
    (6, "Baldum", 16000, "Bartender"),
    (7, "Yorn", 27000, "Beverage_Manager"),
    (8, "Mina", 16000, "Cashier"),
    (9, "Dirak", 16000, "Dishwasher"),
    (10, "WuKong", 16000, "Dishwasher");

-- create table supplier which 3 columns 
create table supplier (
    supplier_id int,
    supplier_name text,
    invoice_id,
    primary key(supplier_id),
    foreign key(invoice_id) references invoice(invoice_id)
);

--insert data in table supplier
insert into supplier values
    (1, "alisa", 001),
    (2, "gavin", 002),
    (3, "jacky", 003),
    (4, "mark", 006),
    (5, "sophie", 005),
    (6, "siri", 008),
    (7, "tara", 004),
    (8, "xanti", 009),
    (9, "yanin", 007),
    (10, "rudy", 010);

-- create table invoice 6 columns
create table invoice (
    invoice_id int,
    invoice_date text,
    menu_id int, 
    menu_name text, 
    price decimal,
    supplier_id int,
    primary key(invoice_id),
    foreign key(menu_id) references menu(menu_id),
    foreign key(menu_name) references menu(menu_name),
    foreign key(supplier_id) references supplier(supplier_id)
);

--insert data in table invoice
insert into invoice values
    (001, "2022-08-01", 3, "Fried pork crackling", 400, 5),
    (002, "2022-07-31", 4, "Stewrd pork leg on rice", 250, 10),
    (003, "2022-05-22", 9, "Papaya salad", 90, 4),
    (004, "2022-04-15", 7, "Beer Thai", 60, 1),
    (005, "2022-11-11", 10, "Fried pork crackling", 150, 3),
    (006, "2022-01-09", 3, "Massa man Curry", 240, 2),
    (007, "2022-08-07", 3, "Water", 10, 9),
    (008, "2022-05-18", 5, "Tom Yum Kung", 350, 7),
    (009, "2022-04-27", 6, "Fried pork crackling", 80, 6),
    (010, "2022-03-23", 1, "Tom Yum Kung", 350, 4);
    
    
-- select all 
select * from menu;
select * from customer;
select * from member;
select * from supplier;
select * from invoice;


-- selct in table menu price > 100
select 
    menu.menu_id as Menu_ID,
    menu.menu_name as Name_menu,
    menu.price as Price
from menu 
where price > 100
order by price desc;

-- select and Join
select 
    A.menu_name,
    A.price,
    B.menu_id,
    B.invoice_id,
    B.inovice_date
from menu as A
join  invoice B on A.menu_id = B.menu_id
order by A.price;

-- select and Join
select 
    A.menu_id,
    A.menu_name,
    C.customer_name,
    C.city,
    S.supplier_name,
    B.invoice_id,
    B.menu_name,
    B.price as invoice_price
from menu A
join invoice B on A.menu_id = B.menu_id 
join customer C on C.menu_id = B.menu_id
join supplier S on S.supplier_id = B.supplier_id
group by A.menu_name;
