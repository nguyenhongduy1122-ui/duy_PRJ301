/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.xml.transform.Result;
import utils.DbUtils;

/**
 *
 * @author Duy
 */
public class UserDAO {

    public ArrayList<UserDTO> list = new ArrayList<>();

    public UserDAO() {

    }

    public UserDTO searchByID(String username) {
        try {
            Connection conn = DbUtils.getConnection();
            String sql = "SELECT * FORM tblUsers "
                    + " WHERE userID='" + username + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            UserDTO user = null;
            while (rs.next()) {
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String password = rs.getString("password");
                String roleID = rs.getString("roleID");
                boolean status = rs.getBoolean("status");
                user = new UserDTO(userID, fullName, password, roleID, status);
            }
            return user;
        } catch (Exception e) {
            return null;
        }

    }

    public UserDTO login(String username, String password) {
        UserDTO u = searchByID(username);
        if (u != null && u.getPassword().equals(password)) {
            return u;
        }
        return null;
    }

}
