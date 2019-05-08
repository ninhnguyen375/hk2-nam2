/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Windows;

import java.sql.*;

/**
 *
 * @author ninh
 */
public class DBHOCVIEN {

    public DBHOCVIEN() {
    }

    public Connection getConnect() {
        try {
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://127.0.0.1:1433;" + "databasename=QLHocVien;user=sa;password=Ninhnguyen375.";
            Class.forName(driver); //load driver
            return DriverManager.getConnection(url);
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            return null;
        }
    }

}
