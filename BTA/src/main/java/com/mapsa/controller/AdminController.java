package com.mapsa.controller;

import com.mapsa.dao.AdministratorDao;
import com.mapsa.dao.CustomerDao;
import com.mapsa.dao.FlightDao;
import com.mapsa.model.Customer;
import com.mapsa.model.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminController {
@Autowired
private AdministratorDao administratorDao ;
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private FlightDao flightDao ;

    @RequestMapping("/cAuth")
    public String cAuth() {
        return "cAuth" ;
    }

    @RequestMapping("/administrator")

    public String auth(@RequestParam String email , @RequestParam String password, Model model) {
        if (administratorDao.auth(email,password)) {

            return "admin/administrator";}

        return "error";
    }

    @RequestMapping("error")
    public String error() {
        return "error";
    }


    @RequestMapping("flights")
    public String getflights(Model model) {
        List<Flight> flights = flightDao.getAllflights() ;
        model.addAttribute("flights",flights) ;
        return "admin/flights";
    }

    @RequestMapping("customers")
    public String getcustomers(Model model) {
        List<Customer> Customers = customerDao.findAllCustomers() ;
        model.addAttribute("Customers",Customers);
        return "admin/customers";
    }

    @RequestMapping("transactions")
    public String gettransactions() {
        return "admin/transactions";
    }


    @RequestMapping("deleteCustomer")
    public String deleteCustomer(@RequestParam long id,Model model) {
        boolean delete = customerDao.deleteCustomerById(id);

        List<Customer> Customers = customerDao.findAllCustomers() ;
        model.addAttribute("Customers",Customers);
        return "admin/customers";

    }
    @RequestMapping("editCustomer")
    public String editCustomer(@RequestParam long id,Model model) {
        Customer customer = customerDao.getCustomersById(id) ;
        model.addAttribute("customer",customer) ;
        return "admin/editCustomer";

    }

    @RequestMapping("updateCustomer")

    public String updateCustomer (@RequestParam long id , @RequestParam String firstname,
                                  @RequestParam String lastname
                                    , @RequestParam String email,
                                  @RequestParam long phoneNumber,
                                  @RequestParam String billingAddress,Model model) {

        Customer updatedCustomer = new Customer() ;
        updatedCustomer.setId(id);
        updatedCustomer.setFirstName(firstname);
        updatedCustomer.setLastName(lastname);
        updatedCustomer.setEmail(email);
        updatedCustomer.setPhoneNumber(phoneNumber);
        updatedCustomer.setBilling_address(billingAddress);
        customerDao.updateCustomer(updatedCustomer) ;
        List<Customer> Customers = customerDao.findAllCustomers() ;
        model.addAttribute("Customers",Customers);
        return "admin/customers";
    }

    @RequestMapping("deleteflight")
    public String deleteflight(@RequestParam long id,Model model) {
        boolean delete = flightDao.deleteFlightById(id);

        List<Flight> flights = flightDao.getAllflights() ;
        model.addAttribute("flights",flights) ;
        return "admin/flights" ;
    }

    @RequestMapping("editFlight")
    public String editFlight(long id , Model model) {
        Flight flight = flightDao.getFlightById(id) ;
        model.addAttribute("flight",flight) ;
        return "admin/editFlight" ;
    }

    @RequestMapping("updateFlight")
    public String updateFlight(@RequestParam long id , @RequestParam String destination
                    , @RequestParam String origin , @RequestParam long price , @RequestParam long quantity, Model model){
        Flight flight = new Flight() ;
        flight.setFlightId(id);
        flight.setDestination(destination);
        flight.setOrigin(origin);
        flight.setPrice(price);
        flight.setQuantity(quantity);
        flightDao.updateFlight(flight) ;
        List<Flight> flights = flightDao.getAllflights() ;
        model.addAttribute("flights",flights) ;
        return "admin/flights";

    }

    @RequestMapping("addflight")
    public String addflightBtn() {
        return "admin/addFlight" ;
    }

    @RequestMapping("addFlightToDb")
    public String addflightToDb(@RequestParam String origin , @RequestParam String destination
    , @RequestParam long price , @RequestParam long quantity , Model model) {
        Flight flight = new Flight() ;
        flight.setOrigin(origin);
        flight.setDestination(destination);
        flight.setPrice(price);
        flight.setQuantity(quantity);
        flightDao.addFlights(flight);

        List<Flight> flights = flightDao.getAllflights() ;
        model.addAttribute("flights",flights) ;
        return "admin/flights" ;
    }

}
