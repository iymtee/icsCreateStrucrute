create or alter view SKUPrice
as 
select 
	*
	,dbo.GetSKUPrice(id) as Price
from SKU