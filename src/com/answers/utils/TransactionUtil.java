package com.answers.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

public class TransactionUtil {
    private static ThreadLocal<Connection> threadLocal = new ThreadLocal<>();
    private static DataSource dateSource=  DbcpUtil.getBasicDataSourceByProperties();

    //从ThreadLocal中获取连接
    public static Connection getConnection(){
        Connection conn = threadLocal.get(); //获取ThreadLocal中的变量，如果没有，则返回null，如果有返回的是其副本
        if(conn==null){
            try {
                conn = dateSource.getConnection();
                threadLocal.set(conn);  //从ThreadLocal中获取副本
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

    //开启事务
    public static void startTransaction(){
        Connection conn = getConnection();
        if(conn!=null){
            try {
                conn.setAutoCommit(false);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    //成功(提交事务)
    public static void  commitTransaction(){
        Connection conn = getConnection();
        if(conn!=null){
            try {
                conn.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    //失败(回滚)
    public static void  rollbackTransaction(){
        Connection conn = getConnection();
        if(conn!=null){
            try {
                conn.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //关闭连接
    public static void close(){
        Connection conn = getConnection();
        if(conn!=null){
            try {
                conn.close();
                conn=null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        threadLocal.remove();

    }


}
