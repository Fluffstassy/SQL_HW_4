--=============== МОДУЛЬ 4. УГЛУБЛЕНИЕ В SQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--База данных: если подключение к облачной базе, то создаёте новую схему с префиксом в --виде фамилии, название должно быть на латинице в нижнем регистре и таблицы создаете --в этой новой схеме, если подключение к локальному серверу, то создаёте новую схему и --в ней создаёте таблицы.

--Спроектируйте базу данных, содержащую три справочника:
--· язык (английский, французский и т. п.);
--· народность (славяне, англосаксы и т. п.);
--· страны (Россия, Германия и т. п.).
--Две таблицы со связями: язык-народность и народность-страна, отношения многие ко многим. Пример таблицы со связями — film_actor.
--Требования к таблицам-справочникам:
--· наличие ограничений первичных ключей.
--· идентификатору сущности должен присваиваться автоинкрементом;
--· наименования сущностей не должны содержать null-значения, не должны допускаться --дубликаты в названиях сущностей.
--Требования к таблицам со связями:
--· наличие ограничений первичных и внешних ключей.

--В качестве ответа на задание пришлите запросы создания таблиц и запросы по --добавлению в каждую таблицу по 5 строк с данными.
 
--СОЗДАНИЕ ТАБЛИЦЫ ЯЗЫКИ

create table language (
	language_id serial primary key,
	language varchar(64) not null unique
	);

--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ ЯЗЫКИ

insert into "language" ("language")
	values 
	('еnglish'),
	('french'),
	('turkish'),
	('spanish'),
	('greek');

--СОЗДАНИЕ ТАБЛИЦЫ НАРОДНОСТИ

create table nationality (
	nationality_id serial primary key,
	nationality varchar(64) not null unique
	);

--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ НАРОДНОСТИ

insert into nationality (nationality)
	values 
	('englishmen'),
	('french'),
	('turks'),
	('spaniards'),
	('greeks');

--СОЗДАНИЕ ТАБЛИЦЫ СТРАНЫ

create table country (
	country_id serial primary key,
	country varchar(64) not null unique
	);

--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СТРАНЫ

insert into country (country)
	values 
	('great_britain'),
	('france'),
	('turkey'),
	('spain'),
	('greece');

--СОЗДАНИЕ ПЕРВОЙ ТАБЛИЦЫ СО СВЯЗЯМИ

create table nationality_language (
	language_id int2 references language(language_id),
	nationality_id int2 references nationality(nationality_id),
	create_date timestamp default now()
	);

--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СО СВЯЗЯМИ

insert into nationality_language (nationality_id, language_id)
	values 
	('1','1'),
	('2','2'),
	('3','3'),
	('4','4'),
	('5','5');

--СОЗДАНИЕ ВТОРОЙ ТАБЛИЦЫ СО СВЯЗЯМИ

create table nationality_country (
	nationality_id int2 references nationality(nationality_id),
	country_id int2 references country(country_id)
	);

--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СО СВЯЗЯМИ

insert into nationality_country (nationality_id, country_id)
	values 
	('1','1'),
	('2','2'),
	('3','3'),
	('4','4'),
	('5','5');
