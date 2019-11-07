package com.answers.utils;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

public class DbcpUtil {
    public static BasicDataSource getBasicDataSource(){
        BasicDataSource bds = new BasicDataSource();
        bds.setUrl("jdbc:mysql://localhost:3306/bwf");
        bds.setUsername("root");
        bds.setPassword("root");
        bds.setDriverClassName("com.mysql.jdbc.Driver");
        bds.setInitialSize(10);
        bds.setMaxActive(8);
        bds.setMinIdle(2);
        return bds;
    }

    public static DataSource getBasicDataSourceByProperties(){
        Properties pro = new Properties();
        DataSource dataSource = null;
        try {
            pro.load(DbcpUtil.class.getResourceAsStream("dbconfig.properties"));
            dataSource = BasicDataSourceFactory.createDataSource(pro);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }


        return dataSource;
    }
}
