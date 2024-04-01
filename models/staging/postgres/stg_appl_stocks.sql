{{
  config(
    materialized = 'table',
    )
}}

with

appl_stocks as (
    select * from {{ source('postgres_public', 'appl_stocks_src')}}
),

final as (
    select
        1 as additional_column,
        'Apple' as company,
        'AAPL' as ticker,
        *
    from appl_stocks
)

select * from final
