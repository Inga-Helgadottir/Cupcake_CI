package web.commands;

import business.entities.Cupcake;
import business.exceptions.UserException;

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
        List<String> stringList2 = Arrays.asList(request.getParameterValues("amount"));//stringList["1","1","8"]
        String indexvalue_string = request.getParameter("update");

        int indexvalue = Integer.parseInt(indexvalue_string);
        int amount = Integer.parseInt(stringList2.get(indexvalue));

        shoppingCart.get(indexvalue).setAmount(amount);

        //calculate price
        int price = 0;
        for (Cupcake c : shoppingCart) {
            int tmp = (c.getPrice() * c.getAmount());
            price += tmp;
        }
        request.getSession().setAttribute("shoppingCart", shoppingCart);
        request.getSession().setAttribute("total", price);
        return pageToShow;
    }
}