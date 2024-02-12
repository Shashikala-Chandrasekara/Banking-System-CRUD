package com.crud.controller;

import com.crud.entity.Customer;
import com.crud.entity.User;
import com.crud.repository.CustomerRepository;
import com.crud.repository.UserRepository;
import com.crud.service.custom.CustomerService;
import com.crud.service.custom.UserService;
import com.crud.to.CustomerTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String signInPage(){
        return "welcome";
    }

    @RequestMapping(value = "/user/save", method = RequestMethod.POST)
    public ResponseEntity<Object> saveUser(@RequestBody User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        User result = userRepository.save(user);
        if (result.getId() > 0){
            return ResponseEntity.ok("User was saved");
        }
        return ResponseEntity.status(404).body("Error, User not saved");

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loadSignInPage(){
        return "login";
    }

//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public String loginPage(){
//        return "welcome";
//
//    }

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

    public UserDetails getLoggedInUserDetails(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication != null && authentication.getPrincipal() instanceof UserDetails){
            return (UserDetails) authentication.getPrincipal();
        }
        return null;
    }


}
