package business.services;

import business.entities.Bot;
import business.entities.Order;
import business.entities.Top;
import business.entities.User;
import business.exceptions.UserException;
import business.persistence.CupcakeMapper;
import business.persistence.Database;

import java.sql.Timestamp;
import java.util.List;

public class CupcakeFacade {

    CupcakeMapper cupcakeMapper;

    public CupcakeFacade(Database database) {
        cupcakeMapper = new CupcakeMapper(database);
    }


    public Order createOrder(User user, int price, Timestamp ts) throws UserException {
        return cupcakeMapper.createOrder(user, price, ts);
    }

    public Bot getBot(int botId) throws UserException {
        return cupcakeMapper.getBot(botId);
    }

    public Bot getBot(String name) throws UserException {
        return cupcakeMapper.getBot(name);
    }

    public Top getTop(int topId) throws UserException {
        return cupcakeMapper.getTop(topId);
    }

    public Top getTop(String name) throws UserException {
        return cupcakeMapper.getTop(name);
    }

    public int createCupcake(int bot_id, int top_id, int price, int amount) throws UserException {
        return cupcakeMapper.createCupcake(bot_id, top_id, price, amount);
    }

    public List<Bot> getAllBottoms() throws UserException {
        return cupcakeMapper.getAllBots();
    }

    public List<Top> getAllTops() throws UserException {
        return cupcakeMapper.getAllTops();
    }

    public List<Order> getAllOrders() throws UserException {
        return cupcakeMapper.getAllOrders();
    }

    public void removeOrder(int order_id) throws UserException {
        cupcakeMapper.removeOrder(order_id);
    }


    public void createLink(int orderid, int cupcake_id, int amount) throws UserException {
        cupcakeMapper.createLink(orderid, cupcake_id, amount);
    }

    public void changeOrderStatus(String status, int order_id) throws UserException{
        cupcakeMapper.changeOrderStatus(status, order_id);
    }
}
