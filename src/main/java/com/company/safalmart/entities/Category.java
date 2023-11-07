
package com.company.safalmart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(length = 25,name = "Category_Id")
   private int cId;
   @Column(length = 1000,name = "Category_Title")
   private String cTitle;
   @Column(length = 2100,name = "Category_Description")
   private String cDesc;
   @OneToMany(mappedBy = "category")
   private List<Product> products=new ArrayList<>();

    public Category() {
    }

    public Category(int cId, String cTitle, String cDesc) {
        this.cId = cId;
        this.cTitle = cTitle;
        this.cDesc = cDesc;
    }

    public Category(String cTitle, String cDesc,List<Product> products) {
        this.cTitle = cTitle;
        this.cDesc = cDesc;
        this.products=products;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    
    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcTitle() {
        return cTitle;
    }

    public void setcTitle(String cTitle) {
        this.cTitle = cTitle;
    }

    public String getcDesc() {
        return cDesc;
    }

    public void setcDesc(String cDesc) {
        this.cDesc = cDesc;
    }

    @Override
    public String toString() {
        return "Category{" + "cId=" + cId + ", cTitle=" + cTitle + ", cDesc=" + cDesc + '}';
    }
   
   
}
