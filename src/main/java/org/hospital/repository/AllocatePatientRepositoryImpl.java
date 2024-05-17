package org.hospital.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.DocerModel.AllocatePatientModel;
import org.hospital.config.DBConfig;

public class AllocatePatientRepositoryImpl extends DBConfig implements AllocatePatientRepository {

    public List<AllocatePatientModel> getAllAllocatedPatients() {
        List<AllocatePatientModel> allocatedPatients = new ArrayList<>();
        try {
             stmt = conn.prepareStatement("select p.ptid, p.ptName, p.did, d.docname " +"FROM patient p " +"inner join doctor d on p.did = d.did;");
             rs = stmt.executeQuery();

            while (rs.next()) {
                AllocatePatientModel patient = new AllocatePatientModel();
                patient.setPtid(rs.getInt("ptid"));
                patient.setPtName(rs.getString("ptName"));
                patient.setDocid(rs.getInt("did"));
                patient.setDoctorName(rs.getString("docname"));
                allocatedPatients.add(patient);
            }
        } catch (SQLException ex) {
            System.out.println("Error retrieving allocated patients: " + ex.getMessage());
        } finally {
            closeResources();
        }
        return allocatedPatients;
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
            System.out.println("Error closing resources: " + ex.getMessage());
        }
    }

}
