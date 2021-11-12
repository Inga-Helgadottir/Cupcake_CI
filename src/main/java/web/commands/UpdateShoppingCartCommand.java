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
        if (shoppingCart != null) {

            List<Integer> integerList = new ArrayList<>();
            List<String> stringList = Arrays.asList(request.getParameterValues("amount"));
            for (String s : stringList) {
                integerList.add(Integer.parseInt(s));
            }

            for (int i = 0; i < shoppingCart.size(); ++i) {
                shoppingCart.get(i).setAmount(integerList.get(i));
            }
//updates the price attribute in session state.
            int tmp_price = 0;
            for (Cupcake c : shoppingCart) {
                int temp2 = (c.getPrice() * c.getAmount());
                tmp_price += temp2;
            }
            request.getSession().setAttribute("total", tmp_price);
        }
        return pageToShow;
    }


}
