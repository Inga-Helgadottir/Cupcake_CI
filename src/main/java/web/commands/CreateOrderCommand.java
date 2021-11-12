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
            Date date = new Date();
            long time = date.getTime();
            Timestamp ts = new Timestamp(time);


            //this is just a extra thing that makes its easier for the user. If a user edits the amount on the page but forgets to
            //press the update button, then the order will still track the changes regardless :) so the update button is more, for ascetics.
            //It will still update the page amounts and the total price of the order.
            List<Integer> integerList = new ArrayList<>();
            List<String> stringList = Arrays.asList(request.getParameterValues("amount"));
            for (String s : stringList) {
                integerList.add(Integer.parseInt(s));
            }
            for (int i = 0; i < shoppingCart.size(); ++i) {
                shoppingCart.get(i).setAmount(integerList.get(i));
            }
            //



            //cupcakeFacade.createCupcake(shoppingCart);
            //cupcakeFacade.createLink();       maybe this should be done automatically ^one above^
            cupcakeFacade.createOrder(user,price,ts);
            return pageToShow;

        } catch (NumberFormatException | UserException ex) {
            request.setAttribute("error", ex.getMessage());
            return "orderpage";
        }
    }
}
