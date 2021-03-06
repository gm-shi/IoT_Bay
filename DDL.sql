
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


create table user
(
    User_id            int auto_increment,
    user_name          varchar(45)                           not null,
    first_name         varchar(45)                           null,
    last_name          varchar(45)                           null,
    email              varchar(45)                           not null,
    Dob                date                                  null,
    phone_number       varchar(45)                           null,
    Password           varchar(45)                           not null,
    Street             varchar(45)                           null,
    City               varchar(45)                           null,
    State              varchar(45)                           null,
    Postal_code        varchar(45)                           null,
    privilege_num      varchar(45) default '0'               not null,
    role               varchar(45)                           null,
    payment_preference int                                   null,
    time_created       timestamp   default CURRENT_TIMESTAMP not null,
    primary key (User_id, email),
    constraint email_UNIQUE
        unique (email)
);

create table user_access_log
(
    user_id          int                                not null,
    user_access_type varchar(45)                        not null,
    user_access_time datetime default CURRENT_TIMESTAMP not null,
    primary key (user_id, user_access_time),
    constraint User_access_log_user_User_id_fk
        foreign key (user_id) references user (User_id)
);

create table cart
(
    cart_id int auto_increment
        primary key,
    user_id int not null,
    constraint cart_cart_id_uindex
        unique (cart_id)
);

create table `order`
(
    order_id        int auto_increment
        primary key,
    user_id         int          not null,
    payment_id      int          not null,
    date            date         null,
    tracking_number int          not null,
    status          varchar(32)  null,
    comment         varchar(512) null,
    cart_id         int          not null
);



