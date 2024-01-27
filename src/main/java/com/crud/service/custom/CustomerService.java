package com.crud.service.custom;

import com.crud.entity.Customer;
import com.crud.service.SuperService;
import com.crud.to.CustomerTO;
import com.crud.to.request.CustomerRequestTO;

import java.util.Collection;
import java.util.List;

public interface CustomerService extends SuperService {
    List<Customer> getAllCustomers();

    CustomerTO createCustomer(CustomerTO customerTO);

    void updateCustomer(CustomerTO customerTO);

    void deleteCustomer(String nic);

    CustomerTO viewCustomer(String nic);
}
