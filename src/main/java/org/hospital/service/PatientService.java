package org.hospital.service;

import java.util.*;

import org.DocerModel.*;

public interface PatientService {
    public boolean isAddPatient(PatientModel patient );
    public List<PatientModel> getAllPatient();
    public boolean isDeletePatient(int ptid);
    public boolean isUpdatePatient(PatientModel patient);
    public List<PatientModel> searchPatient(String keyword);
    public List<PatientModel> getOPDPatients() ;
    public List<PatientModel> getIPDPatients();
    public List<PatientModel> getPatientsByCategory(String category) ;
    public List<PatientModel> getPatientsByDate(Date date) ;
	public List<PatientModel> getPatientsByMonth(int year, int month);
	public List<PatientModel> getPatientsByYear(int year) ;
    public List<PatientModel> getPatientsBetweenDates(Date startDate, Date endDate) ;

	public List<PatientModel> getPatientsByDoctorId(int doctorId) ;
    public Map<String, Integer> getDoctorWisePatientCount();



    



    

}
