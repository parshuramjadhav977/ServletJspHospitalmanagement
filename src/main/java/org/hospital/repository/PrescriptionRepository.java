package org.hospital.repository;

import java.util.List;

import org.DocerModel.PatientModel;
import org.DocerModel.PrescriptionModel;

public interface PrescriptionRepository {
    boolean allocatePrescriptionToPatient(PrescriptionModel prescription);

	List<PrescriptionModel> getAllPrescription();
    public boolean isDeletePrescriptionById(int Prescription_id);


}
