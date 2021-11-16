package business.services;

import business.entities.User;
import business.exceptions.UserException;
import business.persistence.Database;
import business.persistence.UserMapper;

import java.util.List;

public class UserFacade {
    UserMapper userMapper;

    public UserFacade(Database database) {
        userMapper = new UserMapper(database);
    }

    public User login(String email, String password) throws UserException {
        return userMapper.login(email, password);
    }

    public User createUser(String email, String password) throws UserException {
        User user = new User(email, password, "customer");
        userMapper.createUser(user);
        return user;
    }

    public List<User> getAllUsers() throws UserException {
        return userMapper.getAllUsers();
    }

    public void updateBalance(int balance, int id) throws UserException {
        userMapper.updateBalance(balance, id);
    }

    public User getUserById(int id) throws UserException {
        return userMapper.getUserById(id);
    }

}