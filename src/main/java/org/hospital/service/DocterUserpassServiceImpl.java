package org.hospital.service;

import org.hospital.config.DBConfig;
import org.hospital.repository.DocterUserpassImpl;
import org.hospital.repository.DocterUserpassRepo;
import org.DocerModel.DocterUserpass;




public class DocterUserpassServiceImpl extends DBConfig implements DocterUserpassService{
	DocterUserpassRepo docterUserpassRepo =new DocterUserpassImpl();

	@Override
	public boolean isAddDocterUserpass(DocterUserpass doc) {
		return docterUserpassRepo.isAddDocterUserpass(doc);
	}

	@Override
	public boolean validateUserCredentials(String docusername, String docpassword) {
		return docterUserpassRepo.validateUserCredentials(docusername, docpassword);
	}

}
