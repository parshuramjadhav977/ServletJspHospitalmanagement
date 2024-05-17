package org.hospital.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.DocerModel.DocterModel;
import org.DocerModel.PatientModel;
import org.hospital.config.DBConfig;
import org.hospital.repository.*;

public class PatientServiceImpl extends DBConfig implements PatientService {

	PatientRepository  patientRepository = new PatientRepositoryImpl();

	@Override
	public boolean isAddPatient(PatientModel patient) {
        return patientRepository.isAddPatient(patient);
	}

	@Override
	public List<PatientModel> getAllPatient() {
		return patientRepository.getAllPatient();
	}

	@Override
	public boolean isDeletePatient(int ptid) {
        return patientRepository.isDeletePatient(ptid);
	}

	@Override
	public boolean isUpdatePatient(PatientModel patient) {
		return patientRepository.isUpdatePatient(patient);
	}

	@Override
	public List<PatientModel> searchPatient(String keyword) {
		return patientRepository.searchPatient(keyword);
	}

	@Override
    public List<PatientModel> getOPDPatients() {
        return getPatientsByCategory("opd");
    }


	@Override
    public List<PatientModel> getIPDPatients() {
        return getPatientsByCategory("ipd");
    }



	@Override
    public List<PatientModel> getPatientsByCategory(String category) {
        return patientRepository.getPatientsByCategory(category);
    }

	@Override
	public List<PatientModel> getPatientsByDate(Date date) {
        return patientRepository.getPatientsByDate(date);
	}

	@Override
	public List<PatientModel> getPatientsByMonth(int year, int month) {
		return patientRepository.getPatientsByMonth(year, month);
	}

	@Override
	public List<PatientModel> getPatientsByYear(int year) {
		return patientRepository.getPatientsByYear(year);
	}

	@Override
	public List<PatientModel> getPatientsBetweenDates(Date startDate, Date endDate) {
		return patientRepository.getPatientsBetweenDates(startDate, endDate);
	}

	@Override
	public List<PatientModel> getPatientsByDoctorId(int doctorId) {
		return patientRepository.getPatientsByDoctorId(doctorId);
	}

	@Override
	public Map<String, Integer> getDoctorWisePatientCount() {
		// TODO Auto-generated method stub
		return patientRepository.getDoctorWisePatientCount() ;
	}






	

}

