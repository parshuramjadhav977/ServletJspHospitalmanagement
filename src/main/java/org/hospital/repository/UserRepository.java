package org.hospital.repository;

import org.DocerModel.UserModel;

public interface UserRepository {
    public boolean validateUserCredentials(String username, String password) ;

	public boolean isAddnewuser(UserModel user);


}
