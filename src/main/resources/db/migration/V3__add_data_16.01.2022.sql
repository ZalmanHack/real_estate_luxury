-- locale_code ---------------------------------------------------------------------------------------------------------

INSERT INTO main.locale_code (id, code) VALUES (1, 'en');
INSERT INTO main.locale_code (id, code) VALUES (2, 'ru');
INSERT INTO main.locale_code (id, code) VALUES (3, 'es');

-- field_name ----------------------------------------------------------------------------------------------------------

INSERT INTO main.field_name (value) VALUES ('APARTMENT');
INSERT INTO main.field_name (value) VALUES ('HOUSE');
INSERT INTO main.field_name (value) VALUES ('VILLA');
INSERT INTO main.field_name (value) VALUES ('LAND');
INSERT INTO main.field_name (value) VALUES ('BUSINESS');
INSERT INTO main.field_name (value) VALUES ('RENT');
INSERT INTO main.field_name (value) VALUES ('username.invalid.alreadyExist');
INSERT INTO main.field_name (value) VALUES ('infoMessage.login.activationCode');
INSERT INTO main.field_name (value) VALUES ('email.activationCode.body');
INSERT INTO main.field_name (value) VALUES ('email.activationCode.title');
INSERT INTO main.field_name (value) VALUES ('infoMessage.activateCode.success');
INSERT INTO main.field_name (value) VALUES ('infoMessage.activateCode.fail');
INSERT INTO main.field_name (value) VALUES ('email.invalid.alreadyExist');
INSERT INTO main.field_name (value) VALUES ('email.restorePasswordCode.title');
INSERT INTO main.field_name (value) VALUES ('email.restorePasswordCode.body');
INSERT INTO main.field_name (value) VALUES ('infoMessage.restorePasswordCode.success');
INSERT INTO main.field_name (value) VALUES ('infoMessage.restorePasswordCode.fail');
INSERT INTO main.field_name (value) VALUES ('infoMessage.changePassword.success');
INSERT INTO main.field_name (value) VALUES ('infoMessage.changePassword.fail');
INSERT INTO main.field_name (value) VALUES ('companyName.invalid.alreadyExist');
INSERT INTO main.field_name (value) VALUES ('MODERATED');
INSERT INTO main.field_name (value) VALUES ('REJECTED');
INSERT INTO main.field_name (value) VALUES ('ACTIVE');
INSERT INTO main.field_name (value) VALUES ('DISABLED');
INSERT INTO main.field_name (value) VALUES ('SOLD_OUT');
INSERT INTO main.field_name (value) VALUES ('infoMessage.changeUserInfo.success');
INSERT INTO main.field_name (value) VALUES ('email.changeActivationCode.title');
INSERT INTO main.field_name (value) VALUES ('email.changeActivationCode.body');
INSERT INTO main.field_name (value) VALUES ('infoMessage.changeUserEmail');


-- alias ---------------------------------------------------------------------------------------------------------------

INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Apartment', 1, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('House', 2, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Villa', 3, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Land', 4, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Business', 5, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Rent', 6, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Квартиры', 1, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Дома', 2, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Виллы', 3, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Земля', 4, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Бизнес', 5, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Аренда', 6, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Departamento', 1, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('casa', 2, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Villa', 3, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Tierra', 4, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Negocio', 5, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Alquiler', 6, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('This username already exists', 7, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Такое имя пользователя уже существует', 7, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Este nombre de usuario ya existe', 7, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('%s, an email with an activation key has been sent to your e-mail %s! ', 8, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('%s, Вам на почту %s было отправлено письмо с ключём активации!', 8, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('¡%s, se ha enviado un correo electrónico con una clave de activación a su correo electrónico %s! ', 8, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>
Hey %s!
Welcome to %s!
Please go to <a href="https://%s/registration/activate/%s">link</a> to activate your account.
</body>
</html>', 9, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="ru">
<head>
<meta charset="UTF-8">
</head>
<body>
Привет, %s!
Добро пожаловать в %s!
Пожалуйста, для активации аккаунта, перейдите по <a href="https://%s/registration/activate/%s">ссылке</a>.
</body>
</html>', 9, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="es">
<head>
<meta charset="UTF-8">
</head>
<body>
¡Oye, %s!
¡Bienvenido a %s!
Siga el <a href="https://%s/registration/activate/%s">enlace</a> para activar su cuenta.
</body>
</html>', 9, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Activation code', 10, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Код активации', 10, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Código de activación', 10, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Activation completed successfully!', 11, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Активация успешно пройдена!', 11, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('¡Activación completada con éxito!', 11, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('The activation code is not valid!', 12, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Код активации не действителен!', 12, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('¡El código de activación no es válido!', 12, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('This email is already linked', 13, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Такая почта уже привязана', 13, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Este correo electrónico ya está vinculado', 13, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Password recovery', 14, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Восстановление пароля', 14, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Recuperación de contraseña', 14, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>
Hey %s!
Please follow the <a href="https://%s/restore/password/change?code=%s">link</a> to restore access to your account.
</body>
</html>', 15, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="ru">
<head>
<meta charset="UTF-8">
</head>
<body>
Привет, %s!
Пожалуйста, перейдите по <a href="https://%s/restore/password/change?code=%s">ссылке</a>, чтобы восстановить доступ к аккаунту.
</body>
</html>', 15, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="es">
<head>
<meta charset="UTF-8">
</head>
<body>
¡Oye, %s!
Siga el <a href="https://%s/restore/password/change?code=%s">enlace</a> para restaurar el acceso a su cuenta.
</body>
</html>', 15, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('An email has been sent to %s with a link to reset your password!', 16, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Вам на почту %s было отправлено письмо с ссылкой для восстановления пароля!', 16, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Se ha enviado un correo electrónico a %s con un enlace para restablecer su contraseña.', 16, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('There are no accounts linked to email', 17, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('К электронной почте нет привязанных аккаунтов', 17, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('No hay cuentas vinculadas al correo electrónico', 17, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Password changed successfully!', 18, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Пароль успешно изменен!', 18, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('¡Contraseña cambiada con éxito!', 18, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Failed to change password', 19, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Не удалось изменить пароль', 19, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('No se pudo cambiar la contraseña', 19, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('This company already exists', 20, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Такая компания уже существует', 20, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Esta empresa ya existe', 20, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Moderated', 21, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Declined', 22, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Active', 23, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Disabled', 24, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Sold out', 25, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Модерируется', 21, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Отклонено', 22, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Активный', 23, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Отключено', 24, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Продано', 25, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Moderado', 21, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Rechazado', 22, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Activo', 23, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Inhabilitado', 24, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Agotado', 25, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Information successfully updated', 26, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Информация успешно обновлена', 26, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Información actualizada con éxito', 26, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Activation code', 27, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Код активации', 27, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Código de activación', 27, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>
Hey %s!
Please go to <a href="https://%s/users/email/activate/%s">link</a> to activate your email.
</body>
</html>', 28, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="ru">
<head>
<meta charset="UTF-8">
</head>
<body>
Привет, %s!
Пожалуйста, для активации нового почтового адреса, перейдите по <a href="https://%s/users/email/activate/%s">ссылке</a>.
</body>
</html>', 28, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('<html lang="es">
<head>
<meta charset="UTF-8">
</head>
<body>
¡Oye, %s!
¡Bienvenido a %s!
Vaya al <a href="https://%s/users/email/activate/%s">enlace</a> para activar su correo electrónico.
</body>
</html>', 28, 3);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Para confirmar su cambio de correo electrónico, siga el enlace enviado a su nuevo correo electrónico', 29, 1);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('Для подтверждения смены электронной почты перейдите по ссылке, отправленной Вам на новую электронную почту', 29, 2);
INSERT INTO main.alias (value, field_name_id, locale_code_id) VALUES ('To confirm your email change, follow the link sent to your new email', 29, 3);

-- city ----------------------------------------------------------------------------------------------------------------

INSERT INTO main.city (value) VALUES ('Punta Cana');
INSERT INTO main.city (value) VALUES ('Lagunas de Nisibón');
INSERT INTO main.city (value) VALUES ('Cap Cana');
INSERT INTO main.city (value) VALUES ('Azua de Compostela');
INSERT INTO main.city (value) VALUES ('Bajos de Haina');
INSERT INTO main.city (value) VALUES ('Baní');
INSERT INTO main.city (value) VALUES ('Boca Chica');
INSERT INTO main.city (value) VALUES ('Bonao');
INSERT INTO main.city (value) VALUES ('Concepción de la Vega');
INSERT INTO main.city (value) VALUES ('Constanza');
INSERT INTO main.city (value) VALUES ('Consuelo');
INSERT INTO main.city (value) VALUES ('Cotuí');
INSERT INTO main.city (value) VALUES ('Esperanza');
INSERT INTO main.city (value) VALUES ('Hato Mayor del Rey');
INSERT INTO main.city (value) VALUES ('Jarabacoa');
INSERT INTO main.city (value) VALUES ('La Romana');
INSERT INTO main.city (value) VALUES ('Las Matas de Farfán');
INSERT INTO main.city (value) VALUES ('Los Alcarrizos (D.M.)');
INSERT INTO main.city (value) VALUES ('Mao');
INSERT INTO main.city (value) VALUES ('Moca');
INSERT INTO main.city (value) VALUES ('Nagua');
INSERT INTO main.city (value) VALUES ('Pedro Brand (D.M.)');
INSERT INTO main.city (value) VALUES ('Salvaleón de Higüey');
INSERT INTO main.city (value) VALUES ('San Cristóbal');
INSERT INTO main.city (value) VALUES ('San Felipe de Puerto Plata');
INSERT INTO main.city (value) VALUES ('San Francisco de Macoris');
INSERT INTO main.city (value) VALUES ('San José de Ocoa');
INSERT INTO main.city (value) VALUES ('San Juan de la Maguana');
INSERT INTO main.city (value) VALUES ('San Pedro de Macorís');
INSERT INTO main.city (value) VALUES ('Santa Cruz de Barahona');
INSERT INTO main.city (value) VALUES ('Santa Cruz del Seibo');
INSERT INTO main.city (value) VALUES ('Santiago de los Caballeros');
INSERT INTO main.city (value) VALUES ('Santo Domingo de Guzmán');
INSERT INTO main.city (value) VALUES ('Santo Domingo Este');
INSERT INTO main.city (value) VALUES ('Santo Domingo Norte');
INSERT INTO main.city (value) VALUES ('Santo Domingo Oeste');
INSERT INTO main.city (value) VALUES ('Tamboril');
INSERT INTO main.city (value) VALUES ('Villa Altagracia');
INSERT INTO main.city (value) VALUES ('Villa Bisonó');
INSERT INTO main.city (value) VALUES ('Las Terrenas');

-- posts ---------------------------------------------------------------------------------------------------------------

INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (27.4, 0, 2, 800, 3, 1, 1, 1, 1, 18.731349, 1, -68.480693, '/img/1.1.jpg', '/vid/1.mp4', 1, 'Cana Pearl', 1, 'ACTIVE', false, 157000, '2022-01-01', 'APARTMENT', 1, 0, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (184, 1, 2, 10, 2, 0, 1, 0, 1, 18.858772, 1, -68.63141, '/img/2.1.jpg', '/vid/2.mp4', 0, 'Coconut villages Dominicana', 2, 'ACTIVE', true, 500000, '2022-01-05', 'VILLA', 1, 0, 1, 1, 2);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (63.39, 0, 2, 350, 2, 1, 0, 1, 1, 18.683839, 1, -68.417952, '/img/3.1.jpg', '/vid/3.mp4', 1, 'Coral Village ll', 1, 'ACTIVE', false, 123000, '2022-01-05', 'APARTMENT', 2, 1, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (135, 0, 3, 500, 3, 0, 1, 0, 1, 18.625894, 1, -68.411858, '/img/4.1.jpg', null, 1, 'Drake village', 2, 'ACTIVE', false, 150000, '2022-01-08', 'VILLA', 1, 0, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (2687, 0, 0, 500, 0, 0, 0, 0, 0, 18.685664, 0, -68.421204, '/img/5.1.jpg', null, 0, ' ', 0, 'ACTIVE', false, 250, '2022-01-08', 'LAND', 0, 0, 0, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (69, 0, 1, 300, 1, 1, 0, 0, 1, 18.683792, 1, -68.419501, '/img/7.1.jpg', '/vid/7.mp4', 1, 'Oceana', 1, 'ACTIVE', false, 194000, '2022-01-13', 'APARTMENT', 1, 0, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (65.58, 0, 3, 600, 3, 0, 0, 1, 1, 18.671804, 1, -68.406046, '/img/6.1.jpg', '/vid/6.mp4', 1, 'Paseo playa coral', 1, 'ACTIVE', false, 194000, '2022-01-11', 'APARTMENT', 1, 0, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (34, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, '/img/4107b42e-f6d9-45f1-a44c-e23f18db7f1b.jpg', null, 0, 'Caribbean Magic Village ', 1, 'ACTIVE', true, 37300, '2022-01-27', 'VILLA', 0, 0, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (55, 1, 2, 0, 2, 0, 0, 0, 1, 0, 1, 0, '/img/43cbc29f-0ef1-4fd7-843f-fb87339bdc59.jpg', null, 0, 'Caribbean Magic Village', 1, 'ACTIVE', true, 50700, '2022-01-27', 'VILLA', 0, 0, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (125.44, 0, 3, 0, 3, 3, 1, 1, 1, 18.505622, 1, -68.383227, '/img/b4e1b53f-3b97-4bf9-a41e-2748fdc18dc2.jpg', null, 1, 'Harbor Bay', 0, 'ACTIVE', false, 369999, '2022-02-01', 'APARTMENT', 1, 0, 1, 1, 3);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (167.9, 1, 3, 1, 3, 0, 0, 1, 1, 19.309526, 1, -69.57166, '/img/9f216a90-f9ee-45d1-84dc-0da1ff0b2c73.jpg', '/vid/11.mp4', 2, 'The Reef', 1, 'ACTIVE', false, 249999, '2022-02-01', 'APARTMENT', 1, 1, 1, 1, 40);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (103.64, 1, 3, 1, 3, 0, 0, 1, 0, 18.502233, 0, -68.383083, '/img/7794de0d-75ef-4f19-9174-5c9e9f06e19e.jpg', '/vid/12.mp4', 2, 'Atlantida', 1, 'ACTIVE', false, 129999, '2022-02-02', 'APARTMENT', 1, 1, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (180, 1, 3, 0, 3, 0, 1, 0, 1, 0, 1, 0, '/img/9021e9ba-ee77-4de5-ad96-21ea8ed8ed41.png', '/vid/13.mp4', 0, 'Bella Residences', 1, 'ACTIVE', true, 180000, '2022-02-05', 'VILLA', 1, 0, 2, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (163, 1, 2, 1, 2, 0, 1, 0, 1, 0, 1, 0, '/img/df1daac9-8a32-4bbb-a6f4-0cac9ce8b6e6.jpg', null, 0, 'Presidential Suites', 0, 'REJECTED', false, 435000, '2022-02-13', 'APARTMENT', 0, 0, 0, 2, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (163, 1, 2, 1, 2, 0, 0, 0, 1, 0, 1, 0, '/img/dc8d0602-ce66-4554-959b-f8930c1a26c7.jpg', null, 0, 'Presidential Suites', 1, 'ACTIVE', false, 390000, '2022-02-15', 'APARTMENT', 0, 0, 1, 2, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null, null, 0, '2022-02-15', 0, 'DISABLED', false, 0, '2022-02-15', 'APARTMENT', 0, 0, 0, 2, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (125, 1, 2, 0, 2, 0, 0, 1, 2, 18.691406, 2, -68.424129, '/img/f816e285-ae90-43c7-a4cf-d8f969871e10.jpg', null, 0, 'Maples Beach', 1, 'ACTIVE', false, 160000, '2022-02-16', 'APARTMENT', 1, 0, 0, 2, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (155, 0, 1, 100, 3, 1, 0, 1, 1, 0, 1, 0, '/img/cca7eddf-47db-43ab-bbce-b9f1c829b913.jpg', null, 1, 'Marina Garden', 1, 'ACTIVE', false, 355000, '2022-02-19', 'APARTMENT', 1, 0, 1, 2, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (190, 1, 1, 0, 3, 0, 0, 1, 0, 0, 0, 0, '/img/56139794-f302-4635-9b35-58e76e7e5bd9.jpg', null, 0, 'Gardenia', 1, 'ACTIVE', false, 250000, '2022-02-22', 'APARTMENT', 1, 0, 1, 1, 1);
INSERT INTO main.post (area, barbecue_area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, kitchen, latitude, living_room, longitude, main_image, main_video, mall, name, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, city_id) VALUES (115.22, 0, 1, 0, 3, 1, 0, 0, 1, 0, 1, 0, '/img/5c9d86bd-c732-44bf-817f-d365ced51073.jpg', null, 0, 'The Golf Garden 2', 2, 'ACTIVE', false, 195000, '2022-02-22', 'APARTMENT', 1, 0, 1, 1, 1);

-- localized body ------------------------------------------------------------------------------------------------------

INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('54 flats with access to swimming pools, plaza and nearby shops including supermarkets, restaurants and bars, access to our beach club.', '- Playa coral beach club (350 meters).', 1, 3);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('54 апартаментов с доступом к бассейнам, площади и близлежащим магазинам, включая супермаркеты, рестораны и бары, доступ к нашему пляжному клубу.
', '- Пляжный клуб Playa Coral (350 метров).', 2, 3);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('54 viviendas con acceso a piscinas, plaza y comercios cercanos incluyendo supermercados, restaurantes y bares, acceso a nuestro club de playa.', '- Club de playa playa coral (350 metros).', 3, 3);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>DRAKE VILLAGE in Punta Cana is an Exclusive project developed in the exclusive area of Bavaro Punta Cana.</p>
<p>DRAKE VILLAGE PUNTA CANA: it’s about 500 meters from the DOWNTOWN of Punta Cana, shopping and financial centers strategically close, as well as restaurants, bars and the spectacular white sand beaches recognized worldwide, which makes it an ideal place to invest and live!</p>
<p>The privileged environment and excellent location of this project guarantees you a high ROI and capital gains in the market, classifying it as a luxury project while prices are still affordable for investment.</p>', 'We have 15 spectacular individual duplex villas of 2 and 3 bedrooms from 135 to 165 Squares meters, each one with SWIMMING POOLS Included!!', 1, 4);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Apresúrese a invertir en "Coconut aldeas Dominicana" en el lanzamiento, área de terreno de 6,000 m2, 12 villas premium frente al mar en la República Dominicana.</p>
<p>Rentabilidad desde el 40%. El proyecto está completamente desarrollado y listo para su implementación.</p>
<p>La construcción tomará de 9 meses a 1 año.</p>
<p>La tierra y los inmuebles están registrados a nombre del inversor.</p>', '- 10 metros de la playa', 3, 2);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>194 magníficos apartamentos en el campo de golf Cana Bay, con impresionantes vistas al lago y a la playa. Su diseño excepcional es el lugar perfecto en el Caribe.</p>
<p>Hospédese en uno de los apartamentos de 1, 2 y 3 habitaciones y comience su día con la práctica completa en la piscina infinita o camine 5 minutos hasta la increíble playa para disfrutar del club de playa privado de Cana Bay. A tan solo un minuto, también en el Hard Rock Hotel donde podrás disfrutar de más comodidades para una estancia perfecta: una cena en uno de los restaurantes a la carta, un paseo por las tiendas, una noche de diversión en el Casino o la discoteca .. Cana Pearl es el lugar para estar.</p>', '- 20 min Aeropuerto de Punta Cana <br>
- 15 min Centro de Punta Cana <br>
- Centro comercial de Palma a 10 min', 3, 1);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>194 великолепных апартаментов на поле для гольфа Cana Bay, с прекрасным видом на озеро и пляж. Его исключительный дизайн - идеальное место на Карибах.</p>
<p>Остановитесь в одной из апартаментов с 1, 2 или 3 спальнями и начните свой день с полной практики в пейзажном бассейне или совершите 5-минутную прогулку до прекрасного пляжа, чтобы насладиться частным пляжным клубом Cana Bay. Всего в одной минуте от отеля Hard Rock Hotel, где вы сможете насладиться дополнительными удобствами для идеального отдыха: ужин в одном из ресторанов с обслуживанием по меню, прогулка по магазинам, вечер веселья в казино или дискотека .. Жемчужина Кана - это то место, где можно побывать.</p>', '- 20 минут до аэропорта Пунта-Кана <br>
- 15 минут до центра Пунта-Кана, <br>
- 10 минут до торгового центра Palma', 2, 1);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('-', '-', 1, 5);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Oceana opens the doors to the sublime and elevated: One of the largest zero-entry lagoon-style pools in the Caribbean, with 9,600 square meters of infinite serenity that borders the residences. Business center and coworking space designed for perfect workdays. A gastro-nomic market of culinary excellence. Indulgent spa treatments and innovative gym facilities bring you to a single dream location and endless shopping trip. Entertainment, the best club-house, billiards tables, kids'' club, and a theater that reconnect with the cultural life.</p>
<p>Oceana is also ideal for swimming, kayaking, or simply sunbathing on the nearby "Los Corales" beach with its calm deep blue waters, palm trees that dance in the breeze, and pristine white sands.</p>', '-', 1, 6);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>DRAKE VILLAGE en Punta Cana es un proyecto Exclusivo desarrollado en la exclusiva zona de Bávaro Punta Cana.</p>
<p>DRAKE VILLAGE PUNTA CANA: se encuentra a unos 500 metros del DOWNTOWN de Punta Cana, estratégicamente cerca de centros comerciales y financieros, así como de restaurantes, bares y las espectaculares playas de arena blanca reconocidas a nivel mundial, lo que lo convierte en un lugar ideal para invertir y vivir!</p>
<p>El entorno privilegiado y la excelente ubicación de este proyecto le garantiza un alto ROI y plusvalías en el mercado, clasificándolo como un proyecto de lujo mientras los precios siguen siendo asequibles para la inversión.</p>', 'Disponemos de 15 espectaculares villas dúplex individuales de 2 y 3 dormitorios desde 135 hasta 165 metros cuadrados, cada una con PISCINAS Incluidas!!', 3, 4);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>DRAKE VILLAGE в Пунта-Кане — это эксклюзивный проект, разработанный в эксклюзивном районе Баваро Пунта-Кана.</p>
<p>DRAKE VILLAGE PUNTA CANA: это примерно в 500 метрах от ЦЕНТРА ГОРОДА Пунта-Каны, торговых и финансовых центров в стратегической близости, а также ресторанов, баров и впечатляющих пляжей с белым песком, признанных во всем мире, что делает его идеальным местом для инвестиций и жизни!</p>
<p>Привилегированная среда и отличное расположение этого проекта гарантируют вам высокую рентабельность инвестиций и прирост капитала на рынке, классифицируя его как проект класса люкс, в то время как цены по-прежнему доступны для инвестиций.</p>', 'У нас есть 15 великолепных индивидуальных вилл-дуплексов с 2 и 3 спальнями площадью от 135 до 165 квадратных метров, каждая с БАССЕЙНОМ!!', 2, 4);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>194 magnificent apartments on Cana Bay Golf Course, with stunning views of the lake and the beach. Its exceptional design is the perfect place in the Caribbean.</p>
<p>Stay in one of the 1, 2 and 3 bedroom apartments and start your day in full practice in the infinity pool or take a 5 minute walk to the amazing beach to enjoy the private beach club of Cana Bay. Just one minute, also at the Hard Rock Hotel where you can enjoy more amenities for a perfect stay: a dinner at one of the a la carte restaurants, a walk through the shops, a night of fun at the Casino or the disco... Cana Pearl is the place to be.</p>
', '- 20 min Punta Cana Airport <br>
- 15 min Downtown Punta Cana <br>
- 10 min Palma shopping mall', 1, 1);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Спешите инвестировать в "Coconut villages Dominicana" на старте продаж, площадь участка 6000 м2, 12 вилл премиум-класса на берегу океана в Доминиканской республике.</p>
<p>Рентабельность от 40%. Проект полностью разработан и готов к реализации.</p>
<p>Строительство под ключ за 1 год.</p>
<p>Земля и недвижимость регистрируются на инвестора.</p>', '- 10 метров до пляжжа', 2, 2);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Hurry to invest in "Coconut villages Dominicana" at launch, land area 6,000 m2, 12 premium oceanfront villas in the Dominican Republic.</p>
<p>Profitability from 40%. The project is fully developed and ready for implementation.</p>
<p>Construction will take from 9 months to 1 year.</p>
<p>The land and real estate are registered to the investor.</p>', '- 10 meters to the beach', 1, 2);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Oceana открывает двери в возвышенное и возвышенное: один из самых больших бассейнов в стиле лагуны с нулевым входом в Карибском бассейне площадью 9 600 квадратных метров бесконечного спокойствия, граничащий с жилыми домами. Бизнес-центр и коворкинг созданы для идеальных рабочих будней. Гастрономический рынок кулинарного мастерства. Роскошные спа-процедуры и инновационные тренажерные залы доставят вас в место мечты и бесконечный поход по магазинам. Развлечения, лучший клубный дом, бильярд, детский клуб и театр, которые воссоединяют с культурной жизнью.</p>
<p>Oceana также идеально подходит для купания, катания на каяках или просто принятия солнечных ванн на близлежащем пляже "Лос-Коралес" с его спокойными темно-синими водами, пальмами, танцующими на ветру, и нетронутым белым песком.</p>', '-', 2, 6);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Oceana abre las puertas a lo sublime y elevado: Una de las piscinas estilo laguna de entrada cero más grandes del Caribe, con 9.600 metros cuadrados de infinita serenidad que bordean las residencias. Centro de negocios y espacio de coworking diseñado para días de trabajo perfectos. Un mercado gastronómico de excelencia culinaria. Los tratamientos de spa indulgentes y las innovadoras instalaciones del gimnasio lo llevan a un lugar de ensueño y un viaje de compras sin fin. Entretenimiento, la mejor casa club, mesas de billar, club infantil y un teatro que reconecta con la vida cultural.</p>
<p>Oceana también es ideal para nadar, andar en kayak o simplemente tomar el sol en la cercana playa "Los Corales", con sus aguas tranquilas de un azul profundo, palmeras que bailan con la brisa y arenas blancas vírgenes.</p>', '-', 3, 6);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Situated in the exclusive Playa Coral area between the Barceló and Melia Hotels, these 76 spacious and elegant 1-bedroom master suites are designed to engage all the senses. Sophisticated style and luxurious finishes create an atmosphere of exclusivity and intimacy.</p>
<p>Make each moment unique, and every day a celebration of the best that life has to offer</p>', '-', 1, 7);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Эти 76 просторных и элегантных главных люксов с 1 спальней расположены в эксклюзивном районе Playa Coral между отелями Barceló и Melia. Утонченный стиль и роскошная отделка создают атмосферу эксклюзивности и интимности.</p>
<p>Сделайте каждый момент уникальным, а каждый день празднуйте лучшее, что может предложить жизнь</p>', '-', 2, 7);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Ubicadas en la exclusiva zona de Playa Coral entre los hoteles Barceló y Meliá, estas 76 amplias y elegantes master suites de 1 dormitorio están diseñadas para cautivar todos los sentidos. Estilo sofisticado y lujosos acabados crean un ambiente de exclusividad e intimidad.</p>
<p>Haz que cada momento sea único y que cada día sea una celebración de lo mejor que la vida tiene para ofrecer</p>', '-', 3, 7);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Form of Payment&nbsp; </p><ul><li>Reservation with&nbsp; 3000 US$ </li><li>50% Contract signature </li><li>30% During construction&nbsp; </li><li>20% Upon delivery </li></ul>', 'Best Investment Project 2022!', 1, 8);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Форма оплаты</p><ul><li>Бронирование от 3000 долларов США</li><li>50% Подписание контракта</li><li>30% Во время строительства</li><li>20% при доставке</li></ul>', 'Лучший инвестиционный проект 2022 года!', 2, 8);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Forma de pago</p><ul><li>Reserva con 3000 US$</li><li>50% Firma de contrato</li><li>30% Durante la construcción</li><li>20% A la entrega</li></ul>', '¡Mejor Proyecto de Inversión 2022!', 3, 8);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Form of Payment&nbsp; </p><ul><li>Reservation with&nbsp; 3000 US$ </li><li>50% Contract signature </li><li>30% During construction&nbsp; </li><li>20% Upon delivery </li></ul>', 'Best Investment Project 2022!', 1, 9);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('Форма оплаты<ul><li>Бронирование от 3000 долларов США</li><li>50% Подписание контракта</li><li>30% Во время строительства</li><li>20% при доставке</li></ul>', 'Лучший инвестиционный проект 2022 года!', 2, 9);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('Forma de pago<ul><li>Reserva con 3000 US$</li><li>50% Firma de contrato</li><li>30% Durante la construcción</li><li>20% A la entrega</li></ul>', '¡Mejor Proyecto de Inversión 2022!', 3, 9);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>186 flats with views of the beach.</p><p>Reservation with 1000 $</p><p></p><ul><li>20% Contract signature</li><li>60% During construction</li><li>20% Upon delivery</li></ul>', '<ul><li>Access to three golf clubs</li><li>Roof with panoramic view</li></ul>', 1, 10);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>186 апартаментов с видом на пляж.</p><p>Бронирование с 1000 $</p><ul><li>20% Подписание контракта</li><li>60% Во время строительства</li><li>20% при доставке</li></ul>', '<ul><li>Доступ к трем гольф-клубам</li><li>Крыша с панорамным видом</li></ul>', 2, 10);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('186 viviendas con vistas a la playa.<p>Reserva con 1000 $</p><ul><li>20% Firma de contrato</li><li>60% Durante la construcción</li><li>20% A la entrega</li></ul>', '<ul><li>Acceso a tres clubes de golf</li><li>Azotea con vista panorámica</li></ul>', 3, 10);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('-', '<ul><li> Natural pool</li><li>Ecological garden</li></ul>', 1, 11);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('', '<ul><li>Природный бассейн</li><li>Экологический сад </li></ul>', 2, 11);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('', '<ul><li>piscina natural</li><li>Jardín ecológico</li></ul>', 3, 11);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>A lost city rising from the depths has been discovered in the city of Bavaro, Punta Cana.</p><p>With an iconic Atlantida building, it offers 18,000 meters of swimming pools, spectacular terraces, where you can feel like you are in a boutique hotel, in the privacy of an exclusive residence.
 </p>', '<ul><li>Bavaro beaches within walking distance.</li><li>Ecological garden.</li></ul>', 1, 12);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>В городе Баваро, Пунта-Кана, обнаружен затерянный город, поднимающийся из глубин.</p><p>Культовое здание Atlantida предлагает 18 000 метров плавательных бассейнов, впечатляющие террасы, где вы можете посетить бутик-отеле и уединится эксклюзивной резиденции.
 </p>', '<ul><li>
 Пляжи Баваро в шаговой доступности.</li><li>Зеленая зона.</li></ul>', 2, 12);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Una ciudad perdida que surge de las profundidades ha sido descubierta en la ciudad de Bávaro, Punta Cana.</p><p>Con un icónico edificio Atlántida, ofrece 18,000 metros de piscinas, espectaculares terrazas, donde puedes sentirte como en un hotel boutique, en la privacidad de una residencia exclusiva.
 </p>', '<ul><li>Playas de Bávaro a poca distancia.</li><li>Jardín ecológico.</li></ul>', 3, 12);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('', '', 1, 13);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('', '', 2, 13);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('', '', 3, 13);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('', '', 1, 14);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Продаётся шикарная квартира на первой линии с видом на океан в Баваро, Пунта Кана.</p><p>Расположена на территории отельного комплекса Presidential Suits. В пешей доступности рестораны, магазины, бары&nbsp;</p><p>Общая площадь 163 м2</p><p>2 спальни&nbsp;</p><p>2 санузла&nbsp;</p><p>Огромная терраса с барбекью</p><p>Охрана 24/7</p><p>Полностью закрытая территория&nbsp;</p><p>Пляжный клуб с баром и рестораном&nbsp;</p><p>Комфортабельные лежаки&nbsp;</p><p>Стоимость 435 000 USD.</p>', '', 2, 14);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('', '', 3, 14);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Luxury apartment for sale on the first line with ocean views in Bavaro, Punta Cana.</p><p>Located on the territory of the Presidential Suits hotel complex. Restaurants, shops, bars within walking distance</p><p>Total area 163 m2</p><p>2 bedrooms</p><p>2 bathrooms</p><p>Huge terrace with barbecue</p><p>Security 24/7</p><p>Completely enclosed area</p><p>Beach club with bar and restaurant</p><p>Comfortable sunbeds</p><p>The cost is 435,000 USD.</p>', '', 1, 15);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Продаётся шикарная квартира на первой линии с видом на океан в Баваро, Пунта Кана.</p><p>Расположена на территории отельного комплекса Presidential Suits. В пешей доступности рестораны, магазины, бары&nbsp;</p><p>Общая площадь 163 м2</p><p>2 спальни&nbsp;</p><p>2 санузла&nbsp;</p><p>Огромная терраса с барбекью</p><p>Охрана 24/7</p><p>Полностью закрытая территория&nbsp;</p><p>Пляжный клуб с баром и рестораном&nbsp;</p><p>Комфортабельные лежаки&nbsp;</p><p>Стоимость 435 000 USD.</p>', '', 2, 15);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Apartamento de lujo en venta en primera línea con vista al mar en Bávaro, Punta Cana.</p><p>Ubicado en el territorio del complejo hotelero Presidential Suits. Restaurantes, tiendas, bares a poca distancia</p><p>Superficie total 163 m2</p><p>2 dormitorios</p><p>2 baños</p><p>Enorme terraza con barbacoa</p><p>Seguridad 24/7</p><p>Zona completamente cerrada</p><p>Club de playa con bar y restaurante</p><p>Tumbonas cómodas</p><p>El costo es de 435,000 USD.</p>', '', 3, 15);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES (null, null, 1, 16);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES (null, null, 2, 16);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES (null, null, 3, 16);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MAPLES BEACH</p><p></p><p></p><p></p><p>Area Cortecito</p><p></p><p>Punta el Cortecito</p><p></p><p>150 meters to the beach.</p><p></p><p>&nbsp; 2-room apartments in which there are two full-fledged 1-room apartments with a separate entrance to each.</p><p></p><p>&nbsp; 2 in 1</p><p></p><p>Location close to shops and restaurants</p>', '', 1, 17);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MAPLES BEACH</p><p></p><p>Район Cortecito</p><p>Punta el Cortecito</p><p>Сдача первая очередь - сентябрь 2022/ вторая очередь начало 2023&nbsp;</p><p>150 метров до пляжа.&nbsp;</p><p></p><p></p><p>&nbsp;2-х комнатные апартаменты в которых полноценные две &nbsp;1 комнатные квартиры с отдельным входом в каждую.</p><p>&nbsp;2 в 1 &nbsp;&nbsp;</p><p>Расположение рядом с магазинами и ресторанами</p><p></p><p></p><p></p>', '', 2, 17);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MAPLES BEACH</p><p></p><p></p><p></p><p>Zona Cortecito</p><p></p><p>punta el cortecito</p><p></p><p>150 metros de la playa.</p><p></p><p>&nbsp; Apartamentos de 2 habitaciones en los que hay dos apartamentos completos de 1 habitación con entrada independiente para cada uno.</p><p></p><p>&nbsp; 2 en 1</p><p></p><p>Ubicación cerca de tiendas y restaurantes.</p>', '', 3, 17);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Marina Garden comes with an innovative concept for</p><p>those who seek tranquility and rest in rhythm</p><p>waves. It has 40 apartments and 15 penthouses. Located</p><p>in the luxurious area of ​​Cap Cana Marina, Dominican Republic</p><p>Republic, the best place to enjoy incredible beaches</p><p>crystal clear waters and white sands of the Caribbean. The</p><p>The world class golf center has two golf courses. Punta</p><p>Espada golf course with impressive holes along</p><p>coastline and turquoise lakes.</p><p></p><p>Marina Garden in Cap Can</p><p>From 335 000 $</p><p>Booking for $1000</p><p>20% Signing a contract</p><p>60% during construction</p><p>20% on delivery</p>', '', 1, 18);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('Marina Garden поставляется с инновационной концепцией дляте, кто ищет спокойствия и отдыхает в ритмеволны. В нем 40 квартир и 15 пентхаусов. Расположенныйв роскошном районе Кап-Кана Марина, Доминиканская РеспубликаРеспублика, лучшее место, чтобы насладиться невероятными пляжамикристально чистые воды и белый песок Карибского бассейна. TheВ гольф-центре мирового класса есть два поля для гольфа. ПунтаПоле для гольфа Espada с впечатляющими лунками вдольпобережье и бирюзовые озера.Марина Гарден в Кап-КанеОт 335 000 $Бронирование за 1000 $20% Подписание контракта60% во время строительства20% при доставке', '', 2, 18);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('<p>Marina Garden llega con un concepto innovador para</p><p>los que buscan tranquilidad y descanso en ritmo</p><p>ondas. Tiene 40 apartamentos y 15 áticos. Situado</p><p>en la lujosa zona de Cap Cana Marina, República Dominicana</p><p>República, el mejor lugar para disfrutar de increíbles playas</p><p>aguas cristalinas y arenas blancas del Caribe. los</p><p>El centro de golf de clase mundial tiene dos campos de golf. Punta</p><p>Campo de golf Espada con impresionantes hoyos a lo largo</p><p>costa y lagos turquesas.</p><p></p><p>Marina Garden en Cap Can</p><p>Desde 335 000 $</p><p>Reserva por $1000</p><p>20% Firma de un contrato</p><p>60% durante la construcción</p><p>20% en la entrega</p>', '', 3, 18);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('The project consists of a Clubhouse, The Garden Club, which will have a double height infinity pool, lounge area, gym, spa and restaurant, which will offer all kinds of services.', '<ul><li>

                        Private pool</li><li>BBQ area</li></ul>', 1, 19);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('Проект состоит из Clubhouse, The Garden Club, в котором будет панорамный бассейн двойной высоты, зона отдыха, тренажерный зал, спа-салон и ресторан, который будет предлагать все виды услуг.', '<ul><li>Частный бассейн</li><li>Зона барбекю</li></ul>', 2, 19);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('El proyecto consta de una Casa Club, The Garden Club, que contará con una piscina infinita de doble altura, área lounge, gimnasio, spa y restaurante, que ofrecerá todo tipo de servicios.', '<ul><li>Piscina privada</li><li>zona de barbacoa</li></ul>', 3, 19);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('The
 Golf Garden 2 has 42 exclusive 2 and 3 bedroom apartments distributed
on three levels. Pool with more than 50 meters and large gardens.', '<ul><li>

                        View of the golf course</li><li>10 min Bavaro beach</li></ul>', 1, 20);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('В Golf Garden 2 есть 42 эксклюзивных апартамента с 2 и 3 спальнями, расположенных на трех уровнях. Бассейн более 50 метров и большие сады.', '<ul><li>Вид на поле для гольфа</li><li>10 мин до пляжа Баваро</li></ul>', 2, 20);
INSERT INTO main.localized_body (description, features, locale_code_id, post_id) VALUES ('The Golf Garden 2 cuenta con 42 exclusivos apartamentos de 2 y 3 dormitorios distribuidos en tres niveles. Piscina con más de 50 metros y amplios jardines.', '<ul><li>Vista del campo de golf</li><li>10 min playa Bávaro</li></ul>', 3, 20);

-- post image ----------------------------------------------------------------------------------------------------------
INSERT INTO main.post_image (image, post_id) VALUES ('/img/1.3.jpg', 1);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/1.4.jpg', 1);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/1.2.jpg', 1);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/1.1.jpg', 1);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/1.5.jpg', 1);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2.6.jpg', 2);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2.3.jpg', 2);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2.4.jpg', 2);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2.1.jpg', 2);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2.2.jpg', 2);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2.5.jpg', 2);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/3.3.jpg', 3);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/3.1.jpg', 3);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/3.4.jpg', 3);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/3.2.jpg', 3);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4.1.jpg', 4);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4.2.jpg', 4);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4.3.jpg', 4);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4.4.jpg', 4);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4.5.jpg', 4);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4.6.jpg', 4);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4.7.jpg', 4);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/5.1.jpg', 5);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/5.2.jpg', 5);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/5.3.jpg', 5);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.1.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.2.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.3.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.4.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.5.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.6.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.7.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.8.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.9.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.10.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6.11.jpg', 6);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/7.1.jpg', 7);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/7.2.jpg', 7);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/7.3.jpg', 7);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/7.4.jpg', 7);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4107b42e-f6d9-45f1-a44c-e23f18db7f1b.jpg', 8);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/344d8820-b452-4cfd-807f-909e8745d0c2.jpg', 8);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/43cbc29f-0ef1-4fd7-843f-fb87339bdc59.jpg', 9);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/9dfd23ca-f4de-4117-b680-838a100378f8.jpg', 9);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/b4e1b53f-3b97-4bf9-a41e-2748fdc18dc2.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/e98ea091-aaa1-4c83-abe8-6c1d8deb0cba.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/730c14f5-80b5-42a9-940c-8492257426f8.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2c05cff8-f04c-4264-ba5b-d369dfe2536c.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/cf736aa0-f0a2-475c-b1a8-4d97b37bcb69.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/841c378a-3a9c-4189-9795-5852e92c5bdd.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/98bc6a0a-a55a-4466-baf6-9afae4d73274.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/1f5c1b72-05dd-43a9-867b-801e85625853.jpg', 10);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/9f216a90-f9ee-45d1-84dc-0da1ff0b2c73.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/ec6f0ad6-6029-4547-bd5f-8e753bab1961.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/ddcea7b6-3639-4c06-9cc0-81b4c57a9608.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/693e5e5a-6636-41a8-96da-dd21668b0d4c.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/5bc52c53-aa9e-43ee-a8ff-65a11a67d33f.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/53b28ccc-d49c-4733-a099-c23540b72ee0.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/df3bb5fa-aa83-4a2b-a890-8738d0682550.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/d61e234a-99f2-439e-9e57-8a4e2b75fea5.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2003541f-e157-4512-b0b1-660cd40c3619.jpg', 11);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/7794de0d-75ef-4f19-9174-5c9e9f06e19e.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/a1483ce9-f801-4cf7-a914-40c16945f55c.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/60f32b73-2064-4067-9e90-a79e83729bef.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/c6117688-bca3-4689-92f7-03fe51ccb078.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6fe4cd12-fb2b-4d42-92fb-d55777cb3518.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/5f80aba7-b721-4dcb-9d0a-ac6af21805ca.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/3a059317-973f-44c2-9fb8-f4b0643fc3ab.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/1fe3a27d-8203-4ae1-a9cd-035e08d819b8.jpg', 12);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/9021e9ba-ee77-4de5-ad96-21ea8ed8ed41.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/beb7d99d-256f-46ef-b787-9de4ff3b1b9a.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/222b9dc1-1834-4f57-892b-fe3870bc7f6e.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/6131cab6-5c38-4cb4-9277-1566129ba667.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/566f07e1-a605-40bc-99eb-6df6ab19b8d1.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/e8ba2523-f8b9-4277-b18f-78aaa29d4807.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4ba4054b-18d4-487d-b370-fcce95bf6c6b.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/eecf239e-55c6-4e6d-9bbe-4b36105c8173.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/7adf97da-b4ab-4d75-b935-d94c24154d76.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/fdf2f7d5-0843-4e65-8b67-b5627a597826.png', 13);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/df1daac9-8a32-4bbb-a6f4-0cac9ce8b6e6.jpg', 14);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/dc8d0602-ce66-4554-959b-f8930c1a26c7.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/82b07090-7bd8-406c-8085-a7aa9a67df06.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/d8cb9c85-630f-4ff7-b543-560351bd1084.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/f1330ff8-387d-4221-92e8-4fddc2108fc0.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/c6c9ed10-805b-4d0f-ba72-ae47df4413e8.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/bed8866f-c83b-414d-84e8-a6712e4b8df2.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/564049ec-9b3e-42b9-9026-13aaaebf75fe.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/b9672ac2-f161-426c-8613-7ce1704d72d6.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/deb26105-ee94-468a-8467-1130941ca36f.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/51ae9a74-25d5-4b8f-af31-2ee0a8c5eaac.jpg', 15);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/f816e285-ae90-43c7-a4cf-d8f969871e10.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/8840644c-36f9-4e02-b4ba-1899cbee627f.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/9b71b450-dfef-4fc3-9424-39c1dd4a7014.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/e59ec382-03c7-4bd8-87b7-181c1abf256f.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/e5771a1a-4c82-4139-801f-1ef7559ba2eb.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/88926c28-8fa8-4be4-b1b2-473a10c3ce8b.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/b2db188b-c303-4e3b-9826-094dbec4880a.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/5a7561ad-95b3-4cb9-bcdc-1c78967fbb97.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/0f914559-6c17-4029-b1fc-0af5f2edd2a2.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/8d8c2ab9-c820-4768-ba67-02bad0995c98.jpg', 17);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/cca7eddf-47db-43ab-bbce-b9f1c829b913.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/73e10397-ed25-47cc-a146-5a8dfd4ec5ca.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/a002a705-3db9-4c95-a225-74989b721bfc.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/87add082-7ce5-45c1-9c3e-60602492f156.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/316ccacc-9421-4d7c-ae81-0c84dc925dfe.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/c5e59eba-fe00-48a4-8e75-a9de057c631f.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/2c265187-2f06-4b9e-9f98-92e5937c4a60.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/98f2b7a9-06ab-4a4b-93c6-91754a4fd0ce.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/853ba0f8-c5d0-4255-a96c-b8d49297878b.jpg', 18);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/56139794-f302-4635-9b35-58e76e7e5bd9.jpg', 19);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/a4196f02-3d99-44bc-a74e-0bb75c788349.jpg', 19);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/9b6c7048-a8f4-4d26-b252-991a8e87abb8.jpg', 19);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/ad97db5f-97ad-4a63-9d3a-ab77d18784d8.jpg', 19);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/4878ef35-4e6b-49d0-a33b-3cc5b0310e8c.jpg', 19);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/be0a7ed8-2313-43d1-995d-48f0cebe435d.jpg', 19);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/5c9d86bd-c732-44bf-817f-d365ced51073.jpg', 20);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/54bf741b-4085-4b40-83a7-e597e42f2f94.jpg', 20);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/b74cf190-886a-46e5-9428-0b5f7c90a26d.jpg', 20);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/dff070d0-e065-4607-8053-23b1c913567c.jpg', 20);
INSERT INTO main.post_image (image, post_id) VALUES ('/img/cd445888-0129-4cf2-8473-719fe03687fe.jpg', 20);

-- post registry -------------------------------------------------------------------------------------------------------

INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'REJECTED', 14);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'DISABLED', 15);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 15);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 15);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 10);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 15);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 15);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 15);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'DISABLED', 16);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 11);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-15', 'ACTIVE', 12);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-16', 'DISABLED', 17);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-16', 'ACTIVE', 17);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-16', 'ACTIVE', 17);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-16', 'ACTIVE', 17);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-16', 'ACTIVE', 17);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-19', 'DISABLED', 18);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-19', 'ACTIVE', 18);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-22', 'DISABLED', 19);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-22', 'ACTIVE', 19);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-22', 'ACTIVE', 19);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-22', 'DISABLED', 20);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-02-22', 'ACTIVE', 20);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-03-15', 'ACTIVE', 15);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-03-15', 'ACTIVE', 19);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-03-15', 'ACTIVE', 20);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-03-16', 'ACTIVE', 17);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-03-16', 'ACTIVE', 20);
INSERT INTO main.post_registry (change_date, change_post_status, post_id) VALUES ('2022-03-16', 'ACTIVE', 19);

-- registry feedback ---------------------------------------------------------------------------------------------------

INSERT INTO main.registry_feedback (email, name, question, sent_date) VALUES ('ttrinda@mail.ru', 'Natalya', 'Здраствуйте Александр. Быть может вам будет полезна информация.
Поищите в интернете. Алексей Унжаков рассказал
🔹Какие инвестиционные стратегии мы видим на время кризиса
🔹Какие 3 варианта развития событий наиболее вероятны в текущей ситуации
🔹Какие инвестиционные сделки мы будем продолжать публиковать и почему

⚠️ Мы продолжаем действовать, опираясь на вековые законы экономики: первичное богатство (золото, земля, природные ресурсы) и недвижимость всегда являются защитными активами для вашего капитала.

📈 Ипотечные ставки, которые сейчас предлагают банки, находятся в диапазоне от 18% до 23% годовых. Покупать инвестиционную недвижимость с такими процентными ставками НЕЛЬЗЯ. Поэтому мы будем ждать стабилизации ситуации и снижения ключевой ставки ЦБ до приемлемых уровней.

В связи с тем, что большинство инвестиционных стратегий за пределами РФ недоступны ❌ , мы нацелены на то, чтобы находить инвестиционные сделки внутри страны, которые помогут Вам защитить свой ', '2022-03-03');