/*
2024-02-14 - SQL - Indsætte, ændre og slette data samt summary queries
*/

use social_medium;

/*
Chapter 5: Update, insert and delete
*/

create table profile_copy as
select *
from profile;

insert profile(firstname, lastname, email, date_of_birth, gender)
values ('New', 'Person', 'new@person.com', '1990-04-30', 'Other');
select * from profile where firstname like 'new';

update profile
set gender = 'Female'
where profile_id = 51;
select * from profile where profile_id = 51;

delete from profile
where profile_id = 51;
select * from profile where profile_id = 51;

select count(*) from profile_copy;
delete from profile_copy; -- Safe Update is disabled
select count(*) from profile_copy;

insert profile(firstname, lastname, email, date_of_birth, gender)
values ('New', 'Person', 'new@person.com', '1990-04-30', 'Other');
select * from profile where firstname like 'new';
delete from profile where firstname like 'new';



/*
Chapter 6: Summary queries
*/

select count(*) from post_tag where tag_id = 1;

select min(tag_name), max(tag_name) from tag;

select count(*) as "Total", count(distinct title) as "Unique" from post;

-- select count(tag_id);

SELECT customer_id, SUM(total_sales) AS "Total sales per customer"
FROM sales
GROUP BY customer_id
HAVING SUM(total_sales) >= 1000;

select post.profile_id, firstname, lastname, count(post_id) as "Posts made"
from post
join profile on post.profile_id = profile.profile_id
group by post.profile_id
having count(post_id) > 15
order by 'Posts made';
