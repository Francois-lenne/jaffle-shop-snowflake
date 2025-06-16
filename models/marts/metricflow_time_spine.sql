-- metricflow_time_spine.sql
with

days as (

    --for BQ adapters use "DATE('01/01/2000','mm/dd/yyyy')"
    select current_timestamp as date_day

),

cast_to_date as (

    select cast(date_day as date) as date_day

    from days

)

select * from cast_to_date