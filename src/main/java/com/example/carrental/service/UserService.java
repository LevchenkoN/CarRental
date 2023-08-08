package com.example.carrental.service;


import com.example.carrental.entity.User;

public interface UserService {

    public User findUserByEmail(String email);

    public void saveUser(User user);

}
