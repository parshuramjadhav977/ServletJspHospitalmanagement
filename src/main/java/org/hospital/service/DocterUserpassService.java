package org.hospital.service;

import org.hospital.repository.DocterUserpassRepo;
import org.DocerModel.DocterUserpass;
import org.hospital.repository.DocterUserpassImpl;

public interface DocterUserpassService {
	public boolean isAddDocterUserpass(DocterUserpass doc) ;
	public boolean validateUserCredentials(String docusername, String docpassword) ;

}
