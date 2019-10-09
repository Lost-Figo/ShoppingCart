package cn.figo.servlet.dao;

import cn.figo.servlet.entity.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    List<Product> findAll() throws SQLException;
}
