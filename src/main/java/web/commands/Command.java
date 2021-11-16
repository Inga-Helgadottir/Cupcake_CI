package web.commands;

import business.exceptions.UserException;
import business.persistence.Database;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Command
{
    //Return a token string from the execute method to make a client side redirect,
    // instead of a server side (forward) redirect
    public final static String REDIRECT_INDICATOR = "#*redirect*#_###_";
    public final static String WAS_NOT_FOUND_COMMAND ="404_NOT_FOUND";

    private static HashMap<String, Command> commands;
    public static Database database;

    private static void initCommands(Database database)
    {
        commands = new HashMap<>();
        commands.put("index", new CommandUnprotectedPage("index"));
        commands.put("loginpage", new CommandUnprotectedPage("loginpage"));
        commands.put("orderpage", new CommandUnprotectedPage("bestil_cupcakespage"));
        commands.put("takpage", new CommandUnprotectedPage("tak_for_din_bestilling"));
        commands.put("ordrehistorik", new CommandUnprotectedPage("ordrehistorik"));
        commands.put("profile", new CommandUnprotectedPage("profile"));
        commands.put("kurv", new CommandUnprotectedPage("lagt_i_kurv"));
        commands.put("indbetal", new CommandUnprotectedPage("indbetal_penge"));
        commands.put("orders", new CommandUnprotectedPage("orders"));
        commands.put("bestil", new CommandUnprotectedPage("bestil_cupcakespage"));

        commands.put("logincommand", new LoginCommand(""));
        commands.put("logoutcommand", new LogoutCommand(""));
        commands.put("registerpage", new CommandUnprotectedPage("registerpage"));
        commands.put("registercommand", new RegisterCommand(""));
        commands.put("customerpage", new CommandProtectedPage("customerpage", "customer"));

        commands.put("admin", new CommandProtectedPage("admin", "employee"));
        commands.put("adminpage", new CommandProtectedPage("admin", "employee"));

        commands.put("adminBalance", new UpdateBalance("admin", "employee"));
        commands.put("adminKunder", new AdminShowCustomers("admin_manage_kunder", "employee"));

        commands.put("adminOrders", new AdminShowOrders("admin_manage_orders","employee"));
        commands.put("adminDeleteOrders", new AdminDeleteOrder("admin_manage_orders","employee"));

        commands.put("addtocart", new AddToCartCommand("lagt_i_kurv","customer"));
    }

    public static Command fromPath(
            HttpServletRequest request,
            Database db)
    {
        String action = request.getPathInfo().replaceAll("^/+", "");
        System.out.println("--> " + action);

        if (commands == null)
        {
            database = db;
            initCommands(database);
        }

        return commands.getOrDefault(action, new CommandUnknown());   // unknowncommand is default
    }

    public abstract String execute(
            HttpServletRequest request,
            HttpServletResponse response)
            throws UserException;

}
