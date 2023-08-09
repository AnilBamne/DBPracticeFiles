Create table Student(
Id UniqueIdentifier primary key default NewId(),
StudentName varchar(200)
);
Insert Into Student (StudentName) Values('Anil'),('Survesh'),('Ganesh'),('Mahesh');

Select * from Student

--count duplicate names
Select StudentName,Count(*) as occurance from Student group by StudentName Having Count(*)>1;

--CTE
With CTEDEleteDuplicates As (Select StudentName,ROW_NUMBER() over(Partition by StudentName Order by StudentName)
As RowCountStudent from Student)
Delete CTEDEleteDuplicates where RowCountStudent>1

------------------------------
Create table Mentors(
Id Int primary key Identity(1,1),
MentorName varchar(200)
);
select * from Mentors
Insert Into Mentors(MentorName) Values('Priyanshu'),('Madhuri'),('Nagendra'),('Gunjan');

--common table expression
With CTEDEleteDuplicates As (Select MentorName,ROW_NUMBER() over(Partition by MentorName Order by MentorName)
As RowCountStudent from Mentors)
Delete CTEDEleteDuplicates where RowCountStudent>1


