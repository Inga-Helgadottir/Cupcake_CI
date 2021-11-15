package web.commands;

import business.entities.User;
import business.exceptions.UserException;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class UpdateBalance extends CommandProtectedPage {
    UserFacade userFacade;

    public UpdateBalance(String pageToShow, String role) {
        super(pageToShow, role);
        userFacade = new UserFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        int id = Integer.parseInt(request.getParameter("orderCheck"));
        int balance = Integer.parseInt(request.getParameter("balanceCheck"));
        System.out.println("here----------------------");
        System.out.println(id + " " + balance);

        List<User> kundeList = (List<User>) request.getSession().getAttribute("kundeList");
//        userFacade.updateBalance(balance, kundeId);

        request.getSession().setAttribute("kundeList", kundeList);
        return pageToShow;
    }
}
