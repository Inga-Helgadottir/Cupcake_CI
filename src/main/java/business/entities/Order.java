package business.entities;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Order {
    int order_id;
    int user_id;
    int price;
    Timestamp ts;
    private List<Cupcake> orderItems;
    String status;

    public Order(int order_id, int user_id, int price, Timestamp ts) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.price = price;
        this.ts = ts;
        this.orderItems = new ArrayList<>();
    }

    public List<Cupcake> getOrdreItems() {
        return orderItems;
    }

    public void setOrderItems(List<Cupcake> orderItems) {
        this.orderItems = orderItems;
    }

    public List<Cupcake> getOrderItems() {
        return orderItems;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void addToOrderItems(Cupcake cupcake) {
        this.orderItems.add(cupcake);
    }

    public void removeFromOrderItems(Cupcake cupcake) {
        this.orderItems.remove(cupcake);
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Timestamp getTs() {
        return ts;
    }

    public void setTs(Timestamp ts) {
        this.ts = ts;
    }
}
