/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shiv.ignouecommerce.dao;

import com.shiv.ignouecommerce.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author ninja
 */
public class CategoryDao {
    private SessionFactory factory;
    
    public CategoryDao(SessionFactory factory){
        this.factory = factory;
    }
    
    public int saveCategory(Category cat){
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getCategories(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
    
    public Category getCategoryById(int catId){
        Category cat = null;
        try {
            Session s2 = this.factory.openSession();
            cat = s2.get(Category.class, catId);
            s2.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
