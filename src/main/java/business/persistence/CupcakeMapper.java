package business.persistence;

import business.entities.Bot;
import business.entities.Order;
import business.entities.Top;
import business.entities.User;
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

    public Order createOrder(User user, int price, Timestamp ts) throws UserException {
        try (Connection connection = database.connect())
        {
            String sql = "INSERT INTO `order` (user_id, price, created) VALUES (?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setInt(1, user.getId());
                ps.setInt(2, price);
                ps.setTimestamp(3, ts);
                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                Order order = new Order(id,user.getId(),price,ts);
                return order;
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException | UserException ex)
        {
            throw new UserException(ex.getMessage());
        }
    }
}
