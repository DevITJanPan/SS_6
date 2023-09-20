create database Trigger_Demo;
use Trigger_Demo;
create table Product(
productId char(5) primary key,
productName float,
price float
);
insert into Product(productId,productName,price)
values ('Pd02','2','6000');
select * from Product;
DELIMITER //
create trigger before_insert_product before insert on Product for each row
begin 
if (NEW.price<0) then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Giá nhập vào phải lớn hơn không';	
	end if;
end //
DELIMITER ;
DELIMITER //
create trigger before_update_product before update on Product for each row
begin
if(NEW.price<0) then
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Giá sửa  phải lớn hơn không';	
end if;
end //
DELIMITER ;
drop trigger before_update_product;
update Product
set price = -10
where productId = 'Pd02';

