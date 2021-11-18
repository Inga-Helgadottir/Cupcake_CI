package web.commands.tt;

import business.entities.Cupcake;
import business.exceptions.UserException;
import web.commands.CommandUnprotectedPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UpdateShoppingCartCommand extends CommandUnprotectedPage {

    public UpdateShoppingCartCommand(String pageToShow) {
        super(pageToShow);

    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

        List<Cupcake> shoppingCart = (List<Cupcake>) request.getSession().getAttribute("shoppingCart");

        if (request.getParameter("update") != null) {
            int index_shoppingcart = Integer.parseInt(request.getParameter("update"));
            String amount_string = request.getParameter("amount");
            int amount_int = Integer.parseInt(amount_string);
            shoppingCart.get(index_shoppingcart).setAmount(amount_int);
        }

        //remove item from shoppingCart
        if (request.getParameter("remove") != null) {
            String remove = request.getParameter("remove");
            int remove_int = Integer.parseInt(remove);
            shoppingCart.remove(remove_int);
        }

        //calculate price after updates and deletes
        int price = 0;
        for (Cupcake c : shoppingCart) {
            int tmp = (c.getPrice() * c.getAmount());
            price += tmp;
        }
        // put the parameters back after updates and deletes.
        request.getSession().setAttribute("shoppingCart", shoppingCart);
        request.getSession().setAttribute("total", price);
        return pageToShow;


    }
}