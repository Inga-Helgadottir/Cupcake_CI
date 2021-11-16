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
        try{
            int id = Integer.parseInt(request.getParameter("orderCheck"));
            int balance = Integer.parseInt(request.getParameter("inputSaldo" + id));
            System.out.println(id + " " + balance);

            userFacade.updateBalance(balance, id);

            List<User> kundeList = (List<User>) request.getSession().getAttribute("kundeList");
            User u = userFacade.getUserById(id);
            u.setBalance(balance);
            request.getSession().setAttribute("kundeList", kundeList);

        }catch(NumberFormatException e){
            System.out.println(e.getMessage());
        }
        return pageToShow;
    }
}
