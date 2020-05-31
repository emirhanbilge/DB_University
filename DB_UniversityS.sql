
----------------------------------------------------------------- CREATING TABLES ----------------------------------------------------------------- 

Create table University(
"universityID" integer NOT NULL,
"universityName" varchar(150) NOT NULL,
"universityAddress" varchar(120) NOT NULL,
"universityMail" varchar(70) ,
"universityCity" varchar(30) ,
"universityType" varchar(10) NOT NULL DEFAULT('state'),
"universityFoundDate" smallint,  --Because data is small , I don't need all the time information, it just makes sense to get the year and enough
CONSTRAINT "universityID" PRIMARY KEY("universityID")
);

--Used 'varchar' type because it is dynamic memory . The database system automatically reduces this only to the area it needs to cover.
--IDs must be Primary , if they do not have different ids, there is crosstalk and the system is faulty

Create table Faculty(
"facultyID" integer NOT NULL,
"facultyName" varchar(45) NOT NULL,  --no anonymous faculty
"facultyMail" varchar(70) ,
"uniID" integer NOT NULL,
CONSTRAINT "FKEY_University" FOREIGN KEY("uniID")
REFERENCES University("universityID") match simple 
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "UNIQUE_ID" UNIQUE("facultyID")
);


--Used 'varchar' type because it is dynamic memory . The database system automatically reduces this only to the area it needs to cover.
--IDs must be Primary , if they do not have different ids, there is crosstalk and the system is faulty
--Used University Id because Can not be a faculty not connected to the university

Create table Department(

"departmentID" integer NOT NULL,
"departmentName" varchar(40) NOT NULL,
"departmentMail" varchar(70) ,
"departmentLanguage" varchar(12) NOT NULL DEFAULT('Turkish'),
"educationType" varchar(2) NOT NULL DEFAULT('öö'),
"quota" smallint ,  -- quota is small number
"topRank" integer,
"period" smallint, --period is small number
"minScore" float,
"minOrder" integer,
"facID" integer NOT NULL,
"uniID" integer NOT NULL,

CONSTRAINT "facID" FOREIGN KEY("facID")
REFERENCES Faculty("facultyID") match simple 
ON UPDATE CASCADE ON DELETE CASCADE,

CONSTRAINT "uniID" FOREIGN KEY("uniID")
REFERENCES University("universityID") match simple 
ON UPDATE CASCADE ON DELETE CASCADE,

CONSTRAINT "UNIQUE_ID_DEPARTMENT" UNIQUE("departmentID")


);

--A department must be connected to a faculty and university.I used 'uniID' and 'facID' 
--The reason why some attributes are not 'Not Null' is because they may be the newly opened department.
--Used 'varchar' type because it is dynamic memory . The database system automatically reduces this only to the area it needs to cover.
--IDs must be Primary , if they do not have different ids, there is crosstalk and the system is faulty

--!!! Notice: Although I use 'primary key' in the University table, the reason I use 'unique' in other 
--tables is because the 'primary keys' do not accept 'Not Null'. The preferences is more usable to use 'unique' because of the match 
--operation -'Match' operations controlls and returns correct or not . Thus, without making direct space in the memory, such as primary key - , 
--otherwise I think it will make a swelling in the storage area even if it is 'Not Null'.


Create table Student (

"studentID" integer NOT NULL,
"studentName" varchar(20) NOT NULL,
"studentSurname" varchar(20) NOT NULL,
"studentScore" float NOT NULL,
"studentRank" integer NOT NULL,
"studentPosition" varchar(3) NOT NULL DEFAULT('not'),  --yes or not

CONSTRAINT "UNIQUE_STUDENT_ID" UNIQUE("studentID") 

);
--No student information can be missing
--Used 'varchar' type because it is dynamic memory . The database system automatically reduces this only to the area it needs to cover.

Create table Preferences(

"preference1" integer NOT NULL,
"preference2" integer ,
"preference3" integer ,
"studentID" integer NOT NULL,
CONSTRAINT "FKEY_StudentID" FOREIGN KEY("studentID")
REFERENCES Student("studentID") match simple 
ON UPDATE CASCADE ON DELETE CASCADE

);
--not every student has to use 3 right of choice.
--However, if a connection is made to the preference table, it means that at least one choice has been made.
--Otherwise, it cannot be linked with the preference table.


----------------------------------------------------------------- INSERT OPERATIONS ----------------------------------------------------------------- 

-- UNIVERSITY 
insert into University("universityID","universityName","universityAddress","universityMail","universityCity","universityType","universityFoundDate")
values('1','Dokuz Eylül','Buca/Izmir','dokuzeylül@gmail.com','Izmir','state','1985');
insert into University("universityID","universityName","universityAddress","universityMail","universityCity","universityType","universityFoundDate")
values('2','Ege','Bornova/Izmir','ege@gmail.com','Izmir','state','1980');
insert into University("universityID","universityName","universityAddress","universityMail","universityCity","universityType","universityFoundDate")
values('3','Yasar','Bornova/Izmir','yasar@gmail.com','Izmir','private','1998');
insert into University("universityID","universityName","universityAddress","universityMail","universityCity","universityType","universityFoundDate")
values('4','Izmir Ekonomi','Balcova/Izmir','izmirekonomi@gmail.com','Izmir','private','2000');
insert into University("universityID","universityName","universityAddress","universityMail","universityCity","universityType","universityFoundDate")
values('5','Katip Celebi','Cigli/Izmir','Kcelebi@gmail.com','Izmir','state','1999');
insert into University("universityID","universityName","universityAddress","universityMail","universityCity","universityType","universityFoundDate")
values('6','Izmir Technical University','Balcova/Izmir','Izmırtechnic@gmail.com','Izmir','state','2003');
insert into University("universityID","universityName","universityAddress","universityMail","universityCity","universityType","universityFoundDate")
values('7','Izmir University','Balcova/Izmir','Izmır@gmail.com','Izmir','state','2009');

--SELECT * FROM University -- Test Adding

--Faculty

insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('1','Engineering Faculty','engineering@deu.edu.tr','1');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('2','Management Faculty','isletme@deu.edu.tr','1');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('3','Fine Arts','guzelsanatlar@deu.edu.tr','1');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('4','Engineering Faculty','engineering@ege.edu.tr','2');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('5','Management Faculty','isletme@ege.edu.tr','2');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('6','Industrial Design Faculty','engineering@yasar.edu.tr','3');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('7','Management Faculty','isletme@yasar.edu.tr','3');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('8','Industry Faculty','engineering@ekonomi.edu.tr','4');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('9','Law Faculty','isletme@ekonomi.edu.tr','4');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('10','Law Faculty','isletme@kcelebi.edu.tr','5');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('11','Medicine Faculty','medicine@kcelebi.edu.tr','5');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('12','Engineering Faculty','ee@kcelebi.edu.tr','5');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('13','Music Faculty','ee@yasar.edu.tr','3');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('14','Music Faculty','ee@yasar.edu.tr','6');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('15','Engineering Faculty','ee@yasar.edu.tr','6');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('16','Medicine Faculty','ee@yasar.edu.tr','6');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('17','Sport Faculty','ei@ii.edu.tr','7');
insert into Faculty("facultyID","facultyName","facultyMail","uniID")
values('18','Eating Faculty','ei@ii.edu.tr','7');

--Faculty Test SELECT * FROM Faculty 

--INSERT DEPARTMENT

insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('1','Computer Engineering','deuceng@gmail.com','english','iö','90','3','4','423.565','32000','1','1');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('2', 'Environmental Engineering', 'mail2@mail.com', 'english', 'iö', '80', '2', '4', '266.94283', '232000','1','1');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('3', 'Electrical Electronics Engineering', 'mail3@mail.com', 'english', 'öö', '90', '3', '4', '418.0695', '41100', '1', '1');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('4', 'Management', 'mail4@mail.com', 'turkish', 'iö', '120', '2', '4', '166.94283', '468312','2','1');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('5', 'Accounting', 'mail5@mail.com', 'turkish', 'iö', '120', '2', '4', '176.94283', '468312','2','1');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('6', 'Graphic Design', 'mail6@mail.com', 'turkish', 'iö', '90', '2', '4', '183.94283', '568312','3','1');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('7','Energy Systems Engineering', 'mail37@mail.com', 'english', 'öö', '18', '0', '4', '272.2206', '218000', '4', '2');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('8','Industrial Engineering', 'mail60@mail.com', 'english', 'öö', '35', '0', '4', '397.07123', '54100', '4', '2');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('9','Computer Engineering', 'mail79@mail.com', 'İngilizce', 'öö', '70', '2', '5', '447.00268', '25700', '4', '2');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('10','Accounting', 'mail79@mail.com', 'turkish', 'öö', '120', '2', '4', '123.00268', '684689', '5', '2');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('11','Tax Affairs', 'mail79@mail.com', 'turkish', 'öö', '120', '3', '4', '112.00268', '989615', '5', '2');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('12','Industrial Engineering','deuceng@gmail.com','turkish','iö','60','3','4','346.565','46453','6','3');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('13','Industrial Design Engineering','deuceng@gmail.com','turkish','iö','60','3','4','367.565','56846','6','3');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('14','Accounting', 'mail79@mail.com', 'turkish', 'öö', '120', '3', '3', '153.00268', '649565', '7', '3');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('15','Tax Affairs', 'mail79@mail.com', 'turkish', 'öö', '120', '3', '2', '156.00268', '546465', '7', '3');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('16','Industrial Engineering','deuceng@gmail.com','turkish','iö','60','3','4','387.565','978978','8','4');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('17','Industrial Design Engineering','deuceng@gmail.com','turkish','iö','60','3','4','389.565','546456','8','4');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('18','Law','deuceng@gmail.com','turkish','iö','150','3','4','445.565','98200','9','4');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('19','Public Prosecutor','deuceng@gmail.com','turkish','iö','150','3','4','425.565','116000','9','4');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('20','Computer Engineering', 'mail79@mail.com', 'İngilizce', 'öö', '70', '2', '4', '432.00268', '29000', '12', '5');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('21','Medicine', 'mail79@mail.com', 'İngilizce', 'öö', '70', '2', '4', '455.00268', '9000', '11', '5');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('22','Computer Engineering', 'mail79@mail.com', 'İngilizce', 'öö', '70', '2', '6', '400.00268', '53015', '15', '6');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('23','Nurse', 'mail79@mail.com', 'İngilizce', 'öö', '70', '2', '4', '400.00268', '53015', '16', '6');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('24','Medicine', 'mail79@mail.com', 'İngilizce', 'öö', '70', '2', '6', '486.00268', '5000', '16', '6');
insert into Department("departmentID","departmentName","departmentMail","departmentLanguage","educationType","quota","topRank","period","minScore","minOrder","facID","uniID")
values('25','Baker', 'mail79@mail.com', 'İngilizce', 'öö', '70', '2', '4', '200.00268', '500987', '18', '7');

--Test Departments SELECT * FROM Department

--INSERT STUDENT

insert into Student ("studentID","studentName","studentSurname","studentScore","studentRank","studentPosition")
values('1','st1','st1','389.645','152312','');
insert into Student ("studentID","studentName","studentSurname","studentScore","studentRank","studentPosition")
values('2','st2','st2','403.645','168312','');
insert into Student ("studentID","studentName","studentSurname","studentScore","studentRank","studentPosition")
values('3','st3','st3','246.645','995321','');
insert into Student ("studentID","studentName","studentSurname","studentScore","studentRank","studentPosition")
values('4','st4','st4','146.645','1995321','');
insert into Student ("studentID","studentName","studentSurname","studentScore","studentRank","studentPosition")
values('5','st5','st5','446.645','12005','');
insert into Student ("studentID","studentName","studentSurname","studentScore","studentRank","studentPosition")
values('6','st6','st6','400.645','18005','');
insert into Student ("studentID","studentName","studentSurname","studentScore","studentRank","studentPosition")
values('7','st7','st7','337.645','256405','');

--Test Student SELECT * FROM Student

--INSERT PREFERENCE

insert into Preferences("preference1","preference2","preference3","studentID")
values('1','10','9','1');
insert into Preferences("preference1","preference2","preference3","studentID")
values('18','8','7','2');
insert into Preferences("preference1","preference2","preference3","studentID")
values('20','4','3','3');
insert into Preferences("preference1","preference2","preference3","studentID")
values('15','13','17','4');
insert into Preferences("preference1","preference2","preference3","studentID")
values('24','23','1','5');
insert into Preferences("preference1","preference2","preference3","studentID")
values('1','2','3','6');
insert into Preferences("preference1","preference2","preference3","studentID")
values('11','3','19','7');

--Test Preference SELECT * FROM Preferences


----------------------------------------------------------------- Quaries ----------------------------------------------------------------- 


-------------- FIRST QUARY --------------
SELECT * FROM University where "universityName" like 'I%' and ("universityFoundDate" > 1990) 
-----------------------------------------


-------------- SECOND QUARY --------------
SELECT  "universityName" FROM University INNER JOIN Faculty ON Faculty."uniID"=University."universityID" WHERE "facultyName" IN ('Engineering Faculty')
INTERSECT
SELECT "universityName" FROM University INNER JOIN Faculty ON Faculty."uniID"=University."universityID" WHERE "facultyName" IN ('Medicine Faculty')
-----------------------------------------

-------------- THIRD QUARY --------------
SELECT  "universityType" , COUNT("universityType")  FROM University INNER JOIN Faculty ON Faculty."uniID"=University."universityID" GROUP BY University."universityType"
-----------------------------------------

-------------- FOURTH QUARY --------------
SELECT * FROM Department INNER JOIN Faculty ON Department."facID"=Faculty."facultyID" INNER JOIN University ON University."universityID" = Department."uniID" where "departmentName" LIKE '%Engineering%' and "educationType" ='iö'
-----------------------------------------

-------------- FIFTH QUARY --------------
SELECT "minScore", "period"  FROM Department ORDER BY "period" DESC , "minScore" DESC LIMIT 5
-----------------------------------------

-------------- SIXTH QUARY --------------
SELECT "departmentName",COUNT("departmentID") as counter FROM Department INNER JOIN Preferences ON Department."departmentID"=Preferences."preference1" WHERE Department."period"='4' GROUP BY Department."departmentName" 
UNION
SELECT "departmentName",COUNT("departmentID") as counter FROM Department INNER JOIN Preferences ON Department."departmentID"=Preferences."preference2" WHERE Department."period"='4' GROUP BY Department."departmentName" 
UNION
SELECT "departmentName",COUNT("departmentID") as counter FROM Department INNER JOIN Preferences ON Department."departmentID"=Preferences."preference3" WHERE Department."period"='4' GROUP BY Department."departmentName" ORDER BY counter DESC
-----------------------------------------

-------------- SEVENTH QUARY --------------
SELECT * FROM preferences INNER JOIN Department ON Department."departmentID"=Preferences."preference1"  INNER JOIN Student ON Student."studentID"=Preferences."studentID" where Department."departmentName"='Computer Engineering' ORDER BY Student."studentScore" DESC
-----------------------------------------

-------------- EIGHT QUARY --------------
UPDATE Faculty SET "uniID"=(SELECT "universityID" FROM University where University."universityName"='Izmir Technical University')
FROM University 
WHERE Faculty."facultyName"='Engineering Faculty' and Faculty."uniID"=(SELECT "universityID" FROM University where University."universityName"='Dokuz Eylül')
-----------------------------------------

-------------- NINTH QUARY --------------
UPDATE Department SET "period" = "period"+1
WHERE Department."facID"IN (SELECT "facultyID" FROM Faculty where Faculty."facultyName"='Law Faculty')
-----------------------------------------

-------------- 10. QUARY --------------
DELETE FROM Faculty
WHERE Faculty."uniID" IN
(
  SELECT Faculty."uniID"
  FROM  Faculty
    INNER JOIN Department 
    ON   Faculty."facultyID"=Department."facID"
  WHERE  Faculty."uniID" = (SELECT "universityID" FROM University WHERE University."universityName"='Izmir University')
)
-----------------------------------------
