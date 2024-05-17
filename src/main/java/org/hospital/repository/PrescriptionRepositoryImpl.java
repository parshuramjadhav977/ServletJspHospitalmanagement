package org.hospital.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.DocerModel.AllocatePatientModel;
import org.DocerModel.PrescriptionModel;
import org.hospital.config.DBConfig;

public class PrescriptionRepositoryImpl extends DBConfig implements PrescriptionRepository {

    public int getNextPrescriptionId() throws SQLException {
        try {
            stmt = conn.prepareStatement("SELECT MAX(Prescription_id) FROM Prescriptions");
            rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            } else {
                return 1; // If no prescriptions exist, start from 1
            }
        } finally {
            closeResources1();
        }
    }

    @Override
    public boolean allocatePrescriptionToPatient(PrescriptionModel prescription) {
        try {
            int prescriptionId = getNextPrescriptionId();
            stmt = conn.prepareStatement("INSERT INTO Prescriptions (Prescription_id, Prescription_details, ptid, did) VALUES (?, ?, ?, ?)");
            stmt.setInt(1, prescriptionId);
            stmt.setString(2, prescription.getPrescriptionDetails());
            stmt.setInt(3, prescription.getPtid());
            stmt.setInt(4, prescription.getDocid());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.err.println("Error inserting prescription: " + ex.getMessage());
            return false; // Return false indicating failure
        } finally {
            closeResources1(); // Close database resources in finally block
        }
    }

    // Define the closeResources method to handle closing database resources
    private void closeResources1() {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            System.err.println("Error closing resources: " + ex.getMessage());
        }
    }

	@Override
    public List<PrescriptionModel> getAllPrescription() {
        List<PrescriptionModel> prescriptions = new ArrayList<>();
        try {
            stmt = conn.prepareStatement("select p.Prescription_id,p.Prescription_details ,pt.ptname,d.docname from prescriptions p inner join patient pt on pt.ptid=p.ptid inner join doctor d on d.did=p.did");
            rs = stmt.executeQuery();
            while (rs.next()) {
                PrescriptionModel prescription = new PrescriptionModel();
                prescription.setPrescriptionId(rs.getInt("Prescription_id"));
                prescription.setPrescriptionDetails(rs.getString("Prescription_details"));
                prescription.setPtname(rs.getString("ptname"));
                prescription.setDocname(rs.getString("docname"));
                prescriptions.add(prescription);
            }
        } catch (SQLException ex) {
            System.err.println("Error retrieving prescriptions: " + ex.getMessage());
        } finally {
            closeResources1();
        }
        return prescriptions;
    }

    private void closeResources() {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            System.err.println("Error closing resources: " + ex.getMessage());
        }
    }

	@Override
	public boolean isDeletePrescriptionById(int Prescription_id) {
		try
		{
			stmt=conn.prepareStatement("delete from Prescriptions where Prescription_id=?");
			stmt.setInt(1, Prescription_id);
			int value=stmt.executeUpdate();
			if(value>0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception ex)
		{
			System.out.println("Error is:"+ex);
			return false;
		}
	}
}
