package org.hospital.repository;

import java.sql.SQLException;

import org.DocerModel.UserModel;
import org.hospital.config.DBConfig;

public class UserRepositoryImpl extends DBConfig implements UserRepository{

	@Override
	public boolean validateUserCredentials(String username, String password) {
		 try {
	            stmt = conn.prepareStatement("select * from user where username = ? and password = ?");
	            stmt.setString(1, username);
	            stmt.setString(2, password);
	            rs = stmt.executeQuery();
	            return rs.next(); 
	        } catch (SQLException ex) {
	            System.out.println("Error validating admin credentials: " + ex.getMessage());
	            return false;
	        }
	        finally {
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	            } catch (SQLException ex) {
	                System.out.println("Error closing resources: " + ex.getMessage());
	            }
	        }	}

	@Override
	public boolean isAddnewuser(UserModel user) {
		try
		{		
			
			stmt=conn.prepareStatement("insert into user values('0',?,?)");
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getPassword());
			int value=stmt.executeUpdate();
				return value>0?true:false;
			
		}
		catch (Exception ex) 
		{
			System.out.println("Error is "+ex);
			return false;

		}
				
				
	}
	
}
	

