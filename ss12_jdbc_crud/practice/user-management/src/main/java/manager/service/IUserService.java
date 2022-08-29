package manager.service;

import manager.model.User;

import java.util.List;

public interface IUserService {
    List<User> searchByCountry(String countrySearch);
    void insertUser(User user) ;
    boolean add(User user);
    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) ;

    boolean updateUser(User user) ;
    void addUserTransaction(User user, int[] permision);
}
