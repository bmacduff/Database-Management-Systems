

select FName, LName, SSN
from Employee
where Salary = (
select min(Salary)
from Employee 
);


select FName, LName  
from Employee 
where SSN in (
	select ESSN
	from Dependent
	where Relationship = 'SPOUSE'
) and SSN in (
	select ESSN 
	from Dependent
	where Relationship = 'DAUGHTER'
);


select E.FName as FName, E.LName as LName, P.PName as PName
from ( Employee E join Works_On W on E.SSN = W.ESSN)
join Project P on P.PNumber = W.PNo
where E.LName = 'Wong' or E.LName = 'Borg' or E.LName = 'English';


select E.FName as FName, E.LName as LName, E.Salary as Salary, E.SSN as SSN
from Employee E join Department D on E.SSN = D.MGRSSN
where E.Salary > 30000 and E.Sex = 'M';

Select P.PName as PName, P.PNumber as PNumber
from Project P join Works_On W on P.PNumber = W.PNo
where W.ESSN in (
	select SSN
	from Employee
	where LName = 'Narayan'
) and W.ESSN in (
	select SSN 
	from Employee
	where LName = 'Jabbar' 
);


select E.FName as FName, E.LName as LName, timestampdiff(year, D.Bdate, curdate()) as Age
from Employee E join Dependent D on E.SSN = D.ESSN
where D.Bdate > '1970-01-01';


select E.FName as FName, E.LName as LName, P.PName as PName, sum(W.Hours)
from Employee E join Works_On W on E.SSN = W.ESSN join Project P on P.PNumber = W.PNo
where P.PLocation = 'Houston';


select E.FName as EFName, E.LName as EFName, S.FName as SFName, S.LName as SLName
from Employee E left join Employee S on E.SuperSSN = S.SSN;


select P.PName as PName, P.PLocation as PLocation, M.FName as MFName, M.LName as MLName
from Project P join Department D on P.DNum = D.DNumber join Employee M on D.MGRSSN = M.SSN;

select FName, LName
from Employee
where Salary = (
	select max(Salary)
	from Department D join Employee M on D.MGRSSN = M.SSN
);
