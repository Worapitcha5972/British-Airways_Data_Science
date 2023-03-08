ALTER TABLE BA_reviews RENAME date to rev_date;

ALTER TABLE BA_reviews ADD verify char(3);

UPDATE BA_reviews SET verify = CASE 
	WHEN reviews like '%Trip Verified%' THEN 'Yes'
	ELSE 'No'
END;

update BA_reviews
set reviews = trim(replace(substr(reviews,instr(reviews, '|') -1),'|', ''));

PRAGMA table_info(BA_reviews);

