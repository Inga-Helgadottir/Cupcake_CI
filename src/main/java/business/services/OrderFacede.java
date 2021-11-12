package business.services;

import business.entities.Order;
import business.exceptions.UserException;
import business.persistence.CupcakeMapper;
import business.persistence.Database;
import business.persistence.OrderMapper;

import java.util.List;

public class OrderFacede {
    OrderMapper orderMapper;

    public OrderFacede(Database database) {
        this.orderMapper = new OrderMapper(database);
    }

    public List<Order> getAllOrders() throws UserException {
        return orderMapper.getAllOrders();
    }
}
