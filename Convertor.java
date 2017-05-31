/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import JSON.JSONArray;
import JSON.JSONObject;
import db.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tuan Anh
 */
public class Convertor {

    public static JSONArray convertToJSON() throws Exception {
        DatabaseConnection db = new DatabaseConnection();
        Connection con = db.setConnection();
//        String sql = "Select Distinct Movie_Name From movie";
//        String sql = "Select Distinct Movie_Actor From movie";
        String sql = "Select Distinct Movie_Director From movie";
        ResultSet rs = db.getResult(sql, con);
        JSONArray jsonArray = new JSONArray();

        while (rs.next()) {
            int total_rows = rs.getMetaData().getColumnCount();
            JSONObject obj = new JSONObject();
            for (int i = 0; i < total_rows; i++) {
                obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(Locale.ENGLISH), rs.getObject(i + 1));
                jsonArray.put(obj);
            }
        }
        return jsonArray;
    }
    public static void main(String[] args) {
        try {
            String abc = convertToJSON().toString();
            System.out.println("hello");
        } catch (Exception ex) {
            Logger.getLogger(Convertor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
