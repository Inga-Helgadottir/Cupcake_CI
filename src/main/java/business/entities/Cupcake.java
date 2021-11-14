package business.entities;

public class Cupcake {

    String top;
    String bot;
    int amount;
    String description;
    int price;
    int bot_price;
    int top_price;


    public Cupcake(String top, String bot, int amount) {
        this.top = top;
        this.bot = bot;
        this.amount = amount;
    }


    public String getBot() {
        return bot;
    }

    public void setBot(String bot) {
        this.bot = bot;
    }

    public int getBot_price() {
        return bot_price;
    }

    public void setBot_price(int bot_price) {
        this.bot_price = bot_price;
    }

    public int getTop_price() {
        return top_price;
    }

    public void setTop_price(int top_price) {
        this.top_price = top_price;
    }

    public String getTop() {
        return top;
    }

    public void setTop(String top) {
        this.top = top;
    }


    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
