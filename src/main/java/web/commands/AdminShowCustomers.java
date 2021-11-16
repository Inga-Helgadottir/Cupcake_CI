package web.commands;

import business.entities.*;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.OrderFacede;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class AdminShowCustomers extends CommandProtectedPage{
    CupcakeFacade cupcakeFacade;
    UserFacade userFacade;
    OrderFacede orderFacede;

    public AdminShowCustomers(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
        userFacade = new UserFacade(database);
        orderFacede = new OrderFacede(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

            List<User> kundeList = userFacade.getAllUsers();
            request.getSession().setAttribute("kundeList", kundeList);

            return pageToShow;
    }
}
