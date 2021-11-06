use spmproject;

-- this shows all the courses that has prereq that learner can take 
select for_cid from course_completed cc, prerequisites p 
where cc.cid = p.prerequisites_CID
and eid = 1;


-- find out the courses that has prereq learner cannot take
select c.cid from course c, prerequisites p 
where c.cid = p.for_cid
and c.cid not in 
(select for_cid from course_completed cc, prerequisites p 
where cc.cid = p.prerequisites_CID
and eid = 1);

-- filter out 
select * from course c
where c.cid not in
	(select c.cid from course c, prerequisites p 
	where c.cid = p.for_cid
	and c.cid not in 
	(select for_cid from course_completed cc, prerequisites p 
	where cc.cid = p.prerequisites_CID
	and eid = 1));
