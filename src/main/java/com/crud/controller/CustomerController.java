package com.crud.controller;

import com.crud.entity.Customer;
import com.crud.service.custom.CustomerService;
import com.crud.to.CustomerTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;


    @RequestMapping(value = "customer/list",method = RequestMethod.GET)
    public String listCustomers(Model model) {
        List<Customer> customers = customerService.getAllCustomers();
        model.addAttribute("customers", customers);
        return "list";

    }

    @RequestMapping(value = "/saveCustomer", method = RequestMethod.GET)
    public String showFormForAdd(Model model) {
        Customer customer = new Customer();
        model.addAttribute("customer", customer);
        return "customer-form";
    }

    @RequestMapping(value = "customer/saveCustomer", method = RequestMethod.POST)
    public String createCustomer(@Validated @ModelAttribute("customer") CustomerTO customerTO) {
        customerService.createCustomer(customerTO);
        return "customer-form";
    }

    @RequestMapping(value = "customer/viewCustomer/{nic}", method = RequestMethod.GET)
    public String viewCustomer(Model model, @PathVariable String nic) {
        CustomerTO customerTO = customerService.viewCustomer(nic);
        model.addAttribute("customer", customerTO);
        return "view-customer";
    }

    @RequestMapping(value = "customer/updateCustomer/{nic}", method = RequestMethod.GET)
    public String showUpdateCustomer(Model model, @PathVariable String nic) {
        CustomerTO customerTO = customerService.viewCustomer(nic);
        model.addAttribute("customer", customerTO);
        return "update-customer";
    }

    @RequestMapping(value = "customer/updateCustomer/{nic}", method = RequestMethod.POST)
    public String updateCustomer(@ModelAttribute("customer") CustomerTO customerTO) {
        customerService.updateCustomer(customerTO);
        return "update-customer";
    }

    @RequestMapping(value = "customer/deleteCustomer/{nic}", method = RequestMethod.GET)
    public String deleteCustomer(@PathVariable String nic){
        customerService.deleteCustomer(nic);
        return "delete-customer";
    }


}
