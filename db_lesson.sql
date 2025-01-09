CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );

-- Q2
ALTER TABLE people
MODIFY department_id INT UNSIGNED AFTER email;

-- Q3/Q4
INSERT INTO departments (name)
VALUES
    ('営業'),
    ('開発'),
    ('経理'),
    ('人事'),
    ('情報システム');

INSERT INTO people (name, email, departments_id, age, gender)
VALUES
    ('今岡稜', 'ryoimaoka@gizumo.jp', 1, 25, 1),
    ('高橋美咲', 'takahashimisaki@gizumo.jp', 1, 28, 2),
    ('渡辺亮', 'watanaberyo@gizumo.jp',2, 35, 1),
    ('森田陽子', 'moritayouko@gizumo.jp',3, 40, 2);

UPDATE people SET department_id = 1 WHERE person_id IN (1,2,3);
UPDATE people SET department_id = 2 WHERE person_id IN (4,5,6,7);
UPDATE people SET department_id = 3 WHERE person_id = 8;
UPDATE people SET department_id = 4 WHERE person_id = 9;
UPDATE people SET department_id = 5 WHERE person_id = 10;

DELETE FROM reports WHERE report_id = 11;

INSERT INTO reports (report_id, content)
VALUES
    (2, '午後からコードの修正を行いました'),
    (3, 'クライアントに資料を送付しました'),
    (4, 'チームで次のプロジェクトを計画しました'),
    (5, 'メール対応に多くの時間を使いました'),
    (6, 'データベースのテストを実施しました'),
    (7, '今日の業務は順調でした'),
    (8, '会議で新しい案が決まりました'),
    (9, '仕様書のレビューを進めました'),
    (10, '新入社員に業務の説明をしました');

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

-- これは、peopleテーブルの中にあるdepartment_idが1に当てはまるレコードのname、email、ageのデータを表示します。ORDER BY 句は、created_at フィールドを基準に結果を並べ替え、レコードが作成された順番で表示されるようにします。
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


-- URL
https://github.com/rimaoka18/db_lesson_basic/pull/2
