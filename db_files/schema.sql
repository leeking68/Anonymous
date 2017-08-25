CREATE DATABASE ANONYMOUSCHAT;
CREATE TABLE CHAT (
  chatName VARCHAR(20),
  chatContent VARCHAR(100),                                            
  chatTime DATETIME                     
 );        
 
 INSERT INTO CHAT VALUES('이길호','나는 천재', now());
 INSERT INTO CHAT VALUES('이하니','빨리오기나해', now());
 INSERT INTO CHAT VALUES('구상모','저 다옴', now());
 INSERT INTO CHAT VALUES('황재섭','나는 부산이지롱', now());