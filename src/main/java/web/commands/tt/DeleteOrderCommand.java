package web.commands.tt;

import business.entities.Order;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import web.commands.CommandProtectedPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class DeleteOrderCommand extends CommandProtectedPage {
    CupcakeFacade cupcakeFacade;

    public DeleteOrderCommand(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
    }


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        if (request.getParameter("orderCheck") != null) {

        }
        int order_id = Integer.parseInt(request.getParameter("orderCheck"));
        List<Order> orderList = (List<Order>) request.getSession().getAttribute("orderList");

        for (Order o : orderList) {
            if (o.getOrder_id() == order_id) {
                o.setStatus("cancelled");// changes order status to cancelled in sessionscope.
            }
        }
        cupcakeFacade.changeOrderStatus("cancelled", order_id);//change order status in db.
        request.getSession().setAttribute("orderList", orderList);
        return pageToShow;
    }
}
