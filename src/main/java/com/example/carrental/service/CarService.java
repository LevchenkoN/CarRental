package com.example.carrental.service;


import com.example.carrental.entity.Car;

import java.util.List;

public interface CarService {

    public List<Car> findAll();

    public Car findById(int id);

    public void save(Car car);

    public void deleteById (int id);

}
