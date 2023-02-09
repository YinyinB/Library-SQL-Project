-- Use this file to create a database and related tables for a personal library system.

-- Create the library database
create database library;

-- Create the locations table
create table [if not exists] locations(
    location_id int auto_increment,
    room varchar(255) not null,
    shelf varchar(255) not null,
    shelf_position varchar(255),
    primary key(location_id)
);

-- Create the series table
create table [if not exists] series(
    series_id int auto_increment,
    series_name varchar(255) not null,
    subseries_name varchar(255),
    primary key(series_id)
);

-- Create the author table
create table [if not exists] author(
    author_id int auto_increment,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    primary key(author_id)
);

-- Create the books table
create table [if not exists] books(
    book_id int auto_increment,
    book_name varchar(255) not null,
    author_id int,
    series_id int,
    genre varchar(255) not null,
    media_type varchar(255) not null,
    location_id int,
    primary key(book_id),
    foreign key(location_id)
        references locations(location_id),
    foreign key(series_id)
        references series(series_id),
    foreign key(author_id)
        references author(author_id)
);