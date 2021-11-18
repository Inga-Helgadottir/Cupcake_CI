package web.commands.tt;

import business.entities.*;
import business.exceptions.UserException;
import business.services.CupcakeFacade;
import business.services.UserFacade;
import web.commands.CommandProtectedPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
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
            if (shoppingCart == null) {
                request.setAttribute("error", "Din indkøbskurv er tom");
                return "shoppingcartpage";
            }

            User user = (User) request.getSession().getAttribute("user");
            int price = (int) request.getSession().getAttribute("total");
            if (user.getBalance() > price) {
                Date date = new Date();
                long time = date.getTime();
                Timestamp ts = new Timestamp(time);
                Order order = cupcakeFacade.createOrder(user, price, ts);
                int orderid = order.getOrder_id();
                // udfyld cupcake tabel med alle cupcakes fra indkøbskurven.
                for (Cupcake c : shoppingCart) {
                    Top top = cupcakeFacade.getTop(c.getTop());
                    Bot bot = cupcakeFacade.getBot(c.getBot());
                    int cupcake_id = cupcakeFacade.createCupcake(bot.getBot_id(), top.getTop_id(), c.getPrice(), c.getAmount());
                    cupcakeFacade.createLink(orderid, cupcake_id, c.getAmount());
                    //ikke nødvendigt
                    order.addToOrderItems(c);
                }
                shoppingCart.clear();
                request.getSession().setAttribute("shoppingCart", shoppingCart);
                request.getSession().setAttribute("total", 0);

                int newBalance = user.getBalance() - price;
                user.setBalance(newBalance);//opdaterer balance i user objekt
                userFacade.updateBalance(newBalance,user.getId());//opdaterer balance i db.
                return pageToShow;
            } else {
                request.setAttribute("error", "du har ikke nok penge på din konto ");
                return "shoppingcartpage";
            }

        } catch (NumberFormatException | UserException ex) {
            request.setAttribute("error", ex.getMessage());
            return "shoppingcartpage";
        }
    }
}
