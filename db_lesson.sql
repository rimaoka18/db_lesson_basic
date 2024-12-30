CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );

-- Q2
ALTER TABLE people
ADD department_id INT UNSIGNED;

-- Q3/Q4
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
UPDATE people SET department_id = 2 WHERE person_id IN (4,5,6,7);
UPDATE people SET department_id = 3 WHERE person_id = 8;
UPDATE people SET department_id = 4 WHERE person_id = 9;
UPDATE people SET department_id = 5 WHERE person_id = 10;

DELETE FROM reports WHERE report_id = 11;

UPDATE reports SET content = '午後からコードの修正を行いました' WHERE report_id = 2;
UPDATE reports SET content = 'クライアントに資料を送付しました' WHERE report_id = 3;
UPDATE reports SET content = 'チームで次のプロジェクトを計画しました' WHERE report_id = 4;
UPDATE reports SET content = 'メール対応に多くの時間を使いました' WHERE report_id = 5;
UPDATE reports SET content = 'データベースのテストを実施しました' WHERE report_id = 6;
UPDATE reports SET content = '今日の業務は順調でした' WHERE report_id = 7;
UPDATE reports SET content = '会議で新しい案が決まりました' WHERE report_id = 8;
UPDATE reports SET content = '仕様書のレビューを進めました' WHERE report_id = 9;
UPDATE reports SET content = '新入社員に業務の説明をしました' WHERE report_id = 10;

-- Q5
SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

-- これは、peopleテーブルの中にあるdepartment_idが1に当てはまるレコードのname、email、ageのデータを表示します。created_atは、このデータがいつ作られたかを表します

-- Q7
SELECT name
FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
OR (gender = 1 AND age BETWEEN 40 AND 49);

-- Q8
SELECT name
FROM *
WHERE department_id = 1
ORDER BY age ASC

-- Q9
SELECT AVG(age) AS average_age
FROM people
WHERE gender = 2 AND department_id = 2

-- Q10
SELECT p.name, d.name AS department_name, r.content
FROM people p
JOIN departments d ON p.department_id = d.department_id
JOIN reports r ON p.person_id = r.person_id
WHERE r.content IS NOT NULL;

-- Q11
SELECT p.name
FROM people p
LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.content IS NULL;
