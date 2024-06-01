package org.hospital.config;

import java.sql.*;


public class DBConfig {


			protected Connection conn;
			protected PreparedStatement stmt;
			protected ResultSet rs;
			
			
			public DBConfig()
			{
				try
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital2","root","root");
				}
				catch(Exception ex)
				{
					System.out.println("Eroor is "+ex);
				}
			}



	}


