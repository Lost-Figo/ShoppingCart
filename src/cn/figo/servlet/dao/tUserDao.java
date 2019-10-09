package cn.figo.servlet.dao;

import cn.figo.servlet.entity.tUser;

import java.sql.SQLException;
import java.util.List;

/**
 * insert into t_user values(t_user_seq.nextval,'haoren','123');
 */
public interface tUserDao {
    List<tUser> pwdByname(String name) throws SQLException;
    void addUser(tUser user) throws SQLException;
}
