CREATE TABLE User(
    UserID INT IDENTITY PRIMARY KEY,
    UserName NVARCHAR(100) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    Gender VARCHAR(6) CHECK(Gender IN ('Male','Female')),
    DOB DATETIME,
    JoinDate DATE
);
CREATE TABLE Post(
    PostID INT IDENTITY PRIMARY KEY,
    PostDate DATE,
    Content NVARCHAR(300),
    Visiblity VARCHAR(10) CHECK(Visiblity IN ('Public','Private')),
    UserID INT FOREIGN KEY REFERENCES User(UserID) NOT NULL
);
CREATE TABLE Interaction(
    InteractionID INT IDENTITY PRIMARY KEY,
    Type VARCHAR(10),
    InteractionDate DATE,
    PostID INT FOREIGN KEY REFERENCES Post(PostID) NOT NULL,
    UserID INT FOREIGN KEY REFERENCES User(UserID) NOT NULL
);
CREATE TABLE Comment(
    CommentID INT IDENTITY PRIMARY KEY,
    CommentDate DATE,
    Content NVARCHAR(300),
    UserID INT FOREIGN KEY REFERENCES User(UserID) NOT NULL,
    PostID INT FOREIGN KEY REFERENCES Post(PostID) NOT NULL
);
CREATE TABLE Post_Interaction(
    PostID INT FOREIGN KEY REFERENCES Post(PostID),
    UserID INT FOREIGN KEY REFERENCES User(UserID)
);
INSERT INTO User VALUES('hds','ds@ms.nx','Male'),('hd','hi@ms.ms','Female');
INSERT INTO Post VALUES('2005-09-09','hi','Public',1),('2005-09-09','hello','Public',2);
INSERT INTO Interaction VALUES('type1','1930-03-09',1,1),('type2','1930-03-09',1,2);
INSERT INTO Comment VALUES('2009-08-09','helo',1,2),('2009-08-09','helo',2,2);
INSERT INTO Post_Interaction VALUES(1,2),(2,1);