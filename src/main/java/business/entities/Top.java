package business.entities;

public class Top {

    int top_id;
    String name;
    int price;

    public Top(int top_id, String name, int price) {
        this.top_id = top_id;
        this.name = name;
        this.price = price;
    }

    public int getTop_id() {
        return top_id;
    }

    public void setTop_id(int top_id) {
        this.top_id = top_id;
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
