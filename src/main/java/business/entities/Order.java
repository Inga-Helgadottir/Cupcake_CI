package business.entities;

import java.sql.Timestamp;

public class Order {
    int orderId;
    int price;
    int quantity;
    String userEmail;
    String topName;
    String botName;
    Timestamp date;

    public Order(int orderId, int price, int quantity, String userEmail, String topName, String botName, Timestamp date) {
        this.orderId = orderId;
        this.price = price;
        this.quantity = quantity;
        this.userEmail = userEmail;
        this.topName = topName;
        this.botName = botName;
        this.date = date;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getTopName() {
        return topName;
    }

    public void setTopName(String topName) {
        this.topName = topName;
    }

    public String getBotName() {
        return botName;
    }

    public void setBotName(String botName) {
        this.botName = botName;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

}
