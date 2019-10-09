package cn.figo.servlet.entity;

/**
 * create table t_product(
 *  id number primary key ,
 *  p_name varchar2(20) not null,
 *  description varchar2(100) default null,
 *  price number(7,2) not null,
 *  p_pic varchar2(20) default null
 * );
 */
public class tProduct {
    private int id;
    private String p_name;
    private String description;
    private int price;
    private String p_pic;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
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

    public String getP_pic() {
        return p_pic;
    }

    public void setP_pic(String p_pic) {
        this.p_pic = p_pic;
    }

    @Override
    public String toString() {
        return "tProduct{" +
                "id=" + id +
                ", p_name='" + p_name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", p_pic='" + p_pic + '\'' +
                '}';
    }
}
