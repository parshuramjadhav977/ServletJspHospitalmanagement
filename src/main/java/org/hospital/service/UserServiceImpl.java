package org.hospital.service;

import org.DocerModel.UserModel;
import org.hospital.config.DBConfig;
import org.hospital.repository.UserRepository;
import org.hospital.repository.UserRepositoryImpl;

public class UserServiceImpl extends DBConfig implements UserService{
	UserRepository userRepository=new UserRepositoryImpl();

@Override
public boolean validateUserCredentials(String username, String password) {
	return userRepository.validateUserCredentials(username, password);
}

@Override
public boolean isAddnewuser(UserModel user) {
	return userRepository.isAddnewuser( user);

}


}



