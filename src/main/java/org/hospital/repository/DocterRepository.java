package org.hospital.repository;

import java.util.List;
import org.DocerModel.DocterModel;

public interface DocterRepository {
    public boolean isAddDocterModel(DocterModel model);
    public List<DocterModel> getAllDocter();
    public boolean isDeleteDocterById(int did);
    public boolean isUpdateDocter(DocterModel model);
    public List<DocterModel> searchDoctors(String keyword);

}
