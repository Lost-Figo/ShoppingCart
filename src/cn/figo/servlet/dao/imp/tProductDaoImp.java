package cn.figo.servlet.dao.imp;

import cn.figo.servlet.dao.tProductDao;
import cn.figo.servlet.entity.tProduct;
import cn.figo.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class tProductDaoImp implements tProductDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    @Override
    public List<tProduct> findall() throws SQLException {
        String sql = "select id,p_name,description,price,p_pic from t_product";
        return queryRunner.query(sql,new BeanListHandler<tProduct>(tProduct.class));
    }
}
