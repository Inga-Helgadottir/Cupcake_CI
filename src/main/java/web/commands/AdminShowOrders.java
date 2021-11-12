package web.commands;

import business.entities.Bot;
import business.entities.Cupcake;
import business.entities.Order;
import business.entities.Top;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.OrderFacede;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class AdminShowOrders extends CommandProtectedPage{
    CupcakeFacade cupcakeFacade;
    UserFacade userFacade;
    OrderFacede orderFacede;

    public AdminShowOrders(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
        userFacade = new UserFacade(database);
        orderFacede = new OrderFacede(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            List<Order> orderList = (List<Order>) request.getSession().getAttribute("orderList");

            if (orderList == null) {
                orderList = new ArrayList<>();
            }

            return pageToShow;

        } catch (NumberFormatException ex) {
            request.setAttribute("error", ex.getMessage());
            return "admin";
        }
    }
}
