/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.*;

/**
 *
 * @author Jorge Alejandro
 */
public class Conexion {

    public static Connection conexion;
    public static Statement consulta;
    public static CallableStatement funcion;

    public Conexion() {
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectosoftware2", "root", "12345");
            consulta=conexion.createStatement();
            funcion=null;
        } catch (ClassNotFoundException ex) {
            System.out.println("Error en la clase");
        } catch (SQLException ex) {
            System.out.println("Error en la conexion");
        }
    }

    public Connection getConexion() {
        return conexion;
    }
}
