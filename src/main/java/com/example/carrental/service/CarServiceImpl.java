package com.example.carrental.service;

import com.example.carrental.dao.CarRepository;
import com.example.carrental.entity.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service("carService")
public class CarServiceImpl implements CarService {

    private CarRepository carRepository;

    @Autowired
    public CarServiceImpl(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    @Override
    public List<Car> findAll() {
        return carRepository.findAll();
    }

    @Override
    public Car findById(int id) {
        Optional<Car> result = carRepository.findById(id);

        Car car = null;
        if(result.isPresent()){
            car = result.get();
        } else {
            throw new RuntimeException("Ідентифікатор автомобіля не знайдено: " + id);
        }
        return car;
    }

    @Override
    public void save(Car car) {
        carRepository.save(car);
    }

    @Override
    public void deleteById(int id) {
        carRepository.deleteById(id);
    }
}
