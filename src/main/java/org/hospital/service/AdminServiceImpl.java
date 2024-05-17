package org.hospital.service;
import org.hospital.repository.*;
import org.DocerModel.*;
public class AdminServiceImpl implements AdminService {

	AdminRepository adminRepository = new AdminRepositoryImpl();

	@Override
	public boolean validateAdminCredentials(String username, String password) {
        return adminRepository.validateAdminCredentials(username, password);

	}

}
