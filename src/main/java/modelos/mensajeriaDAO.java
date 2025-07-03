/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import config.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class mensajeriaDAO {
   
    public boolean agregarMensajeria(mensajeria m) {
    String sql = "{CALL insertar_mensajeria(?, ?, ?, ?)}";

    try (Connection con = Conexion.getConnection();
         CallableStatement cs = con.prepareCall(sql)) {

        cs.setString(1, m.getNombre_mensajeria());
        cs.setLong(2, m.getTel_mensajeria());
        cs.setString(3, m.getDireccion_mensajeria());
        cs.setString(4, m.getCobertura());

        cs.execute();
        return true;

    } catch (SQLException e) {
        System.err.println("❌ Error al ejecutar el procedimiento insertar_mensajeria: " + e.getMessage());
        return false;
    }
}
   
    public List<mensajeria> listarMensajeria() {
    List<mensajeria> lista = new ArrayList<>();
    String sql = "SELECT * FROM mensajeria";

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            mensajeria m = new mensajeria();
            m.setIdmensajeria(rs.getInt("idmensajeria"));
            m.setNombre_mensajeria(rs.getString("nombre_mensajeria"));
            m.setTel_mensajeria(rs.getLong("tel_mensajeria"));
            m.setDireccion_mensajeria(rs.getString("direccion_mensajeria"));
            m.setCobertura(rs.getString("cobertura"));

            lista.add(m);
        }
System.out.println("✔ Mensajerías encontradas: " + lista.size());
    } catch (SQLException e) {
        System.err.println("❌ Error al listar mensajerías: " + e.getMessage());
    }

    return lista;
}
   
    public boolean eliminarMensajeria(int id) {
    String sql = "DELETE FROM mensajeria WHERE idmensajeria = ?";

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);
        int filas = ps.executeUpdate();
        return filas > 0;

    } catch (SQLException e) {
        System.err.println("❌ Error al eliminar mensajería: " + e.getMessage());
        return false;
    }
}
   
    public boolean actualizarMensajeria(mensajeria m) {
    String sql = "UPDATE mensajeria SET nombre_mensajeria = ?, tel_mensajeria = ?, direccion_mensajeria = ?, cobertura = ? WHERE idmensajeria = ?";

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, m.getNombre_mensajeria());
        ps.setLong(2, m.getTel_mensajeria());
        ps.setString(3, m.getDireccion_mensajeria());
        ps.setString(4, m.getCobertura());
        ps.setInt(5, m.getIdmensajeria());

        int filas = ps.executeUpdate();
        return filas > 0;

    } catch (SQLException e) {
        System.err.println("❌ Error al actualizar mensajería: " + e.getMessage());
        return false;
    }
}
   
    public mensajeria obtenerMensajeriaPorId(int id) {
    String sql = "SELECT * FROM mensajeria WHERE idmensajeria = ?";
    mensajeria m = null;

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            m = new mensajeria();
            m.setIdmensajeria(rs.getInt("idmensajeria"));
            m.setNombre_mensajeria(rs.getString("nombre_mensajeria"));
            m.setTel_mensajeria(rs.getLong("tel_mensajeria"));
            m.setDireccion_mensajeria(rs.getString("direccion_mensajeria"));
            m.setCobertura(rs.getString("cobertura"));
        }

    } catch (SQLException e) {
        System.err.println("❌ Error al obtener mensajería por ID: " + e.getMessage());
    }

    return m;
}
   
   
   
}