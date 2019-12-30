package com.cs336.pkg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connector {
	
	public boolean isconnected() {
	try {
	String connectionUrl = "jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	
	Connection connection = null;
	connection = DriverManager.getConnection(connectionUrl,"antmatos21", "!1Antmat");
	System.out.println("Connected?");
	connection.close();
	return true;
	}catch(Exception e) {
		System.out.println(e);
		return false;
	}
	}

}

