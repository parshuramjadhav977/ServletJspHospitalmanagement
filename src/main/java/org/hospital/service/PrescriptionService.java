package org.hospital.service;

import java.util.List;

import org.DocerModel.AllocatePatientModel;
import org.DocerModel.PrescriptionModel;

public interface PrescriptionService {
    public boolean allocatePrescriptionToPatient(PrescriptionModel prescription);
    public boolean allocatePrescriptionToPatient(String prescriptionDetails, int patientId, int doctorId);
    
    public List<PrescriptionModel> getAllPrescription() ;
	public boolean isDeletePrescriptionById(int Prescription_id) ;



}

