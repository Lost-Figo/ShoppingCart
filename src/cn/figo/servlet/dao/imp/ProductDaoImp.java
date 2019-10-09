package cn.figo.servlet.dao.imp;

import cn.figo.servlet.dao.ProductDao;
import cn.figo.servlet.entity.Product;
import cn.figo.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * create table Product (
 *        pid number,
 *        name varchar2(300),
 *        price number,
 *        constraint pro_pk_id primary key(pid)
 *        )
 */
public class ProductDaoImp implements ProductDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    /**
     * 查询所有用户
     * @return
     */
    @Override
    public List<Product> findAll() throws SQLException {
        String sql = "select * from Product";
        return queryRunner.query(sql,new BeanListHandler<Product>(Product.class));
    }
}
