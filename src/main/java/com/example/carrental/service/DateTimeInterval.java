package com.example.carrental.service;


import java.time.LocalDate;

public class DateTimeInterval {

    private LocalDate myStartDate;

    private LocalDate myEndDate;

    public DateTimeInterval(LocalDate aStartDate, LocalDate aEndDate) {
        if (aStartDate == null) {
            throw new NullPointerException(
                    "Вказана дата початку не може бути нульовою");
        }

        if (aEndDate == null) {
            throw new NullPointerException("");
        }

        myStartDate = aStartDate;
        myEndDate = aEndDate;


        if (myStartDate.isAfter(myEndDate)) {
            throw new IllegalArgumentException(
                    "Вказане «start» LocalDate є після вказаного «end» LocalDate");
        }
    }

    public LocalDate getStart() {
        return myStartDate;
    }

    public LocalDate getEnd() { return myEndDate; }

    public boolean contains(LocalDate aLocalDate) {
        return !aLocalDate.isAfter(myEndDate)
                && !aLocalDate.isBefore(myStartDate);
    }

    @Override
    public String toString() {
        return myStartDate.toString() + "/" + myEndDate.toString();
    }

}
