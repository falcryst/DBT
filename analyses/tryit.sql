select orderid, count(*) from 
{{ref('orderitems_stg')}}
group by orderid


select sum(totalprice) from 
{{ref('orderitems_stg')}}
where orderid= 800044

select * from 
{{ref('orderitems_stg')}}
where orderid= 800044



select * from {{ref('orders_fact')}} OS where ordercount!=1