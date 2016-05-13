# part 1 # 1

select c.chore_id, c.chore_name, c.created_at, c.claimed_by, c.claimed_at, d.status
from (select a.chore_id, a.chore_name, a.created_at, b.claimed_by, b.claimed_at 
from (select * 
from (select chore_id, chore_name,
	case when event_type = 'created' 
		then event_timestamp  
	end
	as created_at 
	from chore_events) a
where created_at is not null) a
join
(select *
from (select chore_id,
	case when event_type = 'claimed'
		then actor_id
		end
	as claimed_by,
	case when event_type = 'claimed'
		then event_timestamp 
		end
	as claimed_at
	from chore_events) b 
where claimed_by and claimed_at is not null) b
on a.chore_id = b.chore_id) c
join 
(select chore_id, 
count(chore_name), 
case 
	when count(chore_name) = 3 then 'completed'
	when count(chore_name) = 2 then 'in_progress'
	when count(chore_name) = 1 then 'unclaimed' 
	end 
as status
from chore_events
group by chore_id) d
on c.chore_id = d.chore_id


****


#part 2, #1
# for the count
select count(distinct chore_name)
from opendoor_query1

#for a list of the actual unique chores.

select distinct chore_name
from opendoor_query1 

# part 2, #2
select claimed_by, count(chore_name)
from opendoor_query1
group by claimed_by 

# part 2, #3 

select a.claimed_by, a.in_progress, b.completed, b.completed/(a.in_progress + b.completed) as rate
from (select claimed_by, count(chore_name) as in_progress
	from opendoor_query1 where status = 'in_progress' group by claimed_by) a
join 
(select claimed_by, count(chore_name) as completed
	from opendoor_query1 where status='completed' group by claimed_by) b
on a.claimed_by = b.claimed_by

#part 2, #4 

select avg(c.td) from (select a.chore_id, a.created_at, timestampdiff (hour, a.created_at, b.created_at) as td
from opendoor_query1 a inner join opendoor_query1 b on b.chore_id = (a.chore_id + 1)
order by a.chore_id asc) c

select b.chore_name, avg(b.td)
from (select a.chore_id, a.chore_name, a.created_at, timestampdiff (hour, a.created_at, b.created_at) 		as td
	from opendoor_query1 a inner join opendoor_query1 b on b.chore_id = (a.chore_id + 1)
	order by a.chore_id asc) b
group by b.chore_name


# part 2, #5

# created_at -> claimed_at

select chore_id, timestampdiff(minute, created_at, claimed_at)
from opendoor_query1

select avg(timestampdiff(minute, created_at, claimed_at))
from opendoor_query1

# average grouped by chore_name
select chore_name, avg(timestampdiff(minute, created_at, claimed_at))
from opendoor_query1
group by chore_name

# claimed_at -> completed_at

select avg(timestampdiff(minute, c.claimed_at, c.completed_at))
from (
	select opendoor_query1.chore_id, opendoor_query1.chore_name, opendoor_query1.claimed_at, 	b.completed_at
	from opendoor_query1 
	join 
	(select a.chore_id, a.completed_at from (select chore_id, 
				case when event_type = 'completed' 
					then event_timestamp  
				end
				as completed_at 
			from chore_events) a
		where a.completed_at is not null) b
	on opendoor_query1.chore_id = b.chore_id) c

## part 2, #6

select .9* count(a.td)
from (
		select timestampdiff(minute, created_at, claimed_at) as td
		from opendoor_query1
		order by td asc) a

select timestampdiff(minute, created_at, claimed_at) as td
from opendoor_query1
order by td asc limit 9001, 1
