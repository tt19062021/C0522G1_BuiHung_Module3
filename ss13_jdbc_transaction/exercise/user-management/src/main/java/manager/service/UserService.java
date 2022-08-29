package manager.service;

import manager.model.User;
import manager.repository.IUserRepository;
import manager.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> searchByCountry(String countrySearch) {
        return iUserRepository.searchByCountry(countrySearch);
    }

    @Override
        public void insertUser(User user) {
            iUserRepository.insertUser(user);
        }

    @Override
    public boolean add(User user) {
        return iUserRepository.add(user);
    }

    @Override
        public User selectUser(int id) {
            return iUserRepository.selectUser(id);
        }

        @Override
        public List<User> selectAllUsers() {
            return iUserRepository.selectAllUsers();
        }

        @Override
        public boolean deleteUser(int id) {
            return iUserRepository.deleteUser(id);
        }

        @Override
        public boolean updateUser(User user) {
            return iUserRepository.updateUser(user);
        }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        iUserRepository.addUserTransaction(user,permision);
    }
}


