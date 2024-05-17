package org.hospital.service;
import org.hospital.repository.*;
import org.DocerModel.*;

public interface AdminService {
	AdminRepository adminRepository = new AdminRepositoryImpl();

	
    public boolean validateAdminCredentials(String username, String password);
  
}
