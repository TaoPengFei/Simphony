package org.simphony.prd.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;


/*
 * 璇ュ鐨凥andleMySQL璐熻矗涓庢湰鍦版暟鎹簱杩炴帴锛屽洜姝ゅ彧闇�瑕佷慨鏀规暟鎹簱鍚嶏紝鐢ㄦ埛鍚嶏紝瀵嗙爜鍗冲彲
 **/
public class SqlserverUtils {

    private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String url = "jdbc:sqlserver://10.93.168.4:1433;DatabaseName=Location_Activity_DB";//鏁版嵁搴撳湴鍧�浠ュ強鍚嶇О
    /*private String user = "sa";//鏁版嵁搴撶敤鎴峰悕
    private String password = "SIM29@123";//鏁版嵁搴撶敤鎴峰瘑鐮�*/
    private String user = "Sbuxsim";//鏁版嵁搴撶敤鎴峰悕
    private String password = "Welcome1@";//鏁版嵁搴撶敤鎴峰瘑鐮�
    private Connection conn;


    public Statement linkSqlserver(){

        try {
            Class.forName(driver);//鍔犺浇椹卞姩绋嬪簭
            conn = DriverManager.getConnection(url, user, password);//杩炴帴鏁版嵁搴�
            if(!conn.isClosed())
                System.out.println("Succeeded connecting to the Database!");
            Statement statement = conn.createStatement();// statement鐢ㄦ潵鎵цSQL璇彞
            return statement;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            System.err.println("HandleSqlserver Class.forName鍑洪敊");
            System.err.println(e.getMessage());
            e.printStackTrace();
            return null;
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            System.err.println("HandleSqlserver Connection鍑洪敊");
            System.err.println(e.getMessage());
            //e.printStackTrace();
            return null;
        }

    }

    public PreparedStatement linkSqlserver(String sql){

        try {
            Class.forName(driver);//鍔犺浇椹卞姩绋嬪簭
            Connection conn = DriverManager.getConnection(url, user, password);//杩炴帴鏁版嵁搴�
            if(!conn.isClosed())
                System.out.println("Succeeded connecting to the Database!");
            PreparedStatement preStatement = conn.prepareStatement(sql);// PreparedStatement鐢ㄦ潵鎵цSQL璇彞
            return preStatement;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            System.err.println("HandleMySQL Pre Class.forName鍑洪敊");
            System.err.println(e.getMessage());
            //e.printStackTrace();
            return null;
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            System.err.println("HandleMySQL Pre Connection鍑洪敊");
            System.err.println(e.getMessage());
            //e.printStackTrace();
            return null;
        }

    }

    public void closeSqlserver(Statement statement){
        try {
            if(statement == null)
                return;
            statement.close();
            System.out.println("close the link to datebase");
            //conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            System.err.println("HandleSqlserver Pre closeMySQL鍑洪敊");
            System.err.println(e.getMessage());
        }
    }

    public void closeSqlserver(PreparedStatement preStatement){
        try {
            if(preStatement == null)
                return;
            preStatement.close();
            System.out.println("close the link to datebase");
            //conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            System.err.println("HandleMySQL Pre closeMySQL鍑洪敊");
            System.err.println(e.getMessage());
        }
    }
}
