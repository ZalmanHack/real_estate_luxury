INSERT INTO main._user (activation_code, active, company_name, email, first_name, last_name, password, phone, profile_image, restore_password_code, username)
VALUES (null, true, 'Real Estate Luxury', 'coconut.villages@gmail.com', 'Александр', '', '$2a$08$2TfD7t8FUJjSWl0TwnGD3OupehrPBjstQgPJnOaoOmcfTmDpZ6eLG', 18095041326, '/img/logo-2.jpg', null, 'admin');
INSERT INTO main._user (activation_code, active, company_name, email, first_name, last_name, password, phone,profile_image, restore_password_code, username)
VALUES (null, true, 'Zalman Hack', 'dobrenko44@gmail.com', 'Денис', 'Добренко', '$2a$08$2TfD7t8FUJjSWl0TwnGD3OupehrPBjstQgPJnOaoOmcfTmDpZ6eLG', 79650745017, null, null, 'zalman_hack');

INSERT INTO main.user_role (user_id, roles) VALUES (1, 'ADMIN');
INSERT INTO main.user_role (user_id, roles) VALUES (1, 'USER');
INSERT INTO main.user_role (user_id, roles) VALUES (2, 'ADMIN');
INSERT INTO main.user_role (user_id, roles) VALUES (2, 'USER');