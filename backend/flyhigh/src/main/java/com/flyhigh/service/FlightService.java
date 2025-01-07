package main.java.com.flyhigh.service;

import com.flyhigh.model.Flight;
import com.flyhigh.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FlightService {

    @Autowired
    private FlightRepository flightRepository;

    public Flight createFlight(Flight flight) {
        return flightRepository.save(flight);
    }

    public Optional<Flight> getFlightById(Long id) {
        return flightRepository.findById(id);
    }

    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }

    public List<Flight> getFlightsByOriginAndDestination(String origin, String destination) {
        return flightRepository.findByOriginAndDestination(origin, destination);
    }

    public List<Flight> getFlightsByStatus(Flight.FlightStatus status) {
        return flightRepository.findByStatus(status);
    }

    public Flight updateFlight(Flight flight) {
        return flightRepository.save(flight);
    }

    public void deleteFlight(Long id) {
        flightRepository.deleteById(id);
    }
}

