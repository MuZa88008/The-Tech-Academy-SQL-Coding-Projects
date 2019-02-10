USE [db_library_mgmt_zach_murray]

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (2001,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL
	);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(20)
	);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (3001,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(100) FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
	);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (4001,1),
	Name VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(20)
	);

CREATE TABLE BOOK_AUTHORS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	AuthorName VARCHAR(100) NOT NULL
	);

	

CREATE TABLE BOOK_COPIES (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	Number_Of_Copies INT NOT NULL
	);


CREATE TABLE BOOK_LOANS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	CardNo INT FOREIGN KEY REFERENCES BORROWER(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL,
	);

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Central', '123 Central Street'),
	('Sharpstown', '6200 Hermann Park Dr.'),
	('New York', '2300 Southern Blvd, Bronx, NY'),
	('Chicago', '2001 N Clark St, Chicago, IL '),
	('Las Vegas', '3600 S Las Vegas Blvd, Las Vegas, NV'),
	('Los Angelas', '1000 Vin Scully Ave, Los Angeles, CA')
	;

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('Pan Macmillan Grp','175 5th Ave, New York, NY 10010','1 800-221-7945'),
	('Transworld Grp','20 Vauxhall Bridge Road London, SW1V 2SA','+44 (0)20 7840 8400'),
	('Bloomsbury Grp','50 Bedford Square, London, WC1B 3DP','+44 (0)20 7631 5600'),
	('Little, Brown Book Grp','50 Victoria Embankment, London, EC4Y 0DZ','+44 (0)20 3122 7000'),
	('Random House Grp','1745 Broadway, New York, NY 10010','1-800-733-3000.'),
	('Quercus Grp','50 Victoria Embankment, London, EC4Y 0DZ','+44 (0) 20 3122 6000'),
	('Penguin Grp','27 Wrights Lane, London W8 5TZ','1-800-733-3000.'),
	('Orion Grp','50 Victoria Embankment, London, EC4Y 0DZ','020 3122 6444'),
	('HarperCollins Grp','195 Broadway, New York, NY 10007','1-800-242-7737'),
	('Headline Grp','50 Victoria Embankment, London, EC4Y 0DZ','+44 20 3122 7222'),
	('Picador US','3 Holford Yard, Bevin Way, London WC1X 9HD','+44 (0)20 7841 6300'),
	('Simon & Schuster','1230 Avenue of the Americas, New York, NY 10020','212-698-7000')
	;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Picador US'),
	('Da Vinci Code,The', 'Transworld Grp'),
	('Harry Potter and the Philosophers Stone', 'Bloomsbury Grp'),
	('Twilight', 'Little, Brown Book Grp'),
	('Lovely Bones,The', 'Pan Macmillan Grp'),
	('Curious Incident of the Dog in the Night-time,The#', 'Random House Grp'),
	('Girl with the Dragon Tattoo,The:Millennium Trilogy#', 'Quercus Grp'),
	('Kite Runner,The', 'Bloomsbury Grp'),
	('Time Travelers Wife,The', 'Random House Grp'),
	('World According to Clarkson,The', 'Penguin Grp'),
	('Atonement', 'Random House Grp'),
	('Short History of Nearly Everything,A', 'Transworld Grp'),
	('Child Called It,A', 'Orion Grp'),
	('No.1 Ladies Detective Agency,The', 'Little, Brown Book Grp'),
	('You are What You Eat', 'Penguin Grp'),
	('Man and Boy', 'HarperCollins Grp'),
	('Birdsong', 'Random House Grp'),
	('Labyrinth', 'Orion Grp'),
	('Island,The', 'Headline Grp'),
	('The Shining', 'Simon & Schuster'),
	('IT', 'Simon & Schuster')
	;

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('Keeley Iles','2226 Layman Court','(203) 687-3536'),
	('Nell Finney','4232 Renwick Drive','(775) 363-3092'),
	('Jarrod Carter','2243 West Street','(652) 544-9750'),
	('Sonya Rojas','3483 Elliott Street','(358) 934-0763'),
	('Rueben Goff','1269 Timber Ridge Road','(698) 951-0890'),
	('Sania Mcmanus','2296 Franklin Street','(867) 487-9728'),
	('Zakariyah Baldwin','239 Hart Street','(685) 246-3358'),
	('Johnathan Huff','1562 Aviation Way','(430) 532-6406'),
	('Kaia Emerson','4412 Broadway Street','(566) 494-2138'),
	('Ahsan Sellers','4676 Lords Way','(312) 903-3033'),
	('Hallie Ridley','3654 Langtown Road','(806) 341-7207'),
	('Clement Martin','2757 Lynn Ogden Lane','(772) 788-6476'),
	('Monika Parker','3197 Medical Center Drive','(458) 477-8328'),
	('Ayse Hines','243 Tuna Street','(374) 800-5711')
	;
	
INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(3001, 'Lee, Mark'),
	(3002, 'Brown, Dan'),
	(3003, 'Rowling, J. K.'),
	(3004, 'Meyer, Stephenie'),
	(3005, 'Sebold, Alice'),
	(3006, 'Haddon, Mark'),
	(3007, 'Larsson, Stieg'),
	(3008, 'Hosseini, Khaled'),
	(3009, 'Niffenegger, Audrey'),
	(3010, 'Clarkson, Jeremy'),
	(3011, 'McEwan, Ian'),
	(3012, 'Bryson, Bill'),
	(3013, 'Pelzer, Dave'),
	(3014, 'McCall Smith, Alexander'),
	(3015, 'McKeith, Gillian'),
	(3016, 'Parsons, Tony'),
	(3017, 'Faulks, Sebastian'),
	(3018, 'Mosse, Kate'),
	(3019, 'Hislop, Victoria'),
	(3020, 'King, Stephen'),
	(3021, 'King, Stephen')
	;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(3001,2001,6),
	(3002,2001,10),
	(3003,2001,6),
	(3004,2001,8),
	(3005,2001,5),
	(3006,2001,10),
	(3007,2001,10),
	(3008,2001,6),
	(3009,2001,9),
	(3010,2001,5),
	(3011,2001,6),
	(3012,2001,5),
	(3013,2001,5),
	(3014,2001,6),
	(3015,2001,8),
	(3016,2001,9),
	(3017,2001,5),
	(3018,2001,8),
	(3019,2001,6),
	(3020,2001,5),
	(3021,2001,6),
	(3001,2002,9),
	(3002,2002,10),
	(3003,2002,6),
	(3004,2002,6),
	(3005,2002,6),
	(3006,2002,8),
	(3007,2002,10),
	(3008,2002,6),
	(3009,2002,8),
	(3010,2002,9),
	(3011,2002,7),
	(3012,2002,6),
	(3013,2002,8),
	(3014,2002,10),
	(3015,2002,7),
	(3016,2002,6),
	(3017,2002,9),
	(3018,2002,10),
	(3019,2002,5),
	(3020,2002,7),
	(3021,2002,10),
	(3001,2003,5),
	(3002,2003,5),
	(3003,2003,9),
	(3004,2003,8),
	(3005,2003,9),
	(3006,2003,10),
	(3007,2003,9),
	(3008,2003,7),
	(3009,2003,8),
	(3010,2003,9),
	(3011,2003,5),
	(3012,2003,9),
	(3013,2003,6),
	(3014,2003,9),
	(3015,2003,5),
	(3016,2003,9),
	(3017,2003,9),
	(3018,2003,7),
	(3019,2003,7),
	(3020,2003,9),
	(3021,2003,8),
	(3001,2004,7),
	(3002,2004,8),
	(3003,2004,7),
	(3004,2004,10),
	(3005,2004,6),
	(3006,2004,9),
	(3007,2004,10),
	(3008,2004,8),
	(3009,2004,6),
	(3010,2004,10),
	(3011,2004,5),
	(3012,2004,10),
	(3013,2004,6),
	(3014,2004,6),
	(3015,2004,7),
	(3016,2004,10),
	(3017,2004,10),
	(3018,2004,10),
	(3019,2004,10),
	(3020,2004,7),
	(3021,2004,6),
	(3001,2005,10),
	(3002,2005,5),
	(3003,2005,6),
	(3004,2005,9),
	(3005,2005,6),
	(3006,2005,9),
	(3007,2005,6),
	(3008,2005,6),
	(3009,2005,7),
	(3010,2005,8),
	(3011,2005,7),
	(3012,2005,7),
	(3013,2005,6),
	(3014,2005,10),
	(3015,2005,8),
	(3016,2005,9),
	(3017,2005,8),
	(3018,2005,7),
	(3019,2005,10),
	(3020,2005,5),
	(3021,2005,6),
	(3001,2006,10),
	(3002,2006,7),
	(3003,2006,10),
	(3004,2006,10),
	(3005,2006,7),
	(3006,2006,6),
	(3007,2006,6),
	(3008,2006,5),
	(3009,2006,8),
	(3010,2006,7),
	(3011,2006,5),
	(3012,2006,9),
	(3013,2006,9),
	(3014,2006,7),
	(3015,2006,7),
	(3016,2006,5),
	(3017,2006,6),
	(3018,2006,8),
	(3019,2006,7),
	(3020,2006,6),
	(3021,2006,5)
	;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(3003, 2001, 4003,  '2019-02-01', '2019-02-15'),
	(3004, 2003, 4006,  '2019-01-05', '2019-01-19'),
	(3005, 2001, 4013,  '2019-01-21', '2019-02-04'),
	(3009, 2003, 4004,  '2019-01-05', '2019-01-19'),
	(3008, 2006, 4006,  '2019-01-10', '2019-01-24'),
	(3015, 2001, 4003,  '2019-01-07', '2019-01-21'),
	(3016, 2002, 4004,  '2019-02-03', '2019-02-17'),
	(3017, 2006, 4001,  '2019-01-26', '2019-02-09'),
	(3016, 2001, 4012,  '2019-01-04', '2019-01-18'),
	(3016, 2003, 4009,  '2019-01-27', '2019-02-10'),
	(3006, 2004, 4007,  '2019-01-28', '2019-02-11'),
	(3009, 2004, 4006,  '2019-02-01', '2019-02-15'),
	(3005, 2004, 4010,  '2019-01-31', '2019-02-14'),
	(3019, 2006, 4014,  '2019-01-18', '2019-02-01'),
	(3011, 2005, 4008,  '2019-01-03', '2019-01-17'),
	(3013, 2001, 4003,  '2019-02-04', '2019-02-18'),
	(3008, 2003, 4013,  '2019-01-04', '2019-01-18'),
	(3005, 2002, 4007,  '2019-01-11', '2019-01-25'),
	(3012, 2002, 4009,  '2019-01-12', '2019-01-26'),
	(3016, 2005, 4011,  '2019-01-21', '2019-02-04'),
	(3013, 2003, 4001,  '2019-01-08', '2019-01-22'),
	(3011, 2002, 4003,  '2019-02-03', '2019-02-17'),
	(3001, 2003, 4005,  '2019-01-27', '2019-02-10'),
	(3003, 2002, 4006,  '2019-01-27', '2019-02-10'),
	(3003, 2004, 4006,  '2019-01-26', '2019-02-09'),
	(3001, 2002, 4003,  '2019-01-31', '2019-02-14'),
	(3014, 2002, 4014,  '2019-01-22', '2019-02-05'),
	(3006, 2002, 4008,  '2019-01-23', '2019-02-06'),
	(3012, 2001, 4005,  '2019-01-10', '2019-01-24'),
	(3007, 2004, 4013,  '2019-02-09', '2019-02-23'),
	(3012, 2003, 4007,  '2019-01-26', '2019-02-09'),
	(3017, 2002, 4005,  '2019-01-21', '2019-02-04'),
	(3019, 2004, 4005,  '2019-01-10', '2019-01-24'),
	(3005, 2001, 4006,  '2019-01-31', '2019-02-14'),
	(3016, 2001, 4002,  '2019-02-09', '2019-02-23'),
	(3010, 2004, 4012,  '2019-01-10', '2019-01-24'),
	(3016, 2003, 4005,  '2019-01-07', '2019-01-21'),
	(3005, 2005, 4004,  '2019-01-16', '2019-01-30'),
	(3018, 2006, 4011,  '2019-02-05', '2019-02-19'),
	(3013, 2004, 4004,  '2019-01-21', '2019-02-04'),
	(3019, 2001, 4009,  '2019-01-25', '2019-02-08'),
	(3018, 2002, 4002,  '2019-01-26', '2019-02-09'),
	(3009, 2001, 4005,  '2019-01-03', '2019-01-17'),
	(3002, 2002, 4009,  '2019-01-14', '2019-01-28'),
	(3019, 2002, 4010,  '2019-01-29', '2019-02-12'),
	(3004, 2006, 4006,  '2019-01-27', '2019-02-10'),
	(3004, 2002, 4004,  '2019-01-14', '2019-01-28'),
	(3012, 2006, 4011,  '2019-01-20', '2019-02-03'),
	(3006, 2002, 4008,  '2019-01-02', '2019-01-16'),
	(3005, 2004, 4005,  '2019-02-04', '2019-02-18')
	;
	
/*
CREATE STORED PROCEDURES THAT WILL QUERY FOR EACH OF THE FOLLOWING QUESTIONS:

1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
*/

/* Getting erroro message on below...

Msg 245, Level 16, State 1, Line 342
Conversion failed when converting the varchar value 'Sharpstown' to data type int.

*/


SELECT Title, BranchName, Number_Of_Copies FROM BOOK_COPIES
	INNER JOIN	BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
	INNER JOIN LIBRARY_BRANCH on BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchName
	WHERE BranchName LIKE 'Sharpstown' AND Title = 'The Lost Tribe'






/*


Below for notes/reference only..

SELECT * FROM BOOK_COPIES


SELECT AddressLine1, City, StateProvinceCode, CountryRegionCode FROM [Person].[Address] 
	INNER JOIN [Person].[StateProvince] ON [Person].[Address].StateProvinceID = [Person].[StateProvince].StateProvinceID
	WHERE City LIKE '%' + @CityVar + '%' 



SELECT specialist_fname, specialist_lname, specialist_contact FROM tbl_specialist
	INNER JOIN tbl_care on tbl_specialist.specialist_id = tbl_care.care_specialist
	INNER JOIN tbl_species on tbl_care.care_id = tbl_species.species_care
	WHERE species_name = 'penguin' 

SELECT CAST (Number_Of_Copies AS VARCHAR), BranchName FROM LIBRARY_BRANCH
	INNER JOIN BOOK_COPIES ON LIBRARY_BRANCH.BranchName = BOOK_COPIES.Number_Of_Copies
	WHERE BranchName Like '%' + 'Sharpstown' + '%'


SELECT CONVERT (DATE, SYSDATETIME())


