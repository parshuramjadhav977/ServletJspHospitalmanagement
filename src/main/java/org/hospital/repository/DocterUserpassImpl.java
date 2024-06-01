package org.hospital.repository;

import java.sql.SQLException;

import org.DocerModel.DocterUserpass;
import org.hospital.config.DBConfig;

public class DocterUserpassImpl extends DBConfig implements DocterUserpassRepo {

	private int loginid = 0;

	public int getId() {
		try {
			stmt = conn.prepareStatement("select max(loginid)from docterlogin");
			rs = stmt.executeQuery();
			if (rs.next()) {
				loginid = rs.getInt(1);
			}
			return ++loginid;
		} catch (Exception ex) {
			System.out.println("Error is:" + ex);
			return -1;
		}
	}

	@Override
	public boolean isAddDocterUserpass(DocterUserpass doc) {
		try {

			loginid = this.getId();
			stmt = conn.prepareStatement("insert into docterlogin values(?,?,?,?)");
			stmt.setInt(1, loginid);
			stmt.setString(2, doc.getDocpassword());
			stmt.setString(3, doc.getDocusername());
			stmt.setInt(4, doc.getDid());

			return stmt.executeUpdate() > 0;
		} catch (Exception ex) {
			System.out.println("Error is" + ex);
			return false;
		}

	}

	@Override
	public boolean validateUserCredentials(String docusername, String docpassword) {
			 try {
		            stmt = conn.prepareStatement("select docusername ,docpassword from docterlogin where docusername = ? and docpassword = ?");
		           

		            
		            stmt.setString(1, docusername);
		            stmt.setString(2, docpassword);
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
		        }	}	}

