package org.hospital.repository;


import java.sql.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.DocerModel.DocterModel;
import org.DocerModel.PatientModel;
import org.hospital.config.DBConfig;

public class PatientRepositoryImpl extends DBConfig implements PatientRepository {
    List<PatientModel> list = new ArrayList<PatientModel>();

    public int getPtId() throws SQLException {
        try {
            stmt = conn.prepareStatement("SELECT MAX(ptid) FROM patient");
            rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } 
        finally {
            closeResources();
        }
        	return -1; 
        
    }

    public boolean isAddPatient(PatientModel patient) {
        try {
            int ptid = getPtId();
            if (ptid == -1) {
                return false;
            }
            
            stmt = conn.prepareStatement("INSERT INTO patient VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setInt(1, ptid);
            stmt.setString(2, patient.getPtName());
            stmt.setInt(3, patient.getAge());
            stmt.setString(4, patient.getGender().toString()); 
            stmt.setString(5, patient.getContact());
            stmt.setString(6, patient.getAddress());
            stmt.setString(7, patient.getOpdDate());
            stmt.setInt(8, patient.getDocid());
            stmt.setDouble(9, patient.getFess()); 
            stmt.setString(10, patient.getAppointmentDate());
            stmt.setString(11, patient.getCategory().toString());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.err.println("Error inserting patient: " + ex.getMessage());
            return false; // Return false indicating failure
        } catch (IllegalArgumentException ex) {
            System.err.println("Error inserting patient: " + ex.getMessage());
            return false; // Return false indicating failure
        } finally {
            closeResources();
        }
    }


    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException ex) {
            System.err.println("Error closing resources: " + ex.getMessage());
        }
    }

	@Override
	public List<PatientModel> getAllPatient() {
	    try {
	        list = new ArrayList<PatientModel>();
	        stmt = conn.prepareStatement("SELECT * FROM patient");
	        rs = stmt.executeQuery();
	        while (rs.next()) {
	            PatientModel patient = new PatientModel();
	            patient.setPtid(rs.getInt(1)); // Assuming the first column is the patient ID

	            patient.setPtName(rs.getString(2));
	            patient.setAge(rs.getInt(3));
	            patient.setGender((rs.getString(4)));

	            patient.setContact(rs.getString(5));
	            patient.setAddress(rs.getString(6));
	            patient.setOpdDate(rs.getString(7));
	            patient.setDocid(rs.getInt(8));
	            patient.setFess(rs.getDouble(9));
	            patient.setAppointmentDate(rs.getString(10));
	            patient.setCategory((rs.getString(11)));

	            list.add(patient);
	        }
	        return list.size() > 0 ? list : null;
	    } catch (Exception ex) {
	        System.out.println("Error is " + ex);
	        return null;
	    }
	}

	@Override
	public boolean isDeletePatient(int ptid) {
        try {
            stmt = conn.prepareStatement("delete from patient where ptid = ?");
            stmt.setInt(1, ptid);
            return stmt.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Error is " + ex);
            return false;
        }
	}
	@Override
	public boolean isUpdatePatient(PatientModel patient) {
	    try {
	        stmt = conn.prepareStatement("UPDATE patient SET ptname=?, age=?, gender=?, contact=?, address=?, opddate=?, did=?,fess=?, appoinmentdate=?, category=? WHERE ptid=?");
	        stmt.setInt(11, patient.getPtid());
	        stmt.setString(1, patient.getPtName());
	        stmt.setInt(2, patient.getAge());
	        stmt.setString(3, patient.getGender());
	        stmt.setString(4, patient.getContact());
	        stmt.setString(5, patient.getAddress());
	        stmt.setString(6, patient.getOpdDate());
	        stmt.setInt(7, patient.getDocid());
	        stmt.setDouble(8, patient.getFess());
	        stmt.setString(9, patient.getAppointmentDate());
	        stmt.setString(10, patient.getCategory());

	        int rowsUpdated = stmt.executeUpdate();
	        
	        return rowsUpdated > 0;
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	        return false;
	    }
	}

	@Override
	public List<PatientModel> searchPatient(String keyword) {
        List<PatientModel> resultList = new ArrayList<>();
        try {
            stmt = conn.prepareStatement("SELECT * FROM patient WHERE ptName LIKE ?");
            stmt.setString(1, "%" + keyword + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                PatientModel model = new PatientModel();
                model.setPtid(rs.getInt(1));
                model.setPtName(rs.getString(2));
                model.setAge(rs.getInt(3));
                model.setGender(rs.getString(4));
                model.setContact(rs.getString(5));
                model.setAddress(rs.getString(6));
                model.setOpdDate(rs.getString(7));
                model.setDocid(rs.getInt(8));
                model.setFess(rs.getDouble(9));
                model.setAppointmentDate(rs.getString(10));
                model.setCategory(rs.getString(11));
                resultList.add(model);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return resultList;
    }
	
	public List<PatientModel> getPatientsByCategory(String category) {
	    try {
	        list = new ArrayList<PatientModel>();
	        stmt = conn.prepareStatement("select p.ptid,p.ptname,p.age,p.gender,p.contact,p.address,p.opddate ,d.docname,p.fess,p.appoinmentdate,p.category from patient p inner join doctor d on p.did=d.did WHERE category =?");
	        stmt.setString(1, category);
	        rs = stmt.executeQuery();
	        while (rs.next()) {
	            PatientModel patient = new PatientModel();
	            patient.setPtid(rs.getInt(1)); // Assuming the first column is the patient ID

	            patient.setPtName(rs.getString(2));
	            patient.setAge(rs.getInt(3));
	            patient.setGender((rs.getString(4)));

	            patient.setContact(rs.getString(5));
	            patient.setAddress(rs.getString(6));
	            patient.setOpdDate(rs.getString(7));
	            patient.setDocname(rs.getString(8));
	            patient.setFess(rs.getDouble(9));
	            patient.setAppointmentDate(rs.getString(10));
	            patient.setCategory((rs.getString(11)));

	            list.add(patient);
	        }
	        return list.size() > 0 ? list : null;
	    } catch (Exception ex) {
	        System.out.println("Error is " + ex);
	        return null;
	    }
	}

	@Override
    public List<PatientModel> getPatientsByDate(java.util.Date date) {
        List<PatientModel> patients = new ArrayList<>();
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = dateFormat.format(date);
            String query = "SELECT * FROM patient WHERE opddate = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, formattedDate);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PatientModel patient = new PatientModel();
                patient.setPtid(rs.getInt("ptid"));
                patient.setPtName(rs.getString("ptName"));
                patient.setAge(rs.getInt("age"));
                patient.setGender(rs.getString("Gender"));
                patient.setContact(rs.getString("contact"));
                patient.setAddress(rs.getString("address"));
                patient.setOpdDate(rs.getString("opddate"));
                patient.setDocid(rs.getInt("did"));
                patient.setFess(rs.getFloat("fess"));
                patient.setAppointmentDate(rs.getString("appoinmentdate"));
                patient.setCategory(rs.getString("category"));
                patients.add(patient);
            }
        } catch (SQLException ex) {
            System.out.println("Error retrieving patients by date: " + ex.getMessage());
        }
        return patients;
    }

	@Override
	public List<PatientModel> getPatientsByMonth(int year, int month) {
	    List<PatientModel> patients = new ArrayList<>();
	     stmt = null;
	     rs = null;

	    try {
	        String query = "SELECT * FROM patient WHERE YEAR(opddate) = ? AND MONTH(opddate) = ?";
	        stmt = conn.prepareStatement(query);

	        stmt.setInt(1, year);
	        stmt.setInt(2, month);
	        



	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            PatientModel patient = new PatientModel();
	            patient.setPtid(rs.getInt("ptid"));
	            patient.setPtName(rs.getString("ptName"));
	            patient.setAge(rs.getInt("age"));
	            patient.setGender(rs.getString("Gender"));
	            patient.setContact(rs.getString("contact"));
	            patient.setAddress(rs.getString("address"));
	            patient.setOpdDate(rs.getString("opddate"));
	            patient.setDocid(rs.getInt("did"));
	            patient.setFess(rs.getDouble("fess"));
	            patient.setAppointmentDate(rs.getString("appoinmentdate"));
	            patient.setCategory(rs.getString("category"));
	            patients.add(patient);
	        }
	    } catch (SQLException ex) {
	        System.out.println("Error retrieving patients for the specified month: " + ex.getMessage());
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return patients;
	}

	@Override
	public List<PatientModel> getPatientsByYear(int year) {
		
		
	    List<PatientModel> patients = new ArrayList<>();
	     stmt = null;
	     rs = null;
	     
	     
	        try {
		        
	        stmt = conn.prepareStatement("SELECT * FROM patient WHERE YEAR(opddate) = ?");
	        stmt.setInt(1, year);

	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            PatientModel patient = new PatientModel();
	            patient.setPtid(rs.getInt("ptid"));
	            patient.setPtName(rs.getString("ptName"));
	            patient.setAge(rs.getInt("age"));
	            patient.setGender(rs.getString("Gender"));
	            patient.setContact(rs.getString("contact"));
	            patient.setAddress(rs.getString("address"));
	            patient.setOpdDate(rs.getString("opddate"));
	            patient.setDocid(rs.getInt("did"));
	            patient.setFess(rs.getDouble("fess"));
	            patient.setAppointmentDate(rs.getString("appoinmentdate"));
	            patient.setCategory(rs.getString("category"));
	            patients.add(patient);
	        }
	    } catch (SQLException ex) {
	        System.out.println("Error retrieving patients for the specified month: " + ex.getMessage());
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return patients;
	}

	@Override
	public List<PatientModel> getPatientsBetweenDates(Date startDate, Date endDate) {
        List<PatientModel> patients = new ArrayList<>();
        try {
            String query = "SELECT * FROM patient WHERE opddate BETWEEN ? AND ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setDate(1, new java.sql.Date(startDate.getTime()));
            stmt.setDate(2, new java.sql.Date(endDate.getTime()));
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PatientModel patient = new PatientModel();
                patient.setPtid(rs.getInt("ptid"));
                patient.setPtName(rs.getString("ptName"));
                patient.setAge(rs.getInt("age"));
                patient.setGender(rs.getString("Gender")); 
                patient.setContact(rs.getString("contact"));
                patient.setAddress(rs.getString("address"));
                patient.setOpdDate(rs.getString("opddate"));
                patient.setDocid(rs.getInt("did"));
                patient.setFess(rs.getDouble("fess"));
                patient.setAppointmentDate(rs.getString("appoinmentdate"));
                patient.setCategory(rs.getString("category"));
                patients.add(patient);
            }
        } catch (SQLException ex) {
            System.out.println("Error retrieving patients between dates: " + ex.getMessage());
        }
        return patients;
    }

	@Override
	public List<PatientModel> getPatientsByDoctorId(int doctorId) {
        List<PatientModel> patients = new ArrayList<>();
        try {
            String query = "SELECT * FROM patient WHERE did = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, doctorId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PatientModel patient = new PatientModel();
                patient.setPtid(rs.getInt("ptid"));
                patient.setPtName(rs.getString("ptName"));
                patient.setAge(rs.getInt("age"));
                patient.setGender(rs.getString("Gender")); 
                patient.setContact(rs.getString("contact"));
                patient.setAddress(rs.getString("address"));
                patient.setOpdDate(rs.getString("opddate"));
                patient.setDocid(rs.getInt("did"));
                patient.setFess(rs.getDouble("fess"));
                patient.setAppointmentDate(rs.getString("appoinmentdate"));
                patient.setCategory(rs.getString("category"));
                patients.add(patient);
            }
        } catch (SQLException ex) {
            System.out.println("Error retrieving patients by doctor ID: " + ex.getMessage());
        }
        return patients;
    }

	@Override
	public Map<String, Integer> getDoctorWisePatientCount() {
        Map<String, Integer> doctorWisePatientCount = new HashMap<>();
        try {
            stmt =conn.prepareStatement("SELECT d.docname "+", COUNT(*) AS patientCount " +" FROM patient p "+" INNER JOIN doctor d ON d.did = p.did "+"GROUP BY docname") ;
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String docname = rs.getString("docname");
                int patientCount = rs.getInt("patientCount");
                doctorWisePatientCount.put(docname, patientCount);
            }
        } catch (SQLException ex) {
            System.out.println("Error retrieving doctor-wise patient count: " + ex.getMessage());
        }
        return doctorWisePatientCount;	
        
	}
    	
	}
	

	
    	





