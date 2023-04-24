create or alter trigger TR_Basket_insert_update 
on  dbo.Basket
for insert, update
as
if ((select top(1) ID_SKU from dbo.Basket  where id <> (select id from inserted) order by id desc) = (select ID_SKU from inserted))
begin
	update dbo.Basket
	set DiscountValue = (select [Value] from dbo.Basket where (select id from inserted) = id ) * 0.5
	where id = (select id from inserted) 
		  and id = (select top(1) ID_SKU from dbo.Basket order by id)
end
else 
begin
	update dbo.Basket
	set DiscountValue = 0
	where id = (select id from inserted) 
		  and id = (select top(1) ID_SKU from dbo.Basket order by id)
end