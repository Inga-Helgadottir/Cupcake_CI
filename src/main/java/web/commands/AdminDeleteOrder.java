package web.commands;

import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.OrderFacede;
import business.services.UserFacade;

import javax.servlet.http.Cookie;
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
            Cookie[] cookies = request.getCookies();
            if(cookies != null){
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("checkedbox")) {
                        System.out.println(cookie.getValue());
                        try {
                            int cookieNbr = Integer.parseInt(cookie.getValue());
                            orderFacede.deleteAOrder(cookieNbr);
                        } catch (UserException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            return pageToShow;
        } catch (NumberFormatException ex) {
            request.setAttribute("error", ex.getMessage());
            return "adminOrders";
        }
    }
}
