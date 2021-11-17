package web.commands.tt;

import business.entities.User;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.UserFacade;
import web.commands.CommandProtectedPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class UpdateBalanceCommand extends CommandProtectedPage {
    UserFacade userFacade;
    CupcakeFacade cupcakeFacade;

    public UpdateBalanceCommand(String pageToShow, String role) {
        super(pageToShow, role);
        userFacade = new UserFacade(database);
        cupcakeFacade = new CupcakeFacade(database);
    }


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        try {
            List<User> userList = (List<User>) request.getSession().getAttribute("userList");
            int user_id = Integer.parseInt(request.getParameter("userID"));
            int balance = Integer.parseInt(request.getParameter("newBalance_"+user_id));
            userFacade.updateBalance(balance, user_id); // nu er saldo ændret i databasen. men vi har en liste med kunder i sessionscopet
            // som bruges til at fylde data ud på jsp siden. Vi skal have fat i den kunde, ændre dens saldo og og lægge listen tilbage i
            // sessionscopet.
            for (User u : userList) {
                if (u.getId() == user_id) {
                    u.setBalance(balance); // nu er værdiern ædret i userobjektet. nu skal vi bare lige denne udgave af listen tilbage i sessionscopet.
                }
            }
            request.getSession().setAttribute("userList", userList); // nu er listen op to date
            return pageToShow;
        } catch (NumberFormatException | UserException ex) {
            request.setAttribute("error", ex.getMessage());
            return pageToShow;
        }
    }
}
