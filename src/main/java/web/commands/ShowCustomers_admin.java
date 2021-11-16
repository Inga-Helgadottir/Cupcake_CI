package web.commands;

import business.entities.Order;
import business.entities.User;
import business.exceptions.UserException;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowCustomers_admin extends CommandProtectedPage {
    UserFacade userFacade;

    public ShowCustomers_admin(String pageToShow, String role) {
        super(pageToShow, role);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        List<User> userList = userFacade.getAllUsers();
        request.getSession().setAttribute("userList", userList);
        return pageToShow;
    }
}
