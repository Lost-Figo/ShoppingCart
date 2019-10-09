package cn.figo.servlet.entity;

import java.util.ArrayList;
import java.util.List;

public class Car {
    //购物车
    private List<CartItem> list = new ArrayList<>();
    private double account;

    public List<CartItem> getList() {
        return list;
    }

    public void setList(List<CartItem> list) {
        this.list = list;
    }

    public double getAccount() {
        return account;
    }

    public void setAccount(double account) {
        this.account = account;
    }
}
