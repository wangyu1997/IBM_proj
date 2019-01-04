create table first_category
(
  first_category_name varchar(100) not null,
  first_category_id   varchar(100) not null,
  constraint first_category_first_category_id_uindex
    unique (first_category_id),
  constraint first_category_first_category_name_uindex
    unique (first_category_name)
);

alter table first_category
  add primary key (first_category_id);

create table second_category
(
  second_category_id   varchar(100) not null,
  first_category_id    varchar(100) not null,
  second_category_name varchar(100) not null,
  constraint second_category_second_category_id_uindex
    unique (second_category_id),
  constraint second_category_second_category_name_uindex
    unique (second_category_name)
);

create index second_category_first_category_first_category_id_fk
  on second_category (first_category_id);

alter table second_category
  add primary key (second_category_id);

create table product
(
  product_id          varchar(100)   not null,
  product_name        varchar(1000)  not null,
  second_category_id  varchar(100)   not null,
  product_price       double         not null,
  product_description varchar(10000) null,
  product_left_totals int            not null,
  constraint product_product_id_uindex
    unique (product_id),
  constraint product_second_category_second_category_id_fk
    foreign key (second_category_id) references second_category (second_category_id)
      on update cascade on delete cascade
);

alter table product
  add primary key (product_id);

create table image
(
  image_id   varchar(1000) not null,
  product_id varchar(100)  null,
  image_url  varchar(1000) not null,
  constraint image_image_id_uindex
    unique (image_id),
  constraint image_product_product_id_fk
    foreign key (product_id) references product (product_id)
      on update cascade on delete cascade
);

alter table image
  add primary key (image_id);

create table user
(
  user_id       varchar(100)                                                                                         not null,
  user_password varchar(100)                                                                                         not null,
  role          tinyint(1)   default 0                                                                               not null,
  user_name     varchar(100)                                                                                         not null,
  head_img      varchar(100) default 'http://tuchuang-1252747889.cosgz.myqcloud.com/2018-03-16-default_head_img.jpg' not null,
  birthday      date         default '2008-12-29'                                                                    null,
  constraint user_user_id_uindex
    unique (user_id),
  constraint user_user_name_uindex
    unique (user_name)
);

alter table user
  add primary key (user_id);

create table address
(
  address_id         varchar(100) not null,
  user_id            varchar(100) not null,
  phone_number       varchar(100) not null,
  address_info       varchar(500) not null,
  is_default_address bit          null,
  constraint address_address_id_uindex
    unique (address_id),
  constraint address_user_user_id_fk
    foreign key (user_id) references user (user_id)
      on update cascade on delete cascade
);

alter table address
  add primary key (address_id);

create table cart
(
  user_id    varchar(100) null,
  totals     int(255)     null,
  product_id varchar(100) null,
  constraint pro_for
    foreign key (product_id) references product (product_id)
      on update cascade on delete cascade,
  constraint user_for
    foreign key (user_id) references user (user_id)
      on update cascade on delete cascade
);

create table comment
(
  comment_id      varchar(100)                           not null,
  comment_content varchar(10000) default '买家长时间未评论，默认好评' not null,
  product_id      varchar(100)                           not null,
  user_id         varchar(100)                           not null,
  comment_date    date                                   not null,
  constraint comment_comment_id_uindex
    unique (comment_id),
  constraint comment_product_product_id_fk
    foreign key (product_id) references product (product_id)
      on update cascade on delete cascade,
  constraint comment_user_user_id_fk
    foreign key (user_id) references user (user_id)
      on update cascade on delete cascade
);

alter table comment
  add primary key (comment_id);

create table message
(
  message_id      varchar(100) not null,
  sender_id       varchar(100) not null,
  recv_id         varchar(100) null,
  message_content varchar(500) null,
  send_time       date         null,
  is_read         bit          null,
  constraint message_message_id_uindex
    unique (message_id),
  constraint message_user_user_id_fk_1
    foreign key (recv_id) references user (user_id)
      on update cascade on delete cascade,
  constraint message_user_user_id_fk_2
    foreign key (sender_id) references user (user_id)
      on update cascade on delete cascade
);

alter table message
  add primary key (message_id);

create table user_order
(
  order_id     varchar(100) not null,
  order_date   date         null,
  user_id      varchar(100) not null,
  address_id   varchar(100) not null,
  order_status varchar(100) not null,
  constraint order_order_id_uindex
    unique (order_id),
  constraint user_order_address_address_id_fk
    foreign key (address_id) references address (address_id)
      on update cascade on delete cascade,
  constraint user_order_user_user_id_fk
    foreign key (user_id) references user (user_id)
      on update cascade on delete cascade
);

alter table user_order
  add primary key (order_id);

create table order_item
(
  product_id    varchar(100) not null,
  order_id      varchar(100) not null,
  product_count int          not null,
  primary key (product_id, order_id),
  constraint order_item_user_order_order_id_fk
    foreign key (order_id) references user_order (order_id)
      on update cascade on delete cascade
);


