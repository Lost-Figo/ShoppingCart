package cn.figo.servlet.dao.imp;

import cn.figo.servlet.dao.tUserDao;
import cn.figo.servlet.entity.tUser;
import cn.figo.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class tUserDaoImp implements tUserDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    /**
     * 通过名称查找密码
     * @param name
     * @return
     * @throws SQLException
     */
    @Override
    public List<tUser> pwdByname(String name) throws SQLException {
        String sql = "select pwd from t_user where uname = ?";
        return queryRunner.query(sql,new BeanListHandler<>(tUser.class),name);
    }

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void addUser(tUser user) throws SQLException {
        String sql = "insert into t_user(tid,uname,pwd) values(t_user_seq.nextval,?,?)";
        queryRunner.update(sql,user.getUname(),user.getPwd());
    }
}
