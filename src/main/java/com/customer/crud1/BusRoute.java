package com.customer.crud1;

public class BusRoute {
    private int bus_id;
    private int route_id;

    public BusRoute(int bus_id, int route_id) {
        this.bus_id = bus_id;
        this.route_id = route_id;
    }

    public int getBus_id() {
        return bus_id;
    }

    public int getRoute_id() {
        return route_id;
    }
}
