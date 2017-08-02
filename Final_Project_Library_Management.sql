CREATE DATABASE Library_Management_System;
USE Library_Management_System;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		--START PUBLISHER TABLE

CREATE TABLE tbl_PUBLISHER (
	PublisherId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL, 
	[Address] VARCHAR(50) NOT NULL,
	Phone VARCHAR (50) NOT NULL
); 
INSERT INTO tbl_PUBLISHER
		(Name, [Address], Phone)
		VALUES 
		('Random House Inc', 'Seattle, WA', '206-000-0001'),
		('Business 21 Publishing LLC','Seattle, WA','206-000-0002'),
		('Rodale Inc','Seattle, WA','206-000-0003'),
		('Meredith Corp','Seattle, WA','206-000-0004'),
		('State University of New York Press','Seattle, WA','206-000-0005'),
		('Consumers Union','Seattle, WA','206-000-0006'),
		('Oxford University Press USA','Seattle, WA','206-000-0007'),
		('BowTie Inc./BowTie Press','Seattle, WA','206-000-0008'),
		('Pearson/Pearson Education','Seattle, WA','206-000-0009'),
		('Columbia University Press','Seattle, WA','206-000-0010'),
		('Lerner Publishing Group','Seattle, WA','206-000-0011'),
		('Prestwick House Inc','Seattle, WA','206-000-0012'),
		('The University of Chicago Press','Seattle, WA','206-000-0013'),
		('John Wiley & Sons Inc','Seattle, WA','206-000-0014'),
		('The Jewish Publication Society','Seattle, WA','206-000-0015'),
		('Reed Business Information','Seattle, WA','206-000-0016'),
		('Scholastic Inc','Seattle, WA','206-000-0017'),
		('The Taunton Press','Seattle, WA','206-000-0018'),
		('Meister Media Worldwide','Seattle, WA','206-000-0019'),
		('F.A. Davis Co','Seattle, WA','206-000-0020')
;
Select * from tbl_PUBLISHER;

		--END PUBLISHER TABLE

		--START BOOK TABLE

CREATE TABLE tbl_BOOK (
	BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName INT NOT NULL CONSTRAINT fk_PublisherId FOREIGN KEY REFERENCES tbl_PUBLISHER(PublisherId) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO tbl_BOOK
		(Title, PublisherName)
		VALUES 
		('The Green Mile',1),
		('In Search of Lost Time',2),
		('Ulysses',3),
		('The Odyssey',4),
		('War and Peace',5),
		('Moby Dick',6),
		('The Divine Comedy',7),
		('Hamlet',8),
		('The Adventures of Huckleberry Finn',9),
		('The Great Gatsby',10),
		('The Iliad',11),
		('One Hundred Years of Solitude',12),
		('Madame Bovary',13),
		('Crime and Punishment',14),
		('The Brothers Karamazov',15),
		('Pride and Prejudice',16),
		('Wuthering Heights',17),
		('The Sound and the Fury',18),
		('Lolita',19),
		('The Lost Tribe',20)
;
select * FROM tbl_BOOK;
		--END BOOK TABLE

		--START BOOK_AUTHORS
CREATE TABLE tbl_BOOK_AUTHORS (
	BookId INT NOT NULL PRIMARY KEY CONSTRAINT fk_BookId FOREIGN KEY REFERENCES tbl_BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO tbl_BOOK_AUTHORS
		(BookId,AuthorName)
		VALUES 
		(1,'Stephen King'),
		(2,'Marcel Proust'),
		(3,'James Joyce'),
		(4,'Homer'),
		(5,'Leo Tolstoy'),
		(6,'Herman Melville'),
		(7,'Dante Alighieri'),
		(8,'William Shakespeare'),
		(9,'Mark Twain'),
		(10,'F. Scott Fitzgerald'),
		(11,'Homer'),
		(12,'Gabriel Garcia Marquez'),
		(13,'Gustave Flaubert'),
		(14,'Fyodor Dostoyevsky'),
		(15,'Fyodor Dostoyevsky'),
		(16,'Jane Austen'),
		(17,'Emily Brontë'),
		(18,'William Faulkner'),
		(19,'Vladimir Nabokov'),
		(20,'Mark Lee')
;
select * from tbl_BOOK_AUTHORS;

		--END BOOK_AUTHORS

		--START LIBRARY_BRANCH

CREATE TABLE tbl_LIBRARY_BRANCH (
	BranchId INT PRIMARY KEY NOT NULL,
	BranchName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL
);

INSERT INTO tbl_LIBRARY_BRANCH
		(BranchId, BranchName, [Address])
		VALUES
		(100,'Sharpstown','Winstone Salem, NC'),
		(200,'Central','New York, NY'),
		(300,'West LA','Los Angeles, CA'),
		(400,'Downtown Seattle','Seattle, WA')
;

select * from tbl_LIBRARY_BRANCH;

		--END LIBRARY_BRANCH

		--START BORROWERS

CREATE TABLE tbl_BORROWER (
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL, 
	Phone VARCHAR(50) NOT NULL
);
INSERT INTO tbl_BORROWER
		(CardNo, Name, [Address], Phone)
		VALUES
		(10001,'James Smith','Winstone Salem, NC','271-250-7778'),
		(10002,'Michael Smith','Winstone Salem, NC','271-250-0989'),
		(20001,'Maria Garcia','New York, NY','917-000-3245'),
		(20002,'Sue Rodriguez','New York, NY','917-126-8167'),
		(30001,'Tim Johnson','Los Angeles, CA','310-816-9317'),
		(30002,'Bob Gormley','Los Angeles, CA','310-324-0173'),
		(40001,'Chase Mitchel','Seattle, WA','206-600-1232'),
		(40002,'Sean Dover','Seattle, WA','206-143-2643')
;
select * from tbl_BORROWER;

		--END BORROWERS


		--START BOOK_COPIES


CREATE TABLE tbl_BOOK_COPIES (
	BookId INT NOT NULL PRIMARY KEY CONSTRAINT fk_BookId_2 FOREIGN KEY REFERENCES tbl_BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchId_1 FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
	);

INSERT INTO tbl_BOOK_COPIES
		(BookId, BranchID, No_Of_Copies)
		VALUES
		(1,100,2),
		(2,100,2),
		(3,100,2),
		(4,100,2),
		(5,100,2),
		(6,100,2),
		(7,100,2),
		(8,100,2),
		(9,100,2),
		(10,100,2),
		(20,100,2),
		(1,200,2),
		(2,200,2),
		(3,200,2),
		(4,200,2),
		(5,200,2),
		(6,200,2),
		(7,200,2),
		(8,200,2),
		(9,200,2),
		(10,200,2),
		(20,200,2),
		(11,300,2),
		(12,300,2),
		(13,300,2),
		(14,300,2),
		(15,300,2),
		(16,300,2),
		(17,300,2),
		(18,300,2),
		(19,300,2),
		(20,300,2),
		(11,400,2),
		(12,400,2),
		(13,400,2),
		(14,400,2),
		(15,400,2),
		(16,400,2),
		(17,400,2),
		(18,400,2),
		(19,400,2),
		(10,300,2)
;
select * from tbl_BOOK_COPIES;

		--END BOOK_COPIES

		--START BOOK_LOANS
		

CREATE TABLE tbl_BOOK_LOANS (
	BookId INT NOT NULL CONSTRAINT fk_BookId_1 FOREIGN KEY REFERENCES tbl_BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchId_2 FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE, 
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

INSERT INTO tbl_BOOK_LOANS
		(BookId, BranchID, CardNo, DateOut, DueDate)
		VALUES
		(1,100,10001,'05-10-2017','10-30-2017'),
		(2,100,10001,'05-10-2017','10-30-2017'),
		(3,100,10001,'05-10-2017','10-30-2017'),
		(4,100,10001,'05-10-2017',GETDATE()),
		(5,100,10001,'05-10-2017',GETDATE()),
		(6,100,10001,'05-10-2017','10-30-2017'),
		(7,100,10001,'05-10-2017','10-30-2017'),
		(8,100,10001,'05-10-2017','10-30-2017'),
		(9,100,10001,'05-10-2017','10-30-2017'),
		(10,100,10001,'05-10-2017','10-30-2017'),
		(20,100,10001,'05-10-2017','10-30-2017'),
		(1,100,10002,'05-10-2017','10-30-2017'),
		(2,100,10002,'05-10-2017','10-30-2017'),
		(3,100,10002,'05-10-2017','10-30-2017'),
		(4,100,10002,'05-10-2017',GETDATE()),
		(5,100,10002,'05-10-2017',GETDATE()),
		(6,100,10002,'05-10-2017','10-30-2017'),
		(7,100,10002,'05-10-2017','10-30-2017'),
		(8,100,10002,'05-10-2017','10-30-2017'),
		(9,100,10002,'05-10-2017','10-30-2017'),
		(10,100,10002,'05-10-2017','10-30-2017'),
		(20,100,10002,'05-10-2017','10-30-2017'),
		(1,200,20001,'05-10-2017','10-30-2017'),
		(2,200,20001,'05-10-2017','10-30-2017'),
		(3,200,20001,'05-10-2017','10-30-2017'),
		(4,200,20001,'05-10-2017',GETDATE()),
		(5,200,20001,'05-10-2017',GETDATE()),
		(6,200,20001,'05-10-2017','10-30-2017'),
		(5,200,20002,'05-10-2017','10-30-2017'),
		(6,200,20002,'05-10-2017','10-30-2017'),
		(7,200,20002,'05-10-2017','10-30-2017'),
		(8,200,20002,'05-10-2017',GETDATE()),
		(9,200,20002,'05-10-2017',GETDATE()),
		(10,200,20002,'05-10-2017','10-30-2017'),
		(11,300,30001,'05-10-2017','10-30-2017'),
		(12,300,30001,'05-10-2017','10-30-2017'),
		(13,300,30001,'05-10-2017','10-30-2017'),
		(14,300,30001,'05-10-2017','10-30-2017'),
		(15,300,30002,'05-10-2017','10-30-2017'),
		(16,300,30002,'05-10-2017','10-30-2017'),
		(17,300,30002,'05-10-2017','10-30-2017'),
		(18,300,30002,'05-10-2017','10-30-2017'),
		(11,400,40001,'05-10-2017','10-30-2017'),
		(12,400,40001,'05-10-2017','10-30-2017'),
		(13,400,40001,'05-10-2017','10-30-2017'),
		(14,400,40001,'05-10-2017','10-30-2017'),
		(15,400,40001,'05-10-2017','10-30-2017'),
		(16,400,40001,'05-10-2017','10-30-2017'),
		(17,400,40001,'05-10-2017','10-30-2017'),
		(18,400,40001,'05-10-2017','10-30-2017')
;
select * from tbl_BOOK_LOANS;

		--END BOOK_LOANS
		

		--No 1
GO
CREATE PROCEDURE dbo.spTheLostTribe_in_Sharpstown
AS
SELECT tbl_BOOK.Title AS 'Title', tbl_LIBRARY_BRANCH.BranchName AS 'Branch', tbl_BOOK_COPIES.No_of_copies AS 'Number of copies'  
FROM tbl_BOOK_COPIES INNER JOIN tbl_LIBRARY_BRANCH 
ON tbl_LIBRARY_BRANCH.BranchId = tbl_BOOK_COPIES.BranchID
INNER JOIN tbl_BOOK
ON tbl_BOOK_COPIES.BookId = tbl_BOOK.BookId
WHERE tbl_BOOK.Title = 'The Lost Tribe'  and tbl_LIBRARY_BRANCH.BranchName = 'Sharpstown'
GO

		--No 2
GO
CREATE PROCEDURE dbo.spNoOfCopies_TheLostTribe
AS
SELECT tbl_BOOK.Title AS 'Title', tbl_LIBRARY_BRANCH.BranchName AS 'Branch', tbl_BOOK_COPIES.No_of_copies AS 'Number of copies'  
FROM tbl_BOOK_COPIES INNER JOIN tbl_LIBRARY_BRANCH 
ON tbl_BOOK_COPIES.BranchID = tbl_LIBRARY_BRANCH.BranchId
INNER JOIN tbl_BOOK
ON tbl_BOOK_COPIES.BookId = tbl_BOOK.BookId
WHERE tbl_BOOK.title = 'The Lost Tribe'  
Go

		--No3
GO
CREATE PROCEDURE dbo.spBorrowers_with_no_books
AS
SELECT tbl_BORROWER.Name
FROM tbl_BORROWER 
WHERE NOT EXISTS ( SELECT *
FROM tbl_BOOK_LOANS 
WHERE tbl_BORROWER.CardNo = tbl_BOOK_LOANS.CardNo )
GO
		--No4
GO
CREATE PROCEDURE dbo.spDueToday_at_Sharpstown
AS
DECLARE @today AS DATE
SET @today = GETDATE() 
SELECT tbl_BOOK.Title, tbl_BORROWER.Name, tbl_BORROWER.[Address]
FROM tbl_BOOK, tbl_BORROWER, tbl_BOOK_LOANS, tbl_LIBRARY_BRANCH
WHERE tbl_LIBRARY_BRANCH.BranchName = 'Sharpstown' AND tbl_LIBRARY_BRANCH.BranchId = tbl_BOOK_LOANS.BranchId AND
tbl_BOOK_LOANS.DueDate = @today AND tbl_BOOK_LOANS.CardNo=tbl_BORROWER.CardNo AND tbl_BOOK_LOANS.BookId=tbl_BOOK.BookId
GO
		--No5

GO
CREATE PROCEDURE dbo.spTotal#ofbooksloaned
AS
SELECT tbl_LIBRARY_BRANCH.BranchName, COUNT(*) AS 'Total# of Books Loaned Out'
FROM tbl_BOOK_COPIES, tbl_LIBRARY_BRANCH 
WHERE tbl_BOOK_COPIES.BranchId = tbl_LIBRARY_BRANCH.BranchId
GROUP BY tbl_LIBRARY_BRANCH.BranchName
GO
		--No6
GO
CREATE PROCEDURE dbo.spborrowers_morethan5books
AS
SELECT tbl_BORROWER.Name, tbl_BORROWER.[Address], COUNT(*) AS 'Total# of Books Checked Out'
FROM tbl_BORROWER, tbl_BOOK_LOANS
WHERE tbl_BORROWER.CardNo = tbl_BOOK_LOANS.CardNo
GROUP BY tbl_BORROWER.Name, tbl_BORROWER.[Address]
HAVING COUNT(*) > 5
GO	

		--No7
GO
CREATE PROCEDURE dbo.sp#ofStephenKingBook_in_Central
AS
SELECT tbl_BOOK.Title AS 'Title', tbl_LIBRARY_BRANCH.BranchName AS 'Branch', tbl_BOOK_COPIES.No_of_copies AS 'Number of copies'
FROM tbl_BOOK_COPIES INNER JOIN tbl_LIBRARY_BRANCH 
ON tbl_LIBRARY_BRANCH.BranchId = tbl_BOOK_COPIES.BranchID 
INNER JOIN tbl_BOOK
ON tbl_BOOK_COPIES.BookId = tbl_BOOK.BookId
INNER JOIN tbl_BOOK_AUTHORS
ON tbl_BOOK_AUTHORS.BookId=tbl_BOOK.BookId
WHERE tbl_LIBRARY_BRANCH.BranchName = 'Central' AND tbl_BOOK_AUTHORS.AuthorName = 'Stephen King'
GO

