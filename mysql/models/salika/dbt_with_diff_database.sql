{{ config(materialized='table') }}
with stage as(
select
*
 from {{ source('sakila', 'table1') }}
left join {{ source('sample_db', 'table2') }} using (id)
),

final as(
select * from stage
)
select * from final