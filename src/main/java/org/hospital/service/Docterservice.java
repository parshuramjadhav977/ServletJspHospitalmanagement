package org.hospital.service;

import java.util.List;
import org.DocerModel.*;

public interface Docterservice {
    public boolean isAddDocterModel(DocterModel model);
    public List<DocterModel> getAllDocter();
    public boolean isDeleteDocterById(int did);
    public boolean isUpdateDocter(DocterModel model);
    public List<DocterModel> searchDoctors(String search);
    

}
