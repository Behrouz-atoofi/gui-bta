package com.mapsa.dao;

import com.mapsa.model.Customer;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Customer> findAllCustomers() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer");
        List<Customer> customerList = query.list();
        session.flush();
        return customerList;
    }

    @Override
    public boolean Authenticate(String email, String password) {
        Transaction transaction = null;
        Customer customer = null;
        try (Session session = sessionFactory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            customer = (Customer) session.createQuery("FROM Customer WHERE email = :email").setParameter("email", email)
                    .uniqueResult();

            if (customer != null && customer.getPassword().equals(password)) {
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

    @Override
    public boolean register(Customer newCustomer) {

        Transaction transaction = null;
        Customer customer = null;
        try (Session session = sessionFactory.openSession()) {

            transaction = session.beginTransaction();

            customer = (Customer) session.createQuery("FROM Customer WHERE email = :email").setParameter("email", newCustomer.getEmail())
                    .uniqueResult();

            if (customer != null)
                return false;

            session.save(newCustomer);
            session.getTransaction().commit();
            session.close();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean deleteCustomerById(long id) {

        Transaction transaction = null;
        Customer customer = null;
        try (Session session = sessionFactory.openSession()) {

            transaction = session.beginTransaction();

            customer = (Customer) session.createQuery("FROM Customer WHERE id = :id").setParameter("id", id)
                    .uniqueResult();

            if (customer != null) {

                session.delete(customer);
                ;
                session.getTransaction().commit();
                session.close();
                transaction.commit();
                return true;
            }
            return false;

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer getCustomersById(long id) {

        Customer customer = null;
        try (Session session = sessionFactory.openSession()) {

            customer = (Customer) session.createQuery("FROM Customer WHERE id = :id").setParameter("id", id)
                    .uniqueResult();

            return customer;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateCustomer(Customer customer)  {

        Transaction transaction = null;
        Customer customer1 = null;
        try (Session session = sessionFactory.openSession()) {

            transaction = session.beginTransaction();

            customer1 = (Customer) session.createQuery("FROM Customer WHERE id = :id").setParameter("id", customer.getId())
                    .uniqueResult();

            if (customer1 != null) {
                customer1.setFirstName(customer.getFirstName());
                customer1.setLastName(customer.getLastName());
                customer1.setEmail(customer.getEmail());
                customer1.setPhoneNumber(customer.getPhoneNumber());
                customer1.setBilling_address(customer.getBilling_address());
                session.update(customer1);
                session.getTransaction().commit();
                session.close();
                transaction.commit();
                return true;
            }
            return false;

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }

}
