package web.commands.tt;

import business.exceptions.UserException;
import web.commands.CommandProtectedPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderInfoCommand extends CommandProtectedPage {

    public OrderInfoCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {



        return pageToShow;
    }
}
