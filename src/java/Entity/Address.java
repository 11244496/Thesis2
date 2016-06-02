/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author RoAnn
 */
public class Address {
    private int id;
    private String houseNoStreet;
    private int postalCode;
    private Barangay barangay;

    public Address() {
    }

    
    public Address(int id, String houseNoStreet, int postalCode, Barangay barangay) {
        this.id = id;
        this.houseNoStreet = houseNoStreet;
        this.postalCode = postalCode;
        this.barangay = barangay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHouseNoStreet() {
        return houseNoStreet;
    }

    public void setHouseNoStreet(String houseNoStreet) {
        this.houseNoStreet = houseNoStreet;
    }

    public int getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(int postalCode) {
        this.postalCode = postalCode;
    }

    public Barangay getBarangay() {
        return barangay;
    }

    public void setBarangay(Barangay barangay) {
        this.barangay = barangay;
    }
    
    
}
