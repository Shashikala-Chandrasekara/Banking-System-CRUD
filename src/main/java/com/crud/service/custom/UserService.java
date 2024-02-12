package com.crud.service.custom;

import com.crud.entity.User;
import com.crud.service.SuperService;

import java.util.Optional;

public interface UserService extends SuperService {
//    User createUser(User user);


//    void signInToUser(User user);

    Optional<User> getUserByUsername(String username);

}


