package web.commands;

import business.services.CupcakeFacade;
import business.services.OrderFacede;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminDeleteOrder extends CommandProtectedPage{
    CupcakeFacade cupcakeFacade;
    UserFacade userFacade;
    OrderFacede orderFacede;
    public AdminDeleteOrder(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
        userFacade = new UserFacade(database);
        orderFacede = new OrderFacede(database);
    }
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            //this is null
            String s = request.getParameter("orderCheck");
            System.out.println(s.toString());
            //deleteAOrder(s);
            return pageToShow;
        } catch (NumberFormatException ex) {
            request.setAttribute("error", ex.getMessage());
            return "adminOrders";
        }
    }
}
