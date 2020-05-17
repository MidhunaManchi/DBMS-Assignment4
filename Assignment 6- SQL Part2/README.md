# Assignment6_SQL-part2
## From ER Design to Implementation - Paper Review Database-Java Application

### **Project Description:**

The main goal of this project is to create Java application to pull data from specific queries for the Paper Reviews database.
Used JDBC driver for retrieving the data from mysql database.

The .java source files present in the repository consists of the following statements:

1. Loading JDBC loader using class.forName instance to connect to the mysql database,  
2. Prompts user to input mysql username and password,
3. Once the connection is estabilished, the sql queries would be executed using executeQuery() and executeUpdate() funtions.
4. Created below five methods in Java application for each query as follows:
**submittedPaper()** : This method gets a submitted paper’s details by the author’s Primary Key. The query would result following columns Paper.Id, Paper.Title, Paper.Abstract, Author.EmailAddress, Author.FirstName, Author.LastName.
**review()**         : This method gets all reviews for a paper by the paper’s Id, where the paper was recommended to be published.If there are no records that to be published, then prints message ass no records are found. The query would result all the columns from the Review table.
**listPaperSubmit()**: This method gets the counts of all papers that are submitted.
**newPaper()**       : This method creates the new paper for submission, which includes inserting a record in Author as well as Paper table.
**deleteAuthor()**   : This method deleted the record from Author table by primary key i.e., emailAddress. The query would result in deleting the record, as delete on cascade has been used in DDL.

### **Execution instructions:**

**Pre-requistes:**  JDBC driver installation and mapping to Eclipse IDE develpoment environment, and execute the PaperReviewDriver.java program and follow the below steps:

Step 1: When prompted by the program in console, enter your mysql Username and Password.

Step 2: Once connected to the databasse, it would prompt to enter email address of the Author. It would show the data for the entered record.

Step 3: Then it prompts for entering the paperId, to show the result of all papers submitted with recommendation as "Published" . And also the count of all the papers that have been submitted.

Step 4: It prompts few fields to create a new record in Author and Paper tables. Please enter emailaddress, firstName and lastName of Author and paperId, title, abstract and filename to insert into Author and Paper table.
