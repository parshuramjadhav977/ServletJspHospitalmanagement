package org.DocerModel;

import java.sql.*;
import java.util.Date;


public class PatientModel {
    private int ptid;
    private String ptName;
    private int age;
    private String gender;
    private String contact;
    private String address;
    private String opdDate;
    private int did;
    private String docname;
	private double fess;
    private String appointmentDate;
    private String category;
    private  int Prescription_id;
    private String Prescription_details;
    
    
    public int getPrescription_id() {
		return Prescription_id;
	}

	public void setPrescription_id(int prescription_id) {
		Prescription_id = prescription_id;
	}

	public String getPrescription_details() {
		return Prescription_details;
	}

	public void setPrescription_details(String prescription_details) {
		Prescription_details = prescription_details;
	}

	public String getDocname() {
		return docname;
	}

   public void setDocname(String docname) {
		this.docname = docname;
	}





    public PatientModel() {

    }

    
    

    public int getPtid() {
        return ptid;
    }

    public void setPtid(int ptid) {
        this.ptid = ptid;
    }

    public String getPtName() {
        return ptName;
    }

    public void setPtName(String ptName) {
        this.ptName = ptName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOpdDate() {
        return opdDate;
    }

    public void setOpdDate(String opdDate) {
        this.opdDate = opdDate;
    }

    public int getDocid() {
        return did;
    }

    public void setDocid(int did) {
        this.did = did;
    }

    public double getFess() {
        return fess;
    }

    public void setFess(double fess) {
        this.fess = fess;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	public int getDid() {
		return did;
	}




	public void setDid(int did) {
		this.did = did;
	}




	public String getCategory() {
		return category;
	}




	public void setCategory(String category) {
		this.category = category;
	}

   





}
