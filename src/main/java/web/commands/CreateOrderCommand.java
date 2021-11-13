package web.commands;

import business.entities.Bot;
import business.entities.Cupcake;
import business.entities.Top;
import business.entities.User;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.UserFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class CreateOrderCommand extends CommandProtectedPage {
    CupcakeFacade cupcakeFacade;
    UserFacade userFacade;

    public CreateOrderCommand(String pageToShow, String role) {
        super(pageToShow, role);
        cupcakeFacade = new CupcakeFacade(database);
        userFacade = new UserFacade(database);
    }


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Cupcake> shoppingCart = (List<Cupcake>) request.getSession().getAttribute("shoppingCart");
            if (shoppingCart == null){
                request.setAttribute("error","Din indkøbskurv er tom");
                return "shoppingcartpage";
            }

            User user = (User) request.getSession().getAttribute("user");
            int price = (int) request.getSession().getAttribute("total");
            if (user.getBalance() > price) {
                Date date = new Date();
                long time = date.getTime();
                Timestamp ts = new Timestamp(time);
                cupcakeFacade.createOrder(user, price, ts);
                shoppingCart.clear();
                request.setAttribute("shoppingCart",shoppingCart);
                request.setAttribute("total", 0);

                //cupcakeFacade.createCupcake(shoppingCart);
                //cupcakeFacade.createLink();  //maybe this should be done automatically ^one above^

                return pageToShow;
            }
            request.setAttribute("error", "du har ikke nok penge på din konto ");
            return "shoppingcartpage";

        } catch (NumberFormatException | UserException ex) {
            request.setAttribute("error", ex.getMessage());
            return "shoppingcartpage";
        }
    }
}
