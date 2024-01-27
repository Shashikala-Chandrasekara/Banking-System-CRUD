package com.crud.service.custom.impl;

import com.crud.entity.Customer;
import com.crud.exception.AppException;
import com.crud.repository.CustomerRepository;
import com.crud.service.custom.CustomerService;
import com.crud.service.util.Transformer;
import com.crud.to.CustomerTO;
import com.crud.to.request.CustomerRequestTO;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;


@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    
    private final Transformer transformer;
    private final CustomerRepository customerRepository;

    public CustomerServiceImpl(CustomerRepository customerRepository, Transformer transformer){
        this.customerRepository =  customerRepository;
        this.transformer = transformer;
    }

    @Override
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    @Override
    public CustomerTO createCustomer(CustomerTO customerTO) {
        Customer customer = transformer.fromCustomerTO(customerTO);
        customerRepository.save(customer);

//        CustomerTO customerTO = transformer.toCustomerTO(customer);
        return customerTO;
    }

    @Override
    public void updateCustomer(CustomerTO customerTO) {
        Customer currentCustomer = customerRepository.findById(customerTO.getNic()).orElseThrow(() -> new AppException(404, "No customer associated with this nic"));

        Customer newCustomer = transformer.fromCustomerTO(customerTO);

        if (customerTO.getName() != currentCustomer.getName()){
            newCustomer.setName(customerTO.getName());
        }
        if (customerTO.getAddress() != currentCustomer.getAddress()){
            newCustomer.setAddress(customerTO.getAddress());
        }
        if (customerTO.getMobileNumber() != currentCustomer.getMobileNumber()){
            newCustomer.setMobileNumber(customerTO.getMobileNumber());
        }
        customerRepository.save(newCustomer);
    }

    @Override
    public void deleteCustomer(String nic) {
        if (!customerRepository.existsById(nic)) throw new AppException(404, "No customer found");

        customerRepository.deleteById(nic);

    }

    @Override
    public CustomerTO viewCustomer(String nic) {
        Optional<Customer> optCustomer = customerRepository.findById(nic);
        if (optCustomer.isEmpty()) throw new AppException(404, "No customer found");
        CustomerTO customerTO = transformer.toCustomerTO(optCustomer.get());
        return customerTO;

    }

}
