package cn.figo.servlet.service;

import cn.figo.servlet.entity.Car;
import cn.figo.servlet.entity.Cart;
import cn.figo.servlet.entity.CartItem;

import java.util.List;

public interface CarService {
    public List<CartItem> addItem(Cart cart, CartItem cartItem);
    public double account(Car car);
    public List<CartItem> modifyItemNum(Car car,int pid,int num);
    public List<CartItem> deleteItem(Car car ,int id);
}
