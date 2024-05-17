package org.hospital.service;

import org.DocerModel.UserModel;
import org.hospital.repository.UserRepository;
import org.hospital.repository.UserRepositoryImpl;

public interface UserService {
	UserRepository userRepository=new UserRepositoryImpl();

	public boolean isAddnewuser(UserModel user);

	public boolean validateUserCredentials(String username, String password) ;





}
