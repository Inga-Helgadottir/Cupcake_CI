package business.entities;

public class Bot {
    int bot_id;
    String name;
    int price;

    public Bot(int bot_id, String name, int price) {
        this.bot_id = bot_id;
        this.name = name;
        this.price = price;
    }

    public int getBot_id() {
        return bot_id;
    }

    public void setBot_id(int bot_id) {
        this.bot_id = bot_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
