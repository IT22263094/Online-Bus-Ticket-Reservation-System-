package com.customer.crud1;

public class Seat {
    private int seatId;
    private int busId;
    private int totalSeats;
    private String bookedSeatNumbers;
    private String availableSeatNumbers;

    public Seat(int seatId, int busId, int totalSeats, String bookedSeatNumbers, String availableSeatNumbers) {
        this.seatId = seatId;
        this.busId = busId;
        this.totalSeats = totalSeats;
        this.bookedSeatNumbers = bookedSeatNumbers;
        this.availableSeatNumbers = availableSeatNumbers;
    }

    public int getSeatId() {
        return seatId;
    }

    public int getBusId() {
        return busId;
    }

    public int getTotalSeats() {
        return totalSeats;
    }

    public String getBookedSeatNumbers() {
        return bookedSeatNumbers;
    }

    public String getAvailableSeatNumbers() {
        return availableSeatNumbers;
    }
}
