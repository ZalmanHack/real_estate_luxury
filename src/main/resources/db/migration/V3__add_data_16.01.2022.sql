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
INSERT INTO main.field_name (id, value) VALUES (21, 'MODERATED');
INSERT INTO main.field_name (id, value) VALUES (22, 'DECLINED');
INSERT INTO main.field_name (id, value) VALUES (23, 'ACTIVE');
INSERT INTO main.field_name (id, value) VALUES (24, 'DISABLED');
INSERT INTO main.field_name (id, value) VALUES (25, 'SOLD_OUT');

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
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (61, 'Moderated', 21, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (62, 'Declined', 22, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (63, 'Active', 23, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (64, 'Disabled', 24, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (65, 'Sold out', 25, 1);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (66, 'Модерируется', 21, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (67, 'Отклонено', 22, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (68, 'Активный', 23, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (69, 'Отклонено', 24, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (70, 'Продано', 25, 2);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (71, 'Moderado', 21, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (72, 'Rechazado', 22, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (73, 'Activo', 23, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (74, 'Inhabilitado', 24, 3);
INSERT INTO main.alias (id, value, field_name_id, locale_code_id) VALUES (75, 'Agotado', 25, 3);
-- city ----------------------------------------------------------------------------------------------------------------

INSERT INTO main.city (value) VALUES ('Punta Cana');
INSERT INTO main.city (value) VALUES ('Lagunas de Nisibón');

-- posts ---------------------------------------------------------------------------------------------------------------

INSERT INTO main.post (area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, main_image, main_video, mall, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, latitude,  longitude, name, city_id) VALUES (27.4, 2, 800, 3, 1, 1, 1, '/img/1.1.jpg', '/vid/1.mp4', 1, 1, 'ACTIVE', true, 157000, '2022-01-01', 'APARTMENT', 1, 0, 1, 1,     18.731349, -68.480693, 'Cana Pearl', 1);
INSERT INTO main.post (area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, main_image, main_video, mall, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, latitude,  longitude, name, city_id) VALUES (184, 2, 10, 2, 0, 1, 0, '/img/2.1.jpg', '/vid/2.mp4', 0, 2, 'ACTIVE', true, 500000, '2022-01-05', 'VILLA', 1, 0, 1, 1,           18.858772, -68.63141, 'Coconut villages Dominicana', 2);
INSERT INTO main.post (area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, main_image, main_video, mall, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, latitude,  longitude, name, city_id) VALUES (63.39, 2, 350, 2, 1, 0, 1, '/img/3.1.jpg', '/vid/3.mp4', 1, 1, 'ACTIVE', true, 123000, '2022-01-05', 'APARTMENT', 2, 1, 1, 1,    18.683839, -68.417952, 'Coral Village ll', 1);
INSERT INTO main.post (area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, main_image, main_video, mall, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, latitude,  longitude, name, city_id) VALUES (135, 3, 500, 3, 0, 1, 0, '/img/4.1.jpg', null, 1, 2, 'ACTIVE', true, 150000, '2022-01-08', 'VILLA', 1, 0, 1, 1,                  18.625894, -68.411858, 'Drake village', 1);
INSERT INTO main.post (area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, main_image, main_video, mall, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, latitude,  longitude, name, city_id) VALUES (2687, 0, 500, 0, 0, 0, 0, '/img/5.1.jpg', null, 0, 0, 'ACTIVE', false, 250, '2022-01-08', 'LAND', 0, 0, 0, 1,                     18.685664, -68.421204, ' ', 1);
INSERT INTO main.post (area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, main_image, main_video, mall, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, latitude,  longitude, name, city_id) VALUES (69, 1, 300, 1, 1, 0, 0, '/img/7.1.jpg', '/vid/7.mp4', 1, 1, 'ACTIVE', false, 194000, '2022-01-13', 'APARTMENT', 1, 0, 1, 1,      18.683792, -68.419501, 'Oceana', 1);
INSERT INTO main.post (area, bathrooms, beach, bedrooms, golf, guest_bathrooms, gym, main_image, main_video, mall, parking, post_status, premium, price, publication_date, real_estate_type, swimming_pool, tennis, terrace, user_id, latitude,  longitude, name, city_id) VALUES (65.58, 3, 600, 3, 0, 0, 1, '/img/6.1.jpg', '/vid/6.mp4', 1, 1, 'ACTIVE', true, 194000, '2022-01-11', 'APARTMENT', 1, 0, 1, 1,    18.671804, -68.406046, 'Paseo playa coral', 1);

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