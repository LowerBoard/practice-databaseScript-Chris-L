START TRANSACTION;

create table restaurant (
  id int primary key not null auto_increment,
  unit_number int,
  has_dine_in boolean,
  has_drive_thru boolean,
  has_carry_out boolean,
  open_weekends boolean,
  open_days boolean,
  phone_number varchar(20)
);

create table menu (
  id int primary key not null auto_increment,
  restaurant_id int not null references restaurant(id),
  unit_number int,
  menu_item_one varchar(40),
  menu_item_two varchar(40),
  menu_item_three varchar(40),
  menu_item_one_price double,
  menu_item_two_price double,
  menu_item_three_price double
);

create table inventory (
  item_id int primary key not null auto_increment,
  restaurant_id int not null references restaurant(id),
  unit_number int,
  item_description varchar(50),
  item_one_quantity int,
  item_two_quantity int,
  item_three_quantity int
);

create table food_order (
  order_id int primary key not null auto_increment,
  restaurant_id int not null references restaurant(id),
  item_ordered varchar(80),
  order_total double,
  reward_points_gained double,
  is_drive_thru_order boolean,
  is_carry_out_order boolean,
  is_dine_in_thru_order boolean,
  online_order boolean,
  promised_pickup_time timestamp,
  order_closed boolean
);

create table customer (
  id int primary key not null auto_increment,
  restaurant_id int not null references restaurant(id),
  first_name varchar(100),
  last_name varchar(100),
  email varchar(100),
  age int ,
  is_enrolled boolean
);

ROLLBACK;

