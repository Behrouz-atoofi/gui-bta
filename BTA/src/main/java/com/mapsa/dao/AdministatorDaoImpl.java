package com.mapsa.dao;

import com.mapsa.model.Administrator;
import com.mapsa.model.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public class AdministatorDaoImpl implements AdministratorDao {

    @Autowired
    SessionFactory sessionFactory ;

    @Override
    public boolean auth(String email , String password) {
        Transaction transaction = null;
        Administrator administrator = null;
        try (Session session = sessionFactory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            administrator = (Administrator) session.createQuery("FROM Administrator WHERE email = :email").setParameter("email", email)
                    .uniqueResult();

            if (administrator != null && administrator.getPassword().equals(password)) {
                return true;

            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
}
