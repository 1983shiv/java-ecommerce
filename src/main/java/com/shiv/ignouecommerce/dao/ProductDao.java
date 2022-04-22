/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shiv.ignouecommerce.dao;

import com.shiv.ignouecommerce.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author ninja
 */
public class ProductDao {
    private SessionFactory factory;
    
    public ProductDao(SessionFactory factory){
        this.factory = factory;
    }
    
    public int saveProduct(Product p){
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();

        int pId = (int) session.save(p);
        tx.commit();
        session.close();
            
        
        return pId;
    }
    
    // get all products
    public List<Product> getProducts(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    
    public List<Product> getProductsByCategoryId(int cid){
        Session s = this.factory.openSession();
        // Query query = s.createQuery("from Product");
        Query query = s.createQuery("from Product as p where category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;
    }
}
