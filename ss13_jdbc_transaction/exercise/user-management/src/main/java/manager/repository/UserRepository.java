package manager.repository;

import manager.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/user_demo";
    private String jdbcUsername = "root";
    private String jdbcPassword = "codegym";
    static List<User> listUser = new ArrayList<>();


    private static final String INSERT_USERS_SQL = "call insert_user(?,?,?);";
    private static final String SELECT_USER_BY_ID = "select * from users where id =?";
    private static final String SELECT_ALL_USERS = "call select_users();";
    private static final String DELETE_USERS_SQL = "call delete_users(?);";
    private static final String UPDATE_USERS_SQL = "call update_user(?,?,?,?);";
    private static final String SEARCH_BY_COUNTRY = " select * from users where country like ? ";

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public List<User> selectAllUsers() {
        listUser.clear();
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USERS);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("user_name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                listUser.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listUser;
    }

    @Override
    public List<User> searchByCountry(String countrySearch) {
        listUser.clear();
        Connection connection = new UserRepository().getConnection();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(SEARCH_BY_COUNTRY);

            preparedStatement.setString(1, "%" + countrySearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            User user = null;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("user_name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                listUser.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listUser;
    }

    @Override
    public void insertUser(User user) {

    }

    @Override
    public boolean add(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_USERS_SQL);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            int num = callableStatement.executeUpdate();
            return num == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("user_name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }


    @Override
    public boolean deleteUser(int id) {
        Connection connection = BaseRepository.getConnectDB();
        boolean rowDeleted;

        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_SQL);
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
            return rowDeleted;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        Connection connection = BaseRepository.getConnectDB();
        boolean rowUpdated;
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_SQL);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());

            rowUpdated = callableStatement.executeUpdate() > 0;
            return rowUpdated;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        Connection conn = null;
        // for insert a new user
        PreparedStatement pstmt = null;
        // for assign permision to user
        PreparedStatement pstmtAssignment = null;
        // for getting user id
        ResultSet rs = null;
        try {
            conn = getConnection();
            // set auto commit to false
            conn.setAutoCommit(false);
            //
            // Insert user
            //
            pstmt = conn.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getCountry());
            int rowAffected = pstmt.executeUpdate();
            // get user id
            rs = pstmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next())
                userId = rs.getInt(1);
            //
            // in case the insert operation successes, assign permision to user
            //
            if (rowAffected == 1) {
                // assign permision to user
                String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "
                        + "VALUES(?,?)";
                pstmtAssignment = conn.prepareStatement(sqlPivot);
                for (int permisionId : permision) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permisionId);
                    pstmtAssignment.executeUpdate();
                }
                conn.commit();
            } else {
                conn.rollback();
            }
        } catch (SQLException ex) {
            // roll back the transaction
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
}
