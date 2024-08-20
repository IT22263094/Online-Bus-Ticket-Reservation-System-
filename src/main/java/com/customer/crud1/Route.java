package com.customer.crud1;


public class Route {
    private int route_id;
    private String start_point;
    private String end_point;
    private double distance_km;
    private int duration_minutes;

    public Route(int route_id, String start_point, String end_point, double distance_km, int duration_minutes) {
        this.route_id = route_id;
        this.start_point = start_point;
        this.end_point = end_point;
        this.distance_km = distance_km;
        this.duration_minutes = duration_minutes;
    }

    public int getRoute_id() {
        return route_id;
    }

    public String getStart_point() {
        return start_point;
    }

    public String getEnd_point() {
        return end_point;
    }

    public double getDistance_km() {
        return distance_km;
    }

    public int getDuration_minutes() {
        return duration_minutes;
    }
}
