INSERT INTO main._user (activation_code, active, company_name, email, first_name, last_name, password, phone, profile_image, restore_password_code, username) VALUES (null, true, 'Real Estate Luxury', 'coconutvillages@gmail.com', 'Александр', ' ', '$2a$08$4v2hLMSsAho4NDfbCpJm7eMKZB1UNjTjpRYPbBGNqK3t4AIQSQiaq', 18095041326, '/img/logo-2.jpg', null, 'admin');
INSERT INTO main._user (activation_code, active, company_name, email, first_name, last_name, password, phone, profile_image, restore_password_code, username) VALUES (null, true, 'Real Estate Luxury 2', 'rusoo.zemboo@gmail.com', 'Ruslan', 'Kharlamov', '$2a$08$L7A1FBMqdHbzrDXeS.benOF4Tk0RaQsCNYC4hJBUEIfqWFLIHo2iq', 18095053605, '/img/8953cd1e-47c5-4299-b470-85110bf9a18c.jpg', null, 'ruslan.lfg');

INSERT INTO main.user_role (user_id, roles) VALUES (1, 'ADMIN');
INSERT INTO main.user_role (user_id, roles) VALUES (1, 'USER');
INSERT INTO main.user_role (user_id, roles) VALUES (2, 'ADMIN');
INSERT INTO main.user_role (user_id, roles) VALUES (2, 'USER');