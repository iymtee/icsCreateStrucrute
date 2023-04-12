create table dbo.SKU
(
ID int identity(1,1) primary key, 
Code  as 'c' + cast(id as varchar(10)) unique, 
[Name] varchar(255)
)

create table dbo.Family
(
ID int identity(1,1) primary key, 
SurName varchar(255), 
BudgetValue decimal(18, 2)
)

create table dbo.Basket 
(
ID int identity(1,1) primary key, 
ID_SKU int not null, 
ID_Family int not null,
Quantity int check (Quantity >= 0), 
[Value] money check ([Value] >= 0), 
PurchaseDate date default(getdate()), 
DiscountValue decimal(18, 2),
foreign key(ID_SKU) references dbo.SKU(ID),
foreign key(ID_Family) references dbo.Family(ID)
)