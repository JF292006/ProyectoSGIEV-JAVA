/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

/**
 *
 * @author User
 */
public class TestConexion {
     public static void main(String[] args) {
        try {
            Conexion.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
