package web.commands.tt;

import business.entities.Bot;
import business.entities.Cupcake;
import business.entities.Order;
import business.entities.Top;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import web.commands.CommandProtectedPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class ShowOrders_admin extends CommandProtectedPage {
    CupcakeFacade cupcakeFacade;

    public ShowOrders_admin(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        try {
            List<Order> orderList = cupcakeFacade.getAllOrders();
/*
            for (Order o : orderList) {
                List<Integer> cupcakeids = cupcakeFacade.getCupcakeIds(o.getOrder_id());//lav en liste med alle cupcakeid'erne
                for (int i : cupcakeids) {
                    Cupcake c = cupcakeFacade.getOrderLine(i);
                    Top t = cupcakeFacade.getTop(c.getTop_id());
                    c.setTop(t.getName());
                    Bot b = cupcakeFacade.getBot(c.getBot_id());
                    c.setBot(b.getName());
                    o.addToOrderItems(c);
                }
            }
 */
            request.getSession().setAttribute("orderList", orderList);
            return pageToShow;


        } catch (UserException exception) {
            request.setAttribute("error", exception.getMessage());
            return "employeepage";
        }
    }
}
