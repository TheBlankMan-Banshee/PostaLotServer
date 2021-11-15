create table Login (
	Login_id serial primary key,
	Hash VARCHAR(100) not null,
	Email text unique NOT NULL
);

create table Users (
	User_id serial primary key, /* serial auto increments value */
	User_Name VARCHAR(100),
	Email text unique NOT null,
	Joined TIMESTAMP not null
);
