CREATE DATABASE DbTweets;

CREATE USER 'danval'@'db4free.net' IDENTIFIED BY 'Xhval162!';

GRANT ALL PRIVILEGES ON DbTweets.* TO 'danval'@'db4free.net';

FLUSH PRIVILEGES;

USE DbTweets;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tweets (
  id VARCHAR(255) PRIMARY KEY,
  texto VARCHAR(1000) NOT NULL,
  feeling ENUM('-2', '-1', '0', '1', '2') DEFAULT '-2',
  fecha DATE,
  retweets INT,
  favoritos INT,
  usuario INT NOT NULL,
  FOREIGN KEY (usuario) REFERENCES usuarios(id),
  INDEX (usuario)
);

CREATE TABLE hashtags (
  id INT AUTO_INCREMENT,
  hashtag VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (hashtag)
);

CREATE TABLE tweet_hashtags (
  tweet_id VARCHAR(255),
  hashtag_id INT,
  PRIMARY KEY (tweet_id, hashtag_id),
  FOREIGN KEY (tweet_id) REFERENCES tweets(id),
  FOREIGN KEY (hashtag_id) REFERENCES hashtags(id)
);
