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
        List<String> stringList = Arrays.asList(request.getParameterValues("amount"));//stringList["1","1","8"]
        List<Integer> integerList = new ArrayList<>();
        for (String s : stringList) {
            integerList.add(Integer.parseInt(s)); //convert stringlist to integerList[1,1,8]
        }
        for (int i = 0; i < shoppingCart.size(); ++i) {
            shoppingCart.get(i).setAmount(integerList.get(i));// update cupcakes amount in shoppingCart
        }
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