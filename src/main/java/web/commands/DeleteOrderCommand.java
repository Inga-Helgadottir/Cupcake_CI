package web.commands;

import business.entities.Order;
import business.exceptions.UserException;
import business.services.CupcakeFacade;

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

        //remove data point from link table first. Then remove the data links from order and cupcake tables.
        int order_id = Integer.parseInt(request.getParameter("orderCheck"));
        List<Order> orderList = (List<Order>) request.getSession().getAttribute("orderList");
        orderList.removeIf(o -> o.getOrder_id() == order_id);
        cupcakeFacade.changeOrderStatus("cancelled", order_id);// changes order status to cancelled.
        //cupcakeFacade.removeOrder(order_id);
        request.getSession().setAttribute("orderList", orderList);
        return pageToShow;
    }
}
