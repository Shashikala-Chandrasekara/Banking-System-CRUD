package com.crud.service.custom.impl;

import com.crud.entity.User;
import com.crud.repository.UserRepository;
import com.crud.service.custom.UserService;

import jakarta.transaction.Transactional;

import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
@Transactional
public class UserServiceImpl implements UserService{

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

//    @Override
//    public User createUser(User user) {
//        userRepository.save(user);
//        return user;
//    }

//    @Override
//    public void signInToUser(User user) {
//        String username = user.getUsername();
//        String password = user.getPassword();
//
//    }


    @Override
    public Optional<User> getUserByUsername(String username) {
        Optional<User> user = userRepository.findByUsername(username);
        return user;
    }
}
