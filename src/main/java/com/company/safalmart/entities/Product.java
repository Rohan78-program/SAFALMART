
package com.company.safalmart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(length = 100,name = "Product_Id")
   private int pId;
   @Column(length = 300,name = "Product_Name")
   private String pName;
   @Column(length = 2150,name = "Product_Description")
   private String pDesc;
   @Column(name = "Product_Photo")
   private String pPic;
   @Column(name = "Product_Price")
   private int pPrice;
   @Column(name = "Product_Discount")
   private int pDisc;
   @Column(name = "Product_Quantity")
   private int pQuantity;
   @ManyToOne
   private Category category;

    public Product() {
    }

    public Product(int pId, String pName, String pDesc, String pPic, int pPrice, int pDisc, int pQuantity) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDisc = pDisc;
        this.pQuantity = pQuantity;
    }

    public Product(String pName, String pDesc, String pPic, int pPrice, int pDisc, int pQuantity,Category category) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDisc = pDisc;
        this.pQuantity = pQuantity;
        this.category=category;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDisc() {
        return pDisc;
    }

    public void setpDisc(int pDisc) {
        this.pDisc = pDisc;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPic=" + pPic + ", pPrice=" + pPrice + ", pDisc=" + pDisc + ", pQuantity=" + pQuantity + '}';
    }
   
    //calculate product price after discount
    public int getPriceAfterDiscount(){
        int d=(int)((this.getpDisc()/100.0)*this.getpPrice());
        return this.getpPrice()-d;
    }
   
}
