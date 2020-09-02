package com.mapsa.controller;

import com.mapsa.dao.CustomerDao;
import com.mapsa.dao.FlightDao;
import com.mapsa.model.Customer;
import com.mapsa.model.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
public class HomeController {




    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private FlightDao flightDao ;

    @RequestMapping("/")
    public String index(){

        return "index";
    }
    @RequestMapping("login")
    public String loginPage(){

        return "login";
    }
    @RequestMapping("register")
    public String registerPage(){

        return "login";
    }



    @RequestMapping("Allflights")
    public String getflights(Model model) {
        List<Flight> flights = flightDao.getAllflights() ;
        model.addAttribute("flights",flights) ;
        return "flights" ;
    }

    @RequestMapping("loginUser")
    public String authenticate(@RequestParam String email, @RequestParam String password) {
    if (customerDao.Authenticate(email,password))
        return "redirect:flights" ;
    return "index" ;

    }

    @RequestMapping("registerUser")
    @ResponseBody
    public String register(@RequestParam String name ,
                           @RequestParam String family,
                           @RequestParam String email,
                           @RequestParam String password,
                           @RequestParam long phonenumber,
                           @RequestParam String address , Model model ) {
        Customer customer = new Customer() ;
        customer.setFirstName(name);
        customer.setLastName(family);
        customer.setEmail(email);
        customer.setPassword(password);
        customer.setPhoneNumber(phonenumber);
        customer.setBilling_address(address);

        boolean addCustomer = customerDao.register(customer) ;
        if (addCustomer)
            return "successfull registration !";
            return "your email is exists in our database" ;


    }
    @RequestMapping("addtoCart")
    public String addtoCart(@RequestParam long flightId,Model model) {
        return "cart" ;
    }

}
