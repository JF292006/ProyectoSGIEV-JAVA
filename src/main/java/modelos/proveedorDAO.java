/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class proveedorDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();

    // Listar todos los proveedores
    public List<proveedor> listarProveedores() {
        List<proveedor> lista = new ArrayList<>();
        String sql = "SELECT * FROM proveedor";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                proveedor p = new proveedor();
                p.setIdproveedor(rs.getInt("idproveedor"));
                p.setNombre_proveedor(rs.getString("nombre_proveedor"));
                p.setCorreo_proveedor(rs.getString("correo_proveedor"));
                p.setTelefono(rs.getLong("telefono"));
                p.setDireccion(rs.getString("direccion"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al listar proveedores: " + e.getMessage());
        }

        return lista;
    }

    // Editar proveedor
    public boolean editarProveedor(proveedor p) {
        String sql = "UPDATE proveedor SET nombre_proveedor=?, correo_proveedor=?, telefono=?, direccion=? WHERE idproveedor=?";
        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre_proveedor());
            ps.setString(2, p.getCorreo_proveedor());
            ps.setLong(3, p.getTelefono());
            ps.setString(4, p.getDireccion());
            ps.setInt(5, p.getIdproveedor());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al editar proveedor: " + e.getMessage());
            return false;
        }
    }

    // Eliminar proveedor
    public boolean eliminarProveedor(int id) {
        String sql = "DELETE FROM proveedor WHERE idproveedor=?";
        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al eliminar proveedor: " + e.getMessage());
            return false;
        }
    }

    // Buscar proveedor por ID (opcional para el modal de editar)
    public proveedor obtenerProveedorPorId(int id) {
        proveedor p = new proveedor();
        String sql = "SELECT * FROM proveedor WHERE idproveedor=?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                p.setIdproveedor(rs.getInt("idproveedor"));
                p.setNombre_proveedor(rs.getString("nombre_proveedor"));
                p.setCorreo_proveedor(rs.getString("correo_proveedor"));
                p.setTelefono(rs.getLong("telefono"));
                p.setDireccion(rs.getString("direccion"));
            }

        } catch (Exception e) {
            System.out.println("Error al buscar proveedor: " + e.getMessage());
        }

        return p;
    }
    // Insertar proveedor
public boolean insertarProveedor(proveedor p) {
    String sql = "CALL insertar_proveedor(?, ?, ?, ?)";

    try {
        con = Conexion.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, p.getNombre_proveedor());
        ps.setString(2, p.getCorreo_proveedor());
        ps.setLong(3, p.getTelefono());
        ps.setString(4, p.getDireccion());

        ps.executeUpdate();
        return true;
    } catch (Exception e) {
        System.out.println("Error al insertar proveedor: " + e.getMessage());
        return false;
    }
}

}
