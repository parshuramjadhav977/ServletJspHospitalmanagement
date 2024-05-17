package org.hospital.service;

import java.util.List;

import org.DocerModel.AllocatePatientModel;
import org.hospital.config.DBConfig;
import org.hospital.repository.AllocatePatientRepository;
import org.hospital.repository.AllocatePatientRepositoryImpl;

public class AllocatePatientServiceImpl  extends DBConfig implements AllocatePatientService{


	AllocatePatientRepository allocatePatientRepository = new AllocatePatientRepositoryImpl();
    

	@Override
	public List<AllocatePatientModel> getAllAllocatedPatients() {
        return allocatePatientRepository.getAllAllocatedPatients();
	}

}
