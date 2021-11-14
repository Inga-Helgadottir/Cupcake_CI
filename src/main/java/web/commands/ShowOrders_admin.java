package web.commands;

import business.entities.Order;
import business.exceptions.UserException;
import business.services.CupcakeFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowOrders_admin extends CommandProtectedPage {
    CupcakeFacade cupcakeFacade;

    public ShowOrders_admin(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        List<Order> orderList = cupcakeFacade.getAllOrders();
        request.getSession().setAttribute("orderList", orderList);
        return pageToShow;
    }
}
