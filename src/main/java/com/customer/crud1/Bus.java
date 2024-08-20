package com.customer.crud1;

import java.math.BigDecimal;
import java.sql.Time;

public class Bus {
    private int bus_id;
    private String bus_name;
    private int capacity;
    private String bus_type;
    private String operator_name;
    private Time departure_time;
    private Time arrival_time;
    private String start_point;
    private String end_point;
    private BigDecimal fare;

    public Bus(int bus_id, String bus_name, int capacity, String bus_type, String operator_name,
               Time departure_time, Time arrival_time, String start_point, String end_point, BigDecimal fare) {
        this.bus_id = bus_id;
        this.bus_name = bus_name;
        this.capacity = capacity;
        this.bus_type = bus_type;
        this.operator_name = operator_name;
        this.departure_time = departure_time;
        this.arrival_time = arrival_time;
        this.start_point = start_point;
        this.end_point = end_point;
        this.fare = fare;
    }

    public int getBus_id() {
        return bus_id;
    }

    public String getBus_name() {
        return bus_name;
    }

    public int getCapacity() {
        return capacity;
    }

    public String getBus_type() {
        return bus_type;
    }

    public String getOperator_name() {
        return operator_name;
    }

    public Time getDeparture_time() {
        return departure_time;
    }

    public Time getArrival_time() {
        return arrival_time;
    }

    public String getStart_point() {
        return start_point;
    }

    public String getEnd_point() {
        return end_point;
    }

    public BigDecimal getFare() {
        return fare;
    }
}
