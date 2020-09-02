package com.mapsa.dao;

import com.mapsa.model.Flight;
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
public class FlightDaoImpl implements FlightDao  {

    @Autowired
    SessionFactory sessionFactory ;
    @Override
    public List<Flight> getAllflights() {
        Session session = sessionFactory.getCurrentSession() ;
        Query query = session.createQuery("from Flight");
        List<Flight> flightList = query.list() ;
        session.flush();
        return flightList;
    }

    @Override
    public void addFlights(Flight flight) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession() ){
            transaction = session.beginTransaction();
            Flight flight2 = new Flight() ;
            flight2.setOrigin(flight.getOrigin());
            flight2.setDestination(flight.getDestination());
            flight2.setPrice(flight.getPrice());
            flight2.setQuantity(flight.getQuantity());
            session.save(flight2);
            session.getTransaction().commit();
            session.close();
            transaction.commit();
        }

    }

    @Override
    public boolean updateFlight(Flight flight) {

        Transaction transaction = null;
        Flight flight1 = null;
        try (Session session = sessionFactory.openSession()) {

            transaction = session.beginTransaction();

            flight1 = (Flight) session.createQuery("FROM Flight WHERE flightId = :id").setParameter("id", flight.getFlightId())
                    .uniqueResult();

            if (flight1 != null) {
                flight1.setDestination(flight.getDestination());
                flight1.setOrigin(flight.getOrigin());
                flight1.setPrice(flight.getPrice());
                flight1.setQuantity(flight.getQuantity());

                session.update(flight1);
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
    public Flight getFlightById(long id) {

        Flight flight = null ;
        try (Session session = sessionFactory.openSession()) {

            flight = (Flight) session.createQuery("FROM Flight WHERE flightId = :id").setParameter("id", id)
                    .uniqueResult();

            return flight;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteFlightById(long id) {

        Transaction transaction = null;
        Flight flight = null;
        try (Session session = sessionFactory.openSession()) {

            transaction = session.beginTransaction();

            flight = (Flight) session.createQuery("FROM Flight WHERE id = :id").setParameter("id", id)
                    .uniqueResult();
            if (flight != null) {
                session.delete(flight);
                session.getTransaction().commit();
                session.close();
                transaction.commit();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void addFlightTocart(long flightId) {

    }
}
