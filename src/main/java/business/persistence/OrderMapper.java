package business.persistence;

import business.entities.Bot;
import business.entities.Cupcake;
import business.entities.Order;
import business.entities.Top;
import business.exceptions.UserException;
import jdk.nashorn.internal.ir.RuntimeNode;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderMapper {
    private Database database;

    public OrderMapper(Database database) {
        this.database = database;
    }

    public List<Order> getAllOrders() throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "SELECT o.order_id, u.email, t.name AS topName, b.name AS botName, ol.quantity, o.price, o.date FROM orders AS o INNER JOIN user AS u ON o.user_id = u.user_id INNER JOIN orderline AS ol ON o.order_id = ol.order_id INNER JOIN cupcake AS c ON ol.cupcake_id = c.cupcake_id INNER JOIN top AS t ON c.top_id = t.top_id INNER JOIN bot AS b ON c.bot_id = b.bot_id";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                List<Order> orderList = new ArrayList<>();
                while (rs.next()) {
                    int oId = rs.getInt("order_id");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String email = rs.getString("email");
                    String topName = rs.getString("topName");
                    String botName = rs.getString("botName");
                    Timestamp ts = rs.getTimestamp("date");
//                    Order o = new Order(oId, price, quantity, email, topName, botName, ts);
//                    orderList.add(o);
                }
                return orderList;
            }
        } catch (SQLException ex) {
            throw new UserException(ex.getMessage());
        }
    }

    public void deleteOrder(int orderId) throws UserException {
        try (Connection connection = database.connect()) {
            String sql = "DELETE FROM `orders` WHERE order_id=?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, orderId);
                int res = ps.executeUpdate();

                if (res > 0) {
                    System.out.println("the order with the id: " + orderId + " has been deleted");
                }
            }
        }catch (SQLException ex){
            throw new UserException(ex.getMessage());
        }
    }
}
