CREATE TABLE `user` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `Dob` date DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `Password` varchar(45) NOT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Postal_code` varchar(45) DEFAULT NULL,
  `privilege_num` varchar(45) NOT NULL DEFAULT '0',
  `role` varchar(45) DEFAULT NULL,
  `payment_preference` int DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`User_id`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `user_access_log` (
  `user_id` int NOT NULL,
  `user_access_type` varchar(45) NOT NULL,
  `user_access_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`user_access_time`),
  CONSTRAINT `User_access_log_user_User_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



INSERT INTO user (user_name, first_name, last_name, email, dob, phone_number, password, street, city, state, postal_code, privilege_num, role, payment_preference) VALUES ('admin', 'admin', 'admin', 'admin@iot.com', '2000-01-01', '0455417000', 'admin123', '', '', '', '', 10, 'admin', 0);

create table cart_item
(
    Cart_id       int     not null,
    Item_id       int     not null,
    Item_quantity int     null,
    Item_selected tinyint null,
    primary key (Cart_id, Item_id),
    constraint Cart_id_UNIQUE
        unique (Cart_id)
);

create table category
(
    Cate_id          int         not null
        primary key,
    Cate_name        varchar(45) not null,
    Cate_description varchar(45) null,
    constraint Cate_name_UNIQUE
        unique (Cate_name)
);

create table item
(
    Item_id          int         not null
        primary key,
    Item_name        varchar(45) not null,
    Item_location    varchar(45) not null,
    Item_price       double      not null,
    Vendor_id        varchar(45) null,
    Item_description varchar(45) null,
    Cate_id          int         null,
    Item_quantity    int         not null
);
