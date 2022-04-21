/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shiv.ignouecommerce.dao;

import com.shiv.ignouecommerce.entities.User;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author ninja
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        
        try {
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            user = (User) q.uniqueResult();
            
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}
