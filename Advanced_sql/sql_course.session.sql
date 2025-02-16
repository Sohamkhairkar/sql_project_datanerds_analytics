select * from (
    select * from job_postings_fact
    where extract(month from job_posted_date) = 1
) as jan_job_postings;

with jan_job_postings as (
    select * from job_postings_fact
    where extract(month from job_posted_date) = 1
)
select * from jan_job_postings;

select 
    company_id,
    name as company_name
from 
    company_dim
where 
    company_id in (
    select
        company_id
    from 
        job_postings_fact
    where
        job_no_degree_mention = 'TRUE'
    order BY
        company_id
);

select * from company_dim;
