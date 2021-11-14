package business.persistence;

import business.entities.*;
import business.exceptions.UserException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CupcakeMapper {
    private Database database;


    public CupcakeMapper(Database database) {
        this.database = database;
    }


    public Bot getBot(int bot_id) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM bot WHERE bot_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, bot_id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    return new Bot(bot_id, name, price);
                } else {
                    throw new UserException("Database Bot issue");
                }
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public Bot getBot(String name) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM bot WHERE name = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int price = rs.getInt("price");
                    int bot_id = rs.getInt("bot_id");
                    return new Bot(bot_id, name, price);
                } else {
                    throw new UserException("Database Bot issue");
                }
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public Top getTop(int topId) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM top WHERE top_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, topId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    return new Top(topId, name, price);
                } else {
                    throw new UserException("Database Bottom issue");
                }
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public Top getTop(String name) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM top WHERE name = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int price = rs.getInt("price");
                    int bot_id = rs.getInt("top_id");
                    return new Top(bot_id, name, price);
                } else {
                    throw new UserException("Database Bot issue");
                }
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public List<Top> getAllTops() throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT top_id, name, price FROM top";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                List<Top> listy = new ArrayList<>();
                while (rs.next()) {
                    int top_id = rs.getInt("top_id");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    Top top = new Top(top_id, name, price);

                    listy.add(top);
                }
                return listy;
            }
        } catch (
                SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public List<Bot> getAllBots() throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT bot_id, name, price FROM bot";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                List<Bot> listy = new ArrayList<>();
                while (rs.next()) {
                    int bot_id = rs.getInt("bot_id");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    Bot bot = new Bot(bot_id, name, price);

                    listy.add(bot);
                }
                return listy;
            }
        } catch (
                SQLException ex) {
            throw new UserException("Connection to database could not be established");
        }
    }

    public int createCupcake(int bot_id, int top_id, int price, int amount) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "INSERT INTO cupcake (bot_id, top_id, price, amount) VALUES (?,?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, bot_id);
                ps.setInt(2, top_id);
                ps.setInt(3, price);
                ps.setInt(4, amount);
                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                return ids.getInt(1);
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException | UserException ex) {
            throw new UserException(ex.getMessage());
        }
    }

    public Order createOrder(User user, int price, Timestamp ts) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "INSERT INTO `order` (user_id, price, created) VALUES (?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, user.getId());
                ps.setInt(2, price);
                ps.setTimestamp(3, ts);
                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                Order order = new Order(id, user.getId(), price, ts);
                return order;
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException | UserException ex) {
            throw new UserException(ex.getMessage());
        }
    }

    public List<Order> getAllOrders() throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT * FROM `order`";


            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                List<Order> orderList = new ArrayList<>();
                while (rs.next()) {
                    int order_id = rs.getInt("order_id");
                    int user_id = rs.getInt("user_id");
                    int price = rs.getInt("price");
                    Timestamp timestamp = rs.getTimestamp("created");
                    Order order = new Order(order_id, user_id, price, timestamp);
                    orderList.add(order);
                }
                return orderList;

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }


    public void removeOrder(int order_id) {

        try (Connection connection = database.connect()) {
            String sql = "DELETE FROM `order` WHERE order_id=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, order_id);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createLink(int orderid, int cupcake_id, int amount) throws UserException {

        try (Connection connection = database.connect()) {
            String sql = "INSERT INTO `orderline` (order_id, cupcake_id, quantity) VALUES (?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, orderid);
                ps.setInt(2, cupcake_id);
                ps.setInt(3, amount);
                ps.executeUpdate();
            } catch (SQLException ex) {
                throw new UserException(ex.getMessage());
            }
        } catch (SQLException | UserException ex) {
            throw new UserException(ex.getMessage());
        }
    }
}
