

create table _user
(
    id                    int8 generated by default as identity,
    activation_code       varchar(255),
    active                boolean,
    company_name          varchar(64),
    email                 varchar(320),
    first_name            varchar(26),
    last_name             varchar(26),
    password              varchar(255),
    phone                 int8,
    profile_image         varchar(255),
    restore_password_code varchar(255),
    username              varchar(64),
    primary key (id)
);
create table alias
(
    id             int8 generated by default as identity,
    value          varchar(255),
    field_name_id  int8,
    locale_code_id int8,
    primary key (id)
);
create table city
(
    id    int8 generated by default as identity,
    value varchar(255),
    primary key (id)
);
create table field_name
(
    id    int8 generated by default as identity,
    value varchar(255),
    primary key (id)
);
create table locale_code
(
    id   int8 generated by default as identity,
    code varchar(255),
    primary key (id)
);
create table localized_body
(
    id             int8 generated by default as identity,
    description    varchar(2048),
    features       varchar(255),
    locale_code_id int8,
    post_id        int8,
    primary key (id)
);
create table location
(
    id        int8 generated by default as identity,
    latitude  float8 not null,
    longitude float8 not null,
    name      varchar(64) not null,
    city_id   int8,
    primary key (id)
);
create table post
(
    id               int8 generated by default as identity,
    area             float8  not null,
    bathrooms        int2    not null,
    beach            int2    not null,
    bedrooms         int2    not null,
    golf             int2    not null,
    guest_bathrooms  int2    not null,
    gym              int2    not null,
    main_image       varchar(255),
    main_video       varchar(255),
    mall             int2    not null,
    parking          int2    not null,
    post_status      varchar(255),
    premium          boolean not null,
    price            int8    not null,
    publication_date DATE,
    real_estate_type varchar(255),
    swimming_pool    int2    not null,
    tennis           int2    not null,
    terrace          int2    not null,
    user_id          int8,
    location_id      int8,
    primary key (id)
);
create table post_image
(
    id      int8 generated by default as identity,
    image   varchar(255),
    post_id int8,
    primary key (id)
);
create table registry_feedback
(
    id        int8 generated by default as identity,
    email     varchar(50),
    name      varchar(50),
    question  varchar(1024),
    sent_date DATE,
    primary key (id)
);
create table subscription
(
    id          int8 generated by default as identity,
    cost        int4 not null,
    month_count int2 not null,
    name        varchar(255),
    primary key (id)
);
create table subscription_users
(
    subscription_id int8 not null,
    users_id        int8 not null
);
create table user_role
(
    user_id int8 not null,
    roles   varchar(255)
);
alter table if exists city
    add constraint UK_p7d32l75tnjb08lhhqsu3o94b unique (value);
alter table if exists alias
    add constraint FKgulj9x1iuivbr9oi0dgqkr3vo foreign key (field_name_id) references field_name;
alter table if exists alias
    add constraint FK62jbx8viwcmfr9kxufa5xuhos foreign key (locale_code_id) references locale_code;
alter table if exists localized_body
    add constraint FK4pvmm7bve74fll1nbxrgejhl1 foreign key (locale_code_id) references locale_code;
alter table if exists localized_body
    add constraint FKdg3mu3k3nm3hwtwsbywfs2gph foreign key (post_id) references post;
alter table if exists location
    add constraint FKr2gdhhu8rhyrvslukhtfbg8v5 foreign key (city_id) references city;
alter table if exists post
    add constraint FKrh90w2rgxa8jj5r0kjlaims1y foreign key (user_id) references _user;
alter table if exists post
    add constraint FKi1psqwjnonr2lmbvxow5walgf foreign key (location_id) references location;
alter table if exists post_image
    add constraint FKsip7qv57jw2fw50g97t16nrjr foreign key (post_id) references post;
alter table if exists subscription_users
    add constraint FKqdm12do2idngo9pjpki6nfby2 foreign key (users_id) references _user;
alter table if exists subscription_users
    add constraint FK8c37hn455jixvsvqthtn2h052 foreign key (subscription_id) references subscription;
alter table if exists user_role
    add constraint FKniaqoclrvx138sjw9hsollqav foreign key (user_id) references _user;