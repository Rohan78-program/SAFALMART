
package com.company.safalmart.dao;

import com.company.safalmart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    
    SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory=factory;
    }

    public int saveProduct(Product product){
         
        Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            
            int pId=(int) session.save(product);
            
            tx.commit();
            
            session.close();
        return pId;
    }
    
    //get all products
    public List<Product> getAllProducts(){
        List<Product> list=null;
        try {
            Session s = this.factory.openSession();
            Query query = s.createQuery("from Product");
            list=query.list();
            
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getAllProductsById(int cid){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.category.cId =: id");
        query.setParameter("id", cid);
        List<Product> list=query.list();
        return list;
    }
    
}
