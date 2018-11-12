Create table flat_owners(owner_id number(4) primary key, owner_name varchar2(45),mobile varchar2(10 BYTE));

Insert into flat_owners values(1,'Vaishali Srivastava','8888108810');
Insert into flat_owners values(2,'Ankita Ghokhle','9876665454');
Insert into flat_owners values(3,'Rohini Vijayan','7659993201');


create table flat_registration(flat_reg_no number(10) primary key,owner_id number(4) references flat_owners(owner_id),flat_type number(1),flat_area number(4),rent_amount number(10,2),deposit_amount number(10,2));

create sequence flat_seq start with 1000;