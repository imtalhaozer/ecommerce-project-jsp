package com.example.ecommerceprojectjsp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
    private static Connection connection=null;
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if(connection==null){
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection= DriverManager.getConnection("jdbc:sqlserver://localhost:1453;user=sa;password=admin123456789");
            System.out.print("connected");
        }
        return connection;
    }
}
