create database tv_review_app;
use tv_review_app;
create table users(
	id int auto_increment primary key,
    username varchar (255) unique not null,
    created_at timestamp default now()
    );

create table photos(
	id int auto_increment primary key,
    image_url  varchar(255) not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id)
    );

create table comments(
	id int auto_increment primary key,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id)
    );
create table likes(
	user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id),
    primary key (user_id,photo_id)
    );
    
create table follow(
	folower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    foreign key (folower_id) references users(id),
    foreign key (followee_id) references users(id),
    primary key (folower_id,followee_id)
    );

create table tags(
	id int auto_increment not null primary key,
    tag_name varchar (255) unique,
    created_at timestamp default now()
    );
create table photo_tags(
	photo_id int not null,
    tag_id int not null,
    foreign key (photo_id) references photos(id),
    foreign key(tag_id) references tags(id),
    primary key (photo_id , tag_id)
    );

show tables;



insert into users(username)values
		('BlueTheCat'),
        ('CharlieBrown'),
        ('ColtSteele');
insert into photos( image_url,user_id) values
		('/asdfg98',1),
        ('/qwsaered32',2),
        ('eeewerds65',2);
insert into comments(comment_text,user_id,photo_id) values
		('amzing',1,3),
        ('good one',3,2),
        ('i liked',2,2);
insert into likes(user_id,photo_id) values
		(1,1),
        (1,3),
        (3,2),
        (2,2);
insert into follow(folower_id,followee_id) values
		(1,1),
        (2,1),
        (1,2),
        (3,2);
insert into tags(tag_name) values
	('adorable'),
    ('cute'),
    ('beauty');
insert into photo_tags(photo_id,tag_id) values
	(1,1),
    (1,2),
    (2,3),
    (3,2);