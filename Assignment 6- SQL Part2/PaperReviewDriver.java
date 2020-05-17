import java.sql.*;
import java.util.Scanner;

public class PaperReviewDriver {
	 // JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	   static final String DB_URL = "jdbc:mysql://localhost/paper_reviewers";
	   static String sql;

public static void main(String[] args) {

	   // Database credentials
	   Scanner s = new Scanner(System.in);
	   System.out.println("Enter database username : ");
	   final String USER = s.nextLine();
	   System.out.println("Enter database password : ");
	   final String PASS = s.nextLine();

	   Connection con = null;

	   try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Connecting to database...");
		con = DriverManager.getConnection(DB_URL,USER,PASS);
		System.out.println("Creating statement...");

	    System.out.println("\n1. For getting submitted papers details, please enter Email Address of the Author: ");
	    String emailAddr= s.nextLine();
	    submittedPaper(con, emailAddr);

	    System.out.println("\n2. For getting all reviews for a paper, please enter the ID of the paper : ");
	    String paperId= s.nextLine();
	    review(con,paperId);

	    System.out.println("\n3. Count of all papers submitted: " + listPaperSubmit(con));

	    System.out.println("\n4. For creating new paper to be submitted. Please enter the email address of Author: ");
	    String email= s.nextLine();

	    System.out.println("Enter the first name of Author: ");
	    String fName= s.nextLine();


	    System.out.println("Enter the last name of Author: ");
	    String lName= s.nextLine();

	    System.out.println("Enter the unique id for the paper: ");
	    String paper_id= s.nextLine();

	    System.out.println("Enter the title of Paper: ");
	    String title= s.nextLine();


	    System.out.println("Enter abstract of Paper: ");
	    String paper_abstract= s.nextLine();


	    System.out.println("Enter the filename of Paper: ");
	    String fileName= s.nextLine();

	    newPaper(con, email, fName, lName, paper_id, title, paper_abstract, fileName);

	    System.out.println("\n5. For deleting the record from AUTHOR table, please enter the email address of Author: ");
	    String author_emailaddr= s.nextLine();

	    deleteAuthor(con, author_emailaddr);


	    con.close();
	    s.close();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}

}

public static void submittedPaper(Connection con, String emailAddr) throws SQLException {

	sql = "SELECT Paper.paperId, paper.Title, paper.Abstract, author.EmailAddr, author.FirstName, author.LastName FROM paper_reviewers.paper INNER JOIN paper_reviewers.author ON PAPER.EmailAddr = AUTHOR.EmailAddr WHERE author.emailAddr=?";
	PreparedStatement p = con.prepareStatement(sql);
	p.clearParameters();
	p.setString(1, emailAddr);
	ResultSet rs = p.executeQuery();
	int count=0;
	while(rs.next()){
        count = count + 1;
    	//Retrieve by column name

    	int id = rs.getInt("paperId");
        String email = rs.getString("EmailAddr");
      	String title = rs.getString("title");
      	String paper_abstract = rs.getString("abstract");
      	String fname = rs.getString("FirstName");
      	String lname = rs.getString("LastName");

      	//Display values

        System.out.print("Paper Title: " + title);
        System.out.print(", Paper Id: " + id);
        System.out.print(", Paper abstract: " + paper_abstract);
        System.out.print(", Author Email Address: " + email);
        System.out.print(", Author Firtname: " + fname);
        System.out.println(", Author Lastname: " + lname);

    }
	if (count==0) {
		System.out.println("No paper found with entered email address.");
	}

	rs.close();
	p.close();
}

public static void review(Connection con, String paperId) throws SQLException {

	sql = "SELECT * FROM paper_reviewers.REVIEW  where recommendation=\"published\" and paperId=?";
	PreparedStatement p = con.prepareStatement(sql);
	p.clearParameters();
	p.setString(1, paperId);
	ResultSet rs = p.executeQuery();
	int count=0;
	while(rs.next()){
        count = count + 1;
    	//Retrieve by column name

    	int reviewid = rs.getInt("reviewId");
        String email = rs.getString("EmailAddr");
        int reviewerId = rs.getInt("reviewerId");
        int id = rs.getInt("paperId");
      	String recommendation = rs.getString("recommendation");
      	String meritScore = rs.getString("meritScore");
      	String readabilityScore = rs.getString("readabilityScore");
      	String originalityScore = rs.getString("originalityScore");
      	String relevanceScore = rs.getString("relevanceScore");

      	//Display values

        System.out.print("Review ID: " + reviewid);
        System.out.print(", Author's Email Address : " + email);
        System.out.print(", Reviewer ID: " + reviewerId);
        System.out.print(", Paper ID: " + id);
        System.out.print(", Recommendation: " + recommendation);
        System.out.print(", Merit Score: " + meritScore);
        System.out.print(", Readability Score: " + readabilityScore);
        System.out.print(", Originality Score: " + originalityScore);
        System.out.println(", Relevance Score: " + relevanceScore);

    }
	if (count==0) {
		System.out.println("No reviews present for the entered paper Id.");
	}
   	rs.close();
	p.close();
}

public static int listPaperSubmit(Connection con) throws SQLException {

	sql = "SELECT COUNT(*) AS COUNT FROM Paper_reviewers.paper";
	PreparedStatement p = con.prepareStatement(sql);
	ResultSet rs = p.executeQuery();
	rs.next();

    //Retrieve by column name
    int count = rs.getInt("COUNT");

    rs.close();
	p.close();

    //Return count
    return count;
}

public static void newPaper(Connection con, String emailAddr, String firstName, String lastName, String paper_id, String title, String paper_abstract, String fileName) throws SQLException {

	String sql_author = "INSERT INTO PAPER_REVIEWERS.AUTHOR VALUES(?,?,?)";
	PreparedStatement p = con.prepareStatement(sql_author);

	String sql_paper = "INSERT INTO PAPER_REVIEWERS.PAPER VALUES(?,?,?,?,?)";
	PreparedStatement stmt = con.prepareStatement(sql_paper);
	try {
	p.clearParameters();
	stmt.clearParameters();
	p.setString(1, emailAddr);
	p.setString(2, firstName);
	p.setString(3, lastName);
	p.executeUpdate();

	stmt.setString(1, paper_id);
	stmt.setString(2, emailAddr);
	stmt.setString(3, title);
	stmt.setString(4, paper_abstract);
	stmt.setString(5, fileName);
	stmt.executeUpdate();

	System.out.println("Successfully inserted the entered record into Author and Paper tables respectively");

	} catch(SQLException e) {
		System.out.println("Error in Insert Statement : " + e);
	}
	p.close();
}

public static void deleteAuthor(Connection con, String author_emailaddr) throws SQLException {

	sql = "DELETE FROM PAPER_REVIEWERS.AUTHOR WHERE AUTHOR.EmailAddr=?";
	PreparedStatement p = con.prepareStatement(sql);

	try {
	p.clearParameters();
	p.setString(1, author_emailaddr);
	p.executeUpdate();
	System.out.println("Successfully deleted the record from Author table as 'Delete on cascade' is used in table definition");

	} catch(SQLException e) {
		System.out.println("Error in deleting Statement due to referential integrity: " + e);
	}
	p.close();
}


}
