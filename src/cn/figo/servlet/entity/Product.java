package cn.figo.servlet.entity;

/**
 * create table Product (
 *        pid number,
 *        name varchar2(300),
 *        price number,
 *        constraint pro_pk_id primary key(pid)
 *        )
 */
public class Product {
    private int pid;
    private String name;
    private double price;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
