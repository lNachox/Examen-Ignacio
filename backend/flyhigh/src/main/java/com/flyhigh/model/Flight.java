package main.java.com.flyhigh.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "flights")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String flightNumber;

    @Column(nullable = false)
    private String origin;

    @Column(nullable = false)
    private String destination;

    @Column(nullable = false)
    private LocalDateTime departureTime;

    @Column(nullable = false)
    private int maxCapacity;

    @Column(nullable = false)
    private double price;

    @Enumerated(EnumType.STRING)
    private FlightStatus status;

    public enum FlightStatus {
        SCHEDULED, CONFIRMED, CANCELLED
    }
}
