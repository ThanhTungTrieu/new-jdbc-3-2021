CREATE TABLE role(
	id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	code VARCHAR(255) NOT NULL,
    createdDate TIMESTAMP NULL,
    modifiedDate TIMESTAMP NULL,
    createdBy VARCHAR(255) NULL,
    modifiedBy VARCHAR(255) NULL
);

CREATE TABLE user(
	id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
    fullname VARCHAR(255) NULL,
    status INT NOT NULL,
    roleId BIGINT NOT NULL,
	createdDate TIMESTAMP NULL,
    modifiedDate TIMESTAMP NULL,
    createdBy VARCHAR(255) NULL,
    modifiedBy VARCHAR(255) NULL
);

ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (roleId) REFERENCES role(id);

CREATE TABLE news (
  id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NULL,
  thumbnail VARCHAR(255) NULL,
  shortDescription TEXT NULL,
  content TEXT NULL,
  categoryId bigint NOT NULL,
  createdDate TIMESTAMP NULL,
  modifiedDate TIMESTAMP NULL,
  createdBy VARCHAR(255) NULL,
  modifiedBy VARCHAR(255) NULL
);

CREATE TABLE category(
	id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NULL,
    code VARCHAR(255) NULL,
    createdDate TIMESTAMP NULL,
    modifiedDate TIMESTAMP NULL,
    createdBy VARCHAR(255) NULL,
    modifiedBy VARCHAR(255) NULL
);

ALTER TABLE news ADD CONSTRAINT fk_news_category FOREIGN KEY (categoryId) REFERENCES category(id);

CREATE TABLE comment(
	id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	content TEXT NOT NULL,
    userId BIGINT NOT NULL,
    newsId BIGINT NOT NULL,
    createdDate TIMESTAMP NULL,
    modifiedDate TIMESTAMP NULL,
    createdBy VARCHAR(255) NULL,
    modifiedBy VARCHAR(255) NULL
);

ALTER TABLE comment ADD CONSTRAINT fk_comment_user FOREIGN KEY (userId) REFERENCES user(id);
ALTER TABLE comment ADD CONSTRAINT fk_comment_news FOREIGN KEY (newsId) REFERENCES news(id);