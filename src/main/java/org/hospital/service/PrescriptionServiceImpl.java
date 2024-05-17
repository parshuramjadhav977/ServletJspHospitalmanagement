package org.hospital.service;

import java.util.List;

import org.DocerModel.AllocatePatientModel;
import org.DocerModel.PrescriptionModel;
import org.hospital.repository.PrescriptionRepository;
import org.hospital.repository.PrescriptionRepositoryImpl;

public class PrescriptionServiceImpl implements PrescriptionService {
	
	PrescriptionRepository prescriptionRepository=new PrescriptionRepositoryImpl();


    @Override
    public boolean allocatePrescriptionToPatient(PrescriptionModel prescription) {
        try {
            prescriptionRepository.allocatePrescriptionToPatient(prescription);
            return true; // Prescription allocated successfully
        } catch (Exception ex) {
            ex.printStackTrace();
            return false; // Failed to allocate prescription
        }
    }

    @Override
    public boolean allocatePrescriptionToPatient(String prescriptionDetails, int patientId, int doctorId) {
        try {
            PrescriptionModel prescription = new PrescriptionModel();
            prescription.setPrescriptionDetails(prescriptionDetails);
            prescription.setPtid(patientId);
            prescription.setDocid(doctorId);
            prescriptionRepository.allocatePrescriptionToPatient(prescription);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false; 
        }
    }

	@Override
    public List<PrescriptionModel> getAllPrescription() {
        return prescriptionRepository.getAllPrescription();
    }


	@Override
	public boolean isDeletePrescriptionById(int Prescription_id) {
		return prescriptionRepository.isDeletePrescriptionById(Prescription_id);
	}


	
}

