CREATE TABLE mobiles (mobileid NUMBER PRIMARY KEY, name VARCHAR2 (20), price NUMBER(10,2),quantity VARCHAR2(20));

INSERT INTO mobiles VALUES(1001,'Nokia Lumia 520',8000,20);
INSERT INTO mobiles VALUES(1002,'Samsung Galaxy IV',38000,40);
INSERT INTO mobiles VALUES(1003,'Sony xperia C',15000,30);
INSERT INTO mobiles VALUES(1004,'Apple iphone XS',132000,10);
INSERT INTO mobiles VALUES(1005,'Apple iphone i6',34000,50);

commit;

CREATE TABLE purchasedetails(purchaseid NUMBER, cname vARCHAR2(20), mailid VARCHAR2(30),phoneno VARCHAR2(20), purchasedate DATE, mobileid references mobiles(mobileid));

create sequence purchaseid_sequence;