/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ventaDAO {

    public List<venta> listarVentas() {
        List<venta> lista = new ArrayList<>();
        String sql = "SELECT * FROM venta";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                venta v = new venta();
                v.setIdfactura(rs.getInt("idfactura"));
                v.setFecha_factura(rs.getDate("fecha_factura"));
                v.setSubtotal(rs.getInt("subtotal"));
                v.setDescuento(rs.getInt("descuento"));
                v.setAbono(rs.getInt("abono"));
                v.setValor_total(rs.getInt("valor_total"));
                v.setObservaciones(rs.getString("observaciones"));
                v.setUsuarios_id_usuario(rs.getInt("usuarios_id_usuario"));
                lista.add(v);
            }
        } catch (SQLException e) {
            System.err.println("Error listando ventas: " + e.getMessage());
        }
        return lista;
    }

    public venta obtenerVentaPorId(int id) {
        venta v = null;
        String sql = "SELECT * FROM venta WHERE idfactura = ?";
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                v = new venta();
                v.setIdfactura(rs.getInt("idfactura"));
                v.setFecha_factura(rs.getDate("fecha_factura"));
                v.setSubtotal(rs.getInt("subtotal"));
                v.setDescuento(rs.getInt("descuento"));
                v.setAbono(rs.getInt("abono"));
                v.setValor_total(rs.getInt("valor_total"));
                v.setObservaciones(rs.getString("observaciones"));
                v.setUsuarios_id_usuario(rs.getInt("usuarios_id_usuario"));
            }
        } catch (SQLException e) {
            System.err.println("Error obteniendo venta: " + e.getMessage());
        }
        return v;
    }

    public void insertarVenta(venta v) {
        String sql = "CALL insertar_venta(?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, new java.sql.Date(v.getFecha_factura().getTime()));
            ps.setInt(2, v.getSubtotal());
            ps.setInt(3, v.getDescuento());
            ps.setInt(4, v.getAbono());
            ps.setInt(5, v.getValor_total());
            ps.setString(6, v.getObservaciones());
            ps.setInt(7, v.getUsuarios_id_usuario());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error insertando venta: " + e.getMessage());
        }
    }

    public void actualizarVenta(venta v) {
        String sql = "UPDATE venta SET fecha_factura=?, subtotal=?, descuento=?, abono=?, valor_total=?, observaciones=?, usuarios_id_usuario=? WHERE idfactura=?";
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, new java.sql.Date(v.getFecha_factura().getTime()));
            ps.setInt(2, v.getSubtotal());
            ps.setInt(3, v.getDescuento());
            ps.setInt(4, v.getAbono());
            ps.setInt(5, v.getValor_total());
            ps.setString(6, v.getObservaciones());
            ps.setInt(7, v.getUsuarios_id_usuario());
            ps.setInt(8, v.getIdfactura());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error actualizando venta: " + e.getMessage());
        }
    }

    public void eliminarVenta(int id) {
        String sql = "DELETE FROM venta WHERE idfactura = ?";
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error eliminando venta: " + e.getMessage());
        }
    }
} 
