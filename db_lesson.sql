CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );

ALTER TABLE people
ADD department_id INT UNSIGNED;

INSERT INTO departments (name) VALUES ('営業');
INSERT INTO departments (name) VALUES ('開発');
INSERT INTO departments (name) VALUES ('経理');
INSERT INTO departments (name) VALUES ('人事');
INSERT INTO departments (name) VALUES ('情報システム');

INSERT INTO people (name, email, age, gender) VALUES ('今岡稜', 'ryoimaoka@gizumo.jp', 25, 1);
INSERT INTO people (name, email, age, gender) VALUES ('高橋美咲 ', 'takahashimisaki@gizumo.jp', 28, 2);
INSERT INTO people (name, email, age, gender) VALUES ('渡辺亮', 'watanaberyo@gizumo.jp', 35, 1);
INSERT INTO people (name, email, age, gender) VALUES ('森田陽子', 'moritayouko@gizumo.jp', 40, 2);

UPDATE people SET department_id = 1 WHERE person_id IN (1,2,3);

-- https://github.com/rimaoka18/db_lesson_basic/pull/1
