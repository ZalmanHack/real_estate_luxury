-- locale_code ---------------------------------------------------------------------------------------------------------

INSERT INTO main.locale_code (id, code) VALUES (1, 'en');
INSERT INTO main.locale_code (id, code) VALUES (2, 'ru');
INSERT INTO main.locale_code (id, code) VALUES (3, 'es');

-- field_name ----------------------------------------------------------------------------------------------------------

INSERT INTO main.field_name (id, value) VALUES (1, 'APARTMENT');
INSERT INTO main.field_name (id, value) VALUES (2, 'HOUSE');
INSERT INTO main.field_name (id, value) VALUES (3, 'VILLA');
INSERT INTO main.field_name (id, value) VALUES (4, 'LAND');
INSERT INTO main.field_name (id, value) VALUES (5, 'BUSINESS');
INSERT INTO main.field_name (id, value) VALUES (6, 'RENT');
INSERT INTO main.field_name (id, value) VALUES (7, 'username.invalid.alreadyExist');
INSERT INTO main.field_name (id, value) VALUES (8, 'infoMessage.login.activationCode');
INSERT INTO main.field_name (id, value) VALUES (9, 'email.activationCode.body');
INSERT INTO main.field_name (id, value) VALUES (10, 'email.activationCode.title');
INSERT INTO main.field_name (id, value) VALUES (11, 'infoMessage.activateCode.success');
INSERT INTO main.field_name (id, value) VALUES (12, 'infoMessage.activateCode.fail');
INSERT INTO main.field_name (id, value) VALUES (13, 'email.invalid.alreadyExist');
INSERT INTO main.field_name (id, value) VALUES (14, 'email.restorePasswordCode.title');
INSERT INTO main.field_name (id, value) VALUES (15, 'email.restorePasswordCode.body');
INSERT INTO main.field_name (id, value) VALUES (16, 'infoMessage.restorePasswordCode.success');
INSERT INTO main.field_name (id, value) VALUES (17, 'infoMessage.restorePasswordCode.fail');
INSERT INTO main.field_name (id, value) VALUES (18, 'infoMessage.changePassword.success');
INSERT INTO main.field_name (id, value) VALUES (19, 'infoMessage.changePassword.fail');
INSERT INTO main.field_name (id, value) VALUES (20, 'companyName.invalid.alreadyExist');

-- alias ---------------------------------------------------------------------------------------------------------------

INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (1, 'Apartment', 1, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (2, 'House', 2, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (3, 'Villa', 3, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (4, 'Land', 4, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (5, 'Business', 5, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (6, 'Rent', 6, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (7, 'Квартиры', 1, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (8, 'Дома', 2, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (9, 'Виллы', 3, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (10, 'Земля', 4, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (12, 'Аренда', 6, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (11, 'Бизнес', 5, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (13, 'Departamento', 1, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (14, 'casa', 2, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (15, 'Villa', 3, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (16, 'Tierra', 4, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (17, 'Negocio', 5, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (18, 'Alquiler', 6, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (19, 'This username already exists', 7, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (20, 'Такое имя пользователя уже существует', 7, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (21, 'Este nombre de usuario ya existe', 7, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (22, '%s, an email with an activation key has been sent to your e-mail %s! ', 8, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (23, '%s, Вам на почту %s было отправлено письмо с ключём активации!', 8, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (24, '¡%s, se ha enviado un correo electrónico con una clave de activación a su correo electrónico %s! ', 8, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (28, 'Activation code', 10, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (29, 'Код активации', 10, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (30, 'Código de activación', 10, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (31, 'Activation completed successfully!', 11, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (32, 'Активация успешно пройдена!', 11, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (34, 'The activation code is not valid!', 12, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (35, 'Код активации не действителен!', 12, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (36, '¡El código de activación no es válido!', 12, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (33, '¡Activación completada con éxito!', 11, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (25, '<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>
Hey %s!
Welcome to %s!
Please go to <a href="https://%s/registration/activate/%s">link</a> to activate your account.
</body>
</html>', 9, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (27, '<html lang="es">
<head>
<meta charset="UTF-8">
</head>
<body>
¡Oye, %s!
¡Bienvenido a %s!
Siga el <a href="https://%s/registration/activate/%s">enlace</a> para activar su cuenta.
</body>
</html>', 9, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (26, '<html lang="ru">
<head>
<meta charset="UTF-8">
</head>
<body>
Привет, %s!
Добро пожаловать в %s!
Пожалуйста, для активации аккаунта, перейдите по <a href="https://%s/registration/activate/%s">ссылке</a>.
</body>
</html>', 9, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (38, 'Такая почта уже привязана', 13, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (40, 'Password recovery', 14, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (41, 'Восстановление пароля', 14, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (42, 'Recuperación de contraseña', 14, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (43, '<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>
Hey %s!
Please follow the <a href="https://%s/restore/password/change?code=%s">link</a> to restore access to your account.
</body>
</html>', 15, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (44, '<html lang="ru">
<head>
<meta charset="UTF-8">
</head>
<body>
Привет, %s!
Пожалуйста, перейдите по <a href="https://%s/restore/password/change?code=%s">ссылке</a>, чтобы восстановить доступ к аккаунту.
</body>
</html>', 15, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (45, '<html lang="es">
<head>
<meta charset="UTF-8">
</head>
<body>
¡Oye, %s!
Siga el <a href="https://%s/restore/password/change?code=%s">enlace</a> para restaurar el acceso a su cuenta.
</body>
</html>', 15, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (39, 'Este correo electrónico ya está vinculado', 13, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (37, 'This email is already linked', 13, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (49, 'There are no accounts linked to email', 17, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (50, 'К электронной почте нет привязанных аккаунтов', 17, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (51, 'No hay cuentas vinculadas al correo electrónico', 17, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (47, 'Вам на почту %s было отправлено письмо с ссылкой для восстановления пароля!', 16, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (46, 'An email has been sent to %s with a link to reset your password!', 16, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (48, 'Se ha enviado un correo electrónico a %s con un enlace para restablecer su contraseña.', 16, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (52, 'Password changed successfully!', 18, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (53, 'Пароль успешно изменен!', 18, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (54, '¡Contraseña cambiada con éxito!', 18, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (55, 'Failed to change password', 19, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (56, 'Не удалось изменить пароль', 19, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (57, 'No se pudo cambiar la contraseña', 19, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (58, 'This company already exists', 20, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (59, 'Такая компания уже существует', 20, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (60, 'Esta empresa ya existe', 20, 3);

-- city ----------------------------------------------------------------------------------------------------------------

INSERT INTO main.city (id, value) VALUES (1, 'Punta Cana');
INSERT INTO main.city (id, value) VALUES (2, 'Lagunas de Nisibón');

-- location ------------------------------------------------------------------------------------------------------------

INSERT INTO main.location (id, latitude, longitude, name, city_id) VALUES (5, 18.685664, -68.421204, ' ', 1);
INSERT INTO main.location (id, latitude, longitude, name, city_id) VALUES (4, 18.625894, -68.411858, 'Drake village', 1);
INSERT INTO main.location (id, latitude, longitude, name, city_id) VALUES (3, 18.683839, -68.417952, 'Coral Village ll', 1);
INSERT INTO main.location (id, latitude, longitude, name, city_id) VALUES (1, 18.731349, -68.480693, 'Cana Pearl', 1);
INSERT INTO main.location (id, latitude, longitude, name, city_id) VALUES (2, 18.858772, -68.63141, 'Coconut villages Dominicana', 2);
INSERT INTO main.location (id, latitude, longitude, name, city_id) VALUES (6, 18.683792, -68.419501, 'Oceana', 1);
INSERT INTO main.location (id, latitude, longitude, name, city_id) VALUES (7, 18.671804, -68.406046, 'Paseo playa coral', 1);

--

