package com.mapsa.dao;

import com.mapsa.model.Customer;

import java.util.List;

public interface CustomerDao {

    List<Customer> findAllCustomers();


    boolean Authenticate(String Email, String password);

    boolean register(Customer customer) ;

     boolean deleteCustomerById(long id) ;

    Customer getCustomersById(long id) ;

    boolean updateCustomer(Customer customer) ;

}
