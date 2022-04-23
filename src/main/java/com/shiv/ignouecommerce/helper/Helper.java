/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shiv.ignouecommerce.helper;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author ninja
 */
public class Helper {
    public static String get10Words(String desc){
        String[] str = desc.split(" ");
        
        if(str.length > 10){
            String res = "";
            for (int i = 0; i < 10; i++) {
                res = res + str[i] + " ";
            }
            return (res + "...");
        } else {
            return (desc + "...");
        }
    }
    
    public static Map<String, Long> getCounts(SessionFactory factory){
        Session session = factory.openSession();
        String q1 = "Select Count(*) from User";
        String q2 = "Select Count(*) from Product";
        
        Query r1 = session.createQuery(q1);
        Query r2 = session.createQuery(q2);
        
        Long userCount = (Long) r1.list().get(0);
        Long productCount = (Long) r2.list().get(0);
        
        Map<String, Long> map = new HashMap<>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        
        session.close();
        
        return map;
    }
    
}


