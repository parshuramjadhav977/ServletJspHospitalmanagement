package org.hospital.repository;

import java.util.ArrayList;

import java.util.List;
import java.sql.*;
import org.hospital.config.DBConfig;
import org.DocerModel.*;

public class DocterRepositoryImpl extends DBConfig implements DocterRepository {
    List<DocterModel> list = new ArrayList<DocterModel>();
    private int did = 0;

    public int getId() {
        try {
            stmt = conn.prepareStatement("select max(did)from doctor");
            rs = stmt.executeQuery();
            if (rs.next()) {
                did = rs.getInt(1);
            }
            return ++did;
        } catch (Exception ex) {
            System.out.println("Error is:" + ex);
            return -1;
        }
    }

    @Override
    public boolean isAddDocterModel(DocterModel model) {
        try {
            did = this.getId();
            stmt = conn.prepareStatement("insert into doctor values(?,?,?,?,?,?,?)");
            stmt.setInt(1, did);
            stmt.setString(2, model.getName());
            stmt.setString(3, model.getSpeciality());
            stmt.setString(4, model.getDesigination());
            stmt.setString(5, model.getDgree());
            stmt.setString(6, model.getContact());
            stmt.setString(7, model.getAddress());
            return stmt.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Error is" + ex);
            return false;
        }
    }

    @Override
    public List<DocterModel> getAllDocter() {
        try {
            list = new ArrayList<DocterModel>();
            stmt = conn.prepareStatement("select * from doctor");
            rs = stmt.executeQuery();
            while (rs.next()) {
                DocterModel model = new DocterModel();
                model.setId(rs.getInt(1));
                model.setName(rs.getString(2));
                model.setDesigination(rs.getString(3));
                model.setSpeciality(rs.getString(4));
                model.setDgree(rs.getString(5));
                model.setContact(rs.getString(6));
                model.setAddress(rs.getString(7));
                list.add(model);
            }
            return list.size() > 0 ? list : null;
        } catch (Exception ex) {
            System.out.println("Error is " + ex);
            return null;
        }
    }

    @Override
    public boolean isDeleteDocterById(int did) {
        try {
            stmt = conn.prepareStatement("delete from doctor where did = ?");
            stmt.setInt(1, did);
            return stmt.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Error is " + ex);
            return false;
        }
    }

    @Override
    public boolean isUpdateDocter(DocterModel model) {
        try {
             stmt = conn.prepareStatement("UPDATE doctor SET docname=?, speciality=?, designation=?, degree=?, contact=?, address=? WHERE did=?");
             stmt.setString(1, model.getName());
             stmt.setString(2, model.getSpeciality());
             stmt.setString(3, model.getDesigination());
             stmt.setString(4, model.getDgree());
             stmt.setString(5, model.getContact());
             stmt.setString(6, model.getAddress());
             stmt.setInt(7, model.getId());
            
            int rowsUpdated = stmt.executeUpdate();
            
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    @Override
    public List<DocterModel> searchDoctors(String search) {
    	
        List<DocterModel> resultList = new ArrayList<>();
        try {
            stmt = conn.prepareStatement("SELECT * FROM doctor WHERE docname LIKE ?");
            stmt.setString(1, "%" + search + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                DocterModel model = new DocterModel();
                model.setId(rs.getInt(1));
                model.setName(rs.getString(2));
                model.setDesigination(rs.getString(3));
                model.setSpeciality(rs.getString(4));
                model.setDgree(rs.getString(5));
                model.setContact(rs.getString(6));
                model.setAddress(rs.getString(7));
                resultList.add(model);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return resultList;
    }


}
