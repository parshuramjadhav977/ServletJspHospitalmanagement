package org.hospital.service;

import java.util.List;


import org.DocerModel.DocterModel;
import org.hospital.repository.DocterRepository;
import org.hospital.repository.DocterRepositoryImpl;

public class DocterserviceImpl implements Docterservice {

    DocterRepository docRepo = new DocterRepositoryImpl();

    @Override
    public boolean isAddDocterModel(DocterModel model) {
        return docRepo.isAddDocterModel(model);
    }

    @Override
    public List<DocterModel> getAllDocter() {
        return docRepo.getAllDocter();
    }

    @Override
    public boolean isDeleteDocterById(int did) {
        return docRepo.isDeleteDocterById(did); // Delegate deletion operation to the repository
    }

    @Override
    public boolean isUpdateDocter(DocterModel model) {
        return docRepo.isUpdateDocter(model); // Delegate update operation to the repository
    }
    @Override
    public List<DocterModel> searchDoctors(String keyword) {
        return docRepo.searchDoctors(keyword);
    }

}
