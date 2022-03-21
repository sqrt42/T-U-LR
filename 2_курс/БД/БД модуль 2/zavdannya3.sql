select product_name
from sales, sales_guts, products_guidebook, firms_guidebook
where not exists (
select product_name
from sales, sales_guts, products_guidebook, firms_guidebook
where sales.firm_code=3030 
and sales.firm_code=firms_guidebook.firm_code
and sales_guts.sales_code=sales.id
and sales_guts.product_code=products_guidebook.product_code
)
and sales_guts.product_code=products_guidebook.product_code
and sales.firm_code=firms_guidebook.firm_code
and sales_guts.sales_code=sales.id