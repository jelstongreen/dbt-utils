{% set aggregate_field = 'value_field' %}


with data as (

    select
        {{ dbt_utils.star(from=ref('data_star'), except=[aggregate_field]) }},
        sum ({{ aggregate_field }}) as {{ aggregate_field }}_sum

    from {{ ref('data_star') }}
    group by {{ dbt_utils.star(from=ref('data_star'), except=[aggregate_field]) }}

)

select * from data
