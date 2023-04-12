create or alter function GetSKUPrice (@ID_SKU as int)
returns decimal(18, 2)
begin 
declare @price decimal(18,2)
set @price = 
(select sum([Value])/sum(Quantity)
from dbo.Basket
where @ID_SKU = Basket.ID_SKU)
return @price
end