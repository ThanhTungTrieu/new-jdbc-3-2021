USE newjdbc_march2021;

INSERT INTO role(code, name) VALUES('ADMIN', 'ADMIN');
INSERT INTO role(code, name) VALUES('USER', 'USER');

INSERT INTO USER(username, password, fullname, status, roleid) VALUES('admin', '123456', 'admin', 1, 1);
insert into user(username, password, fullname, status, roleid) VALUES('nguyenvana', '123456', 'Nguyễn Văn A', 1 ,2);
INSERT INTO USER(username, password, fullname, status, roleid) VALUES('nguyenvanb', '123456', 'Nguyễn Văn B', 1, 2);