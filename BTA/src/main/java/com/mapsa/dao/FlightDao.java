package com.mapsa.dao;

import com.mapsa.model.Flight;

import java.util.List;

public interface FlightDao {

    public List<Flight> getAllflights() ;
    public void addFlights(Flight flight) ;
    public void addFlightTocart(long flightId) ;
    public boolean updateFlight(Flight flight) ;
    public boolean deleteFlightById (long id) ;
    public Flight getFlightById(long id) ;

}
