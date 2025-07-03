/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class productoDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // Insertar producto (usa procedimiento almacenado)
    public boolean insertarProducto(producto p) {
        String sql = "CALL insertar_producto(?, ?, ?, ?, ?, ?)";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre_producto());
            ps.setInt(2, p.getPrecio_producto());
            ps.setString(3, p.getDescripcion_producto());
            ps.setInt(4, Integer.parseInt(p.getNombre_tipo())); // asumiendo nombre_tipo = TINYINT (tipo ID)
            ps.setString(5, p.getRegistrosanitario());
            ps.setInt(6, p.getProveedor_idproveedor());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al insertar producto: " + e.getMessage());
            return false;
        }
    }

    // Listar todos los productos
    public List<producto> listarProductos() {
        List<producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                producto p = new producto();
                p.setIdproducto(rs.getInt("idproducto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setPrecio_producto(rs.getInt("precio_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setNombre_tipo(rs.getString("nombre_tipo"));
                p.setRegistrosanitario(rs.getString("registrosanitario"));
                p.setProveedor_idproveedor(rs.getInt("proveedor_idproveedor"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }

        return lista;
    }

    // Editar producto
    public boolean editarProducto(producto p) {
        String sql = "UPDATE producto SET nombre_producto=?, precio_producto=?, descripcion_producto=?, nombre_tipo=?, registrosanitario=?, proveedor_idproveedor=? WHERE idproducto=?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre_producto());
            ps.setInt(2, p.getPrecio_producto());
            ps.setString(3, p.getDescripcion_producto());
            ps.setString(4, p.getNombre_tipo());
            ps.setString(5, p.getRegistrosanitario());
            ps.setInt(6, p.getProveedor_idproveedor());
            ps.setInt(7, p.getIdproducto());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al editar producto: " + e.getMessage());
            return false;
        }
    }

    // Eliminar producto
    public boolean eliminarProducto(int id) {
        String sql = "DELETE FROM producto WHERE idproducto=?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al eliminar producto: " + e.getMessage());
            return false;
        }
    }

    // Buscar por ID
    public producto obtenerProductoPorId(int id) {
        producto p = new producto();
        String sql = "SELECT * FROM producto WHERE idproducto=?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                p.setIdproducto(rs.getInt("idproducto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setPrecio_producto(rs.getInt("precio_producto"));
                p.setDescripcion_producto(rs.getString("descripcion_producto"));
                p.setNombre_tipo(rs.getString("nombre_tipo"));
                p.setRegistrosanitario(rs.getString("registrosanitario"));
                p.setProveedor_idproveedor(rs.getInt("proveedor_idproveedor"));
            }

        } catch (Exception e) {
            System.out.println("Error al buscar producto: " + e.getMessage());
        }

        return p;
    }
}
