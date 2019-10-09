package cn.figo.servlet.service.imp;

import cn.figo.servlet.entity.Car;
import cn.figo.servlet.entity.Cart;
import cn.figo.servlet.entity.CartItem;
import cn.figo.servlet.service.CarService;

import java.util.List;

public class CarServiceImp implements CarService {
    @Override
    public List<CartItem> addItem(Cart cart, CartItem cartItem) {
        return null;
    }

    @Override
    public double account(Car car) {
        return 0;
    }

    @Override
    public List<CartItem> modifyItemNum(Car car, int pid, int num) {
        return null;
    }

    @Override
    public List<CartItem> deleteItem(Car car, int id) {
        return null;
    }
}
