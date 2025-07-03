/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class inventarioDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;


    public boolean insertarInventario(inventario i) {
        String sql = "CALL insertar_inventario(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, i.getCantidad_existente());
            ps.setInt(2, i.getStock_max());
            ps.setInt(3, i.getStock_min());
            ps.setLong(4, i.getNum_lote());
            ps.setDate(5, new java.sql.Date(i.getFecha_vencimiento().getTime()));
            ps.setString(6, i.getObservaciones());
            ps.setDate(7, new java.sql.Date(i.getFecha_entrada().getTime()));
            ps.setDate(8, new java.sql.Date(i.getFecha_salida().getTime()));
            ps.setInt(9, i.getProductos_idproducto());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al insertar inventario: " + e.getMessage());
            return false;
        }
    }

  public List<inventario> listarInventario() {
    List<inventario> lista = new ArrayList<>();
String sql = "SELECT i.*, p.nombre_producto FROM inventario i JOIN producto p ON i.productos_idproducto = p.idproducto";

    try {
        con = Conexion.getConnection();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

while (rs.next()) {
    inventario i = new inventario();
    i.setIdinventario(rs.getInt("idinventario"));
    i.setCantidad_existente(rs.getInt("cantidad_existente"));
    i.setStock_max(rs.getInt("stock_max"));
    i.setStock_min(rs.getInt("stock_min"));
    i.setNum_lote(rs.getInt("num_lote"));
    i.setFecha_vencimiento(rs.getDate("fecha_vencimiento"));
    i.setObservaciones(rs.getString("observaciones"));
    i.setFecha_entrada(rs.getDate("fecha_entrada"));
    i.setFecha_salida(rs.getDate("fecha_salida"));
    i.setProductos_idproducto(rs.getInt("productos_idproducto"));
    i.setNombreProducto(rs.getString("nombre_producto")); // <- Aquí se corrige

    lista.add(i);
}

    } catch (Exception e) {
        System.out.println("Error al listar inventario: " + e.getMessage());
    }

    return lista;
}


    public boolean editarInventario(inventario i) {
        String sql = "UPDATE inventario SET cantidad_existente=?, stock_max=?, stock_min=?, num_lote=?, fecha_vencimiento=?, observaciones=?, fecha_entrada=?, fecha_salida=?, productos_idproducto=? WHERE idinventario=?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, i.getCantidad_existente());
            ps.setInt(2, i.getStock_max());
            ps.setInt(3, i.getStock_min());
            ps.setLong(4, i.getNum_lote());
            ps.setDate(5, new java.sql.Date(i.getFecha_vencimiento().getTime()));
            ps.setString(6, i.getObservaciones());
            ps.setDate(7, new java.sql.Date(i.getFecha_entrada().getTime()));
            ps.setDate(8, new java.sql.Date(i.getFecha_salida().getTime()));
            ps.setInt(9, i.getProductos_idproducto());
            ps.setInt(10, i.getIdinventario());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al editar inventario: " + e.getMessage());
            return false;
        }
    }

    public boolean eliminarInventario(int id) {
        String sql = "DELETE FROM inventario WHERE idinventario=?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al eliminar inventario: " + e.getMessage());
            return false;
        }
    }

    public inventario obtenerInventarioPorId(int id) {
        inventario i = new inventario();
        String sql = "SELECT * FROM inventario WHERE idinventario=?";

        try {
            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                i.setIdinventario(rs.getInt("idinventario"));
                i.setCantidad_existente(rs.getInt("cantidad_existente"));
                i.setStock_max(rs.getInt("stock_max"));
                i.setStock_min(rs.getInt("stock_min"));
                i.setNum_lote(rs.getInt("num_lote"));
                i.setFecha_vencimiento(rs.getDate("fecha_vencimiento"));
                i.setObservaciones(rs.getString("observaciones"));
                i.setFecha_entrada(rs.getDate("fecha_entrada"));
                i.setFecha_salida(rs.getDate("fecha_salida"));
                i.setProductos_idproducto(rs.getInt("productos_idproducto"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener inventario por ID: " + e.getMessage());
        }

        return i;
    }
}
