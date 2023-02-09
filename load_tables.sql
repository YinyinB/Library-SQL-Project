-- Load locations table
insert into locations (room, shelf, shelf_position)
values 
    ('Office', 'Left', 'Top'),
    ('Office', 'Left', 'Middle'),
    ('Office', 'Left', 'Bottom'),
    ('Office', 'Right', 'Top'),
    ('Office', 'Right', 'Middle'),
    ('Office', 'Right', 'Bottom'),
    ('Kindle', 'Warriors', ''),
    ('Kindle', 'The Shadowhunter Chronicles', ''),
    ('Kindle', 'Elfhame', ''),
    ('Kindle', 'Yinyin Books', '');

-- Load series table
insert into series (series_name, subseries_name)
values 
    ('Warriors', ''),
    ('The Shadowhunter Chronicles', 'The Mortal Instruments'),
    ('The Shadowhunter Chronicles', 'The Infernal Devices');

-- Load author table
insert into author (first_name, last_name)
values
    ('Erin', 'Hunter'),
    ('Cassandra', 'Clare');

-- Load books table
insert into books (book_name, author_id, series_id, genre, media_type, location_id)
values
    ('City of Bones', 2, 2, 'Fantasy', 'Digital', 8);

-- Load books table with subquery
insert into books (book_name, author_id, series_id, genre, media_type, location_id)
values
    ('City of Ashes', 
    (select author_id from author where last_name = 'Clare' and first_name = 'Cassandra'),
    (select series_id from series where series_name = 'The Shadowhunter Chronicles' and subseries_name = 'The Mortal Instruments'),
    'Fantasy',
    'Digital',
    (select location_id from locations where room = 'Kindle' and shelf = 'The Shadowhunter Chronicles'));

-- Select books from a series
select b.book_name, a.first_name, a.last_name, s.series_name, s.subseries_name, b.genre
from books b
join author a on books.author_id = author.author_id
join series s on books.series_id = series.series_id
where s.series_name = 'The Shadowhunter Chronicles'
group by s.subseries_name;