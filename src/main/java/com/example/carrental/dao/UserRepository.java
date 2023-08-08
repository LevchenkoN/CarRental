package com.example.carrental.dao;


import com.example.carrental.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
//        ("userRepository")
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByEmail(String email);
}
