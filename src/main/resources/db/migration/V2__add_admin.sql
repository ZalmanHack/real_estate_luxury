INSERT INTO main._user (activation_code, active, company_name, email, first_name, last_name, password, phone, profile_image, restore_password_code, username)
VALUES (null, true, 'Real Estate Luxury', 'coconut.villages@gmail.com', 'Александр', ' ', '$2a$08$2TfD7t8FUJjSWl0TwnGD3OupehrPBjstQgPJnOaoOmcfTmDpZ6eLG', 18095041326, '/img/logo-2.jpg', null, 'admin');

INSERT INTO main.user_role (user_id, roles) VALUES (1, 'ADMIN');
INSERT INTO main.user_role (user_id, roles) VALUES (1, 'USER');