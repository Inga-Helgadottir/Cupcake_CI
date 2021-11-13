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


    public void createOrder(User user, int price, Timestamp ts) throws UserException{
        cupcakeMapper.createOrder(user,price,ts);
    }

    public Bot getBot(int botId) throws UserException {
        return cupcakeMapper.getBot(botId);
    }

    public Top getTop(int topId) throws UserException {
        return cupcakeMapper.getTop(topId);
    }

    public List<Bot> getAllBottoms() throws UserException {
        return cupcakeMapper.getAllBots();
    }

    public List<Top> getAllTops() throws UserException {
        return cupcakeMapper.getAllTops();
    }

    public List<Order> getAllOrders() {
        return cupcakeMapper.getAllOrders();
    }
}
