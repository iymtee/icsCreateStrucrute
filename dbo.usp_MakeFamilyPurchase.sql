create procedure MakeFamilyPurchase (@FamilySurName varchar(255))
as
if ((select count(SurName) from Family where Family.SurName like @FamilySurName) > 0)
update Family
set dbo.Family.BudgetValue = dbo.Family.BudgetValue - (select sum([Value]) from dbo.Basket where Family.SurName = @FamilySurName)
where Family.SurName = @FamilySurName
else
raiserror('����� � �������� �������� - �� ����������!', 16, 1)