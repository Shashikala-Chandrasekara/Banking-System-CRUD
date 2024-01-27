package com.crud.service.util;

import com.crud.entity.Customer;
import com.crud.to.CustomerTO;
import com.crud.to.request.CustomerRequestTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
public class Transformer {

    private final ModelMapper mapper;

    public Transformer(ModelMapper mapper){
        this.mapper = mapper;

//        mapper.typeMap(Customer.class, String.class)
    }

    public Customer fromCustomerReqTO(CustomerRequestTO customerRequestTO){
        Customer customer = mapper.map(customerRequestTO, Customer.class);
        return customer;
    }

    public Customer fromCustomerTO(CustomerTO customerTO){
        Customer customer = mapper.map(customerTO, Customer.class);
        return customer;
    }

    public CustomerTO toCustomerTO(Customer customer){
        return mapper.map(customer, CustomerTO.class);
    }



    


}
