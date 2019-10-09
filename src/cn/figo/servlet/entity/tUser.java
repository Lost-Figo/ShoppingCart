package cn.figo.servlet.entity;

/**
 * create table t_user(
 *  tid number primary key,
 *  uname varchar2(32),
 *  pwd varchar2(32));
 */
public class tUser {
    private int tid;
    private String uname;
    private String pwd;

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "tUser{" +
                "tid=" + tid +
                ", uname='" + uname + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
