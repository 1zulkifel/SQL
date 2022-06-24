-- Opertaions oldest 7 users
select * 
from users 
order by created_at
limit 7;
-- Most popupler registration date
select dayname(created_at) as day_name ,count(*) as total
from users 
group by day_name
order by total desc 
limit 5;
-- inactive users

select *
from users
inner join photos
on users.id=photos.user_id;

select username, image_url 
from users
inner join photos
on users.id=photos.user_id;
--
select username, image_url 
from users
left join photos
on users.id=photos.user_id;


select *
from users
left join photos
on users.id=photos.user_id
where photos.user_id is null;

select photos.id,photos.image_url,likes.user_id
from photos 
inner join likes
on likes.photo_id=photos.id 
order by user_id desc ;


select photos.id,photos.image_url, count(*) as total
from photos 
inner join likes
on likes.photo_id=photos.id 
group by photos.id 
order by total desc;

-- selecting users
select 
	username,
	photos.id,
    photos.image_url, 
    count(*) as total
from photos 
inner join likes
on likes.photo_id=photos.id 
inner join users
	on users.id=photos.user_id
	
group by photos.id 
order by total desc;

-- total avg post by a user
select 
	(select count(*) from photos)/(select count(*) from users) as 'avg';
    
-- for top most 6 used hash tags
select 
		tags.tag_name,
		count(*) as total
	from photo_tags
join tags
 on tags.id =photo_tags.tag_id
 group by tags.id
 order by total desc
 limit 6;    
 
 -- bots  user who liked every photo
 select  
		username,
        user_id,
        count(*) as num_likes
 from users
 inner join likes
 on users.id=likes.user_id
 group by likes.user_id
 having num_likes = (select count(*) from photos);
 
 --
 