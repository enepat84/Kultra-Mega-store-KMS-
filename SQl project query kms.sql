 create database KMS_P_DB

 -----IMPORT CVS FILES INTO DB---
 ----KMS SQL CASESTUDY--

 --- analysis 

 select * from [KMS Sql Case Study]

 --- highest sales porduct category

 select top 1 * from (
 select product_category, sales, product_name
  from [KMS Sql Case Study]) as product_category
    ---from sales_data )

    select top 3  * from (
 select Region, sales, product_name
  from [KMS Sql Case Study]) as product_category
    ---from sales_data )


      select 3 mim (
--- Region, sales, product_name
  from[KMS Sql Case Study] AS product_category
    ---from sales_data )


    -----select bottom 3
 --- find the lowest 3  (
 select Region, sales, product_name
  from [KMS Sql Case Study] as product_category
    ---from sales_data )

    

----- total sales of appliance in ontario

select   * from (
 select product_category, product_sub_category,sales,product_name
  from [KMS Sql Case Study]) as product_category
    ---from sales_data )
    order by product_name

  
   

    select top 10 * from (
 select product_category, profit, sales, product_name
  from [KMS Sql Case Study]) as profit
    ---from sales_data ) desc


    select top 10 * from (
 select product_category, profit, sales, product_name
  from [KMS Sql Case Study]) as profit
    ---from sales_data ) Asc
    --limit 10;

    select   * from (
 select  product_name, product_category, ship_mode,shipping_cost sales, 
 from [KMS Sql Case Study] As product_name
    ---from sales_data )
    order by product_name

    
   
select( 
  (Customer_Segment product_name,Sales)
 from [kms sql case study]
 order by customer_segment
 )

 the p
 

    
     

   

   

