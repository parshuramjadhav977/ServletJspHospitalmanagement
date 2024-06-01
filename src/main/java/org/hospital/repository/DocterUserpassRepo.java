package org.hospital.repository;

import org.DocerModel.DocterUserpass;
import org.hospital.service.*;

public interface DocterUserpassRepo {
	public boolean isAddDocterUserpass(DocterUserpass doc) ;
	public boolean validateUserCredentials(String docusername, String docpassword) ;

}
