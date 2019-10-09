package cn.figo.servlet.dao;

import cn.figo.servlet.entity.tProduct;

import java.sql.SQLException;
import java.util.List;

public interface tProductDao {
    List<tProduct> findall() throws SQLException;
}
