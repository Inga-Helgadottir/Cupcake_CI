package business.entities;

import java.sql.Timestamp;

public class Order {
    int order_id;
    int user_id;
    int price;
    Timestamp ts;

    public Order(int order_id, int user_id, int price, Timestamp ts) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.price = price;
        this.ts = ts;
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
