/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;
import java.util.ArrayList;
import java.util.List;
import config.Conexion;
import config.Encriptador;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class usuarioDAO {

    public usuarios validarUsuario(String correo, String contrasena) {
        usuarios usuario = null;
        String sql = "SELECT p_nombre, correo, tipo_usu FROM usuarios WHERE correo = ? AND clave = ?";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String claveEncriptada = Encriptador.encriptarSHA256(contrasena);

            ps.setString(1, correo);
            ps.setString(2, claveEncriptada);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String nombre = rs.getString("p_nombre");
                String tipo = rs.getString("tipo_usu");

                usuario = new usuarios();
                usuario.setP_nombre(nombre);
                usuario.setCorreo(correo);
                usuario.setTipo_usu(tipo);
            }

        } catch (SQLException e) {
            System.err.println("Error validando usuario: " + e.getMessage());
        }

        return usuario;
    }

    // 👉 NUEVO MÉTODO PARA INSERTAR USUARIO
    public void insertarUsuario(long num_id, String tipo, String clave, String pnom, String snom,
                                String papell, String sapell, String correo, long tel, long salario,
                                String fecha_nac, String direccion) {

        String sql = "INSERT INTO usuarios(num_identificacion, tipo_usu, clave, p_nombre, s_nombre, " +
                     "p_apellido, s_apellido, correo, telefono, salario, fecha_nacimiento, direccion) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String claveEncriptada = Encriptador.encriptarSHA256(clave);

            ps.setLong(1, num_id);
            ps.setString(2, tipo);
            ps.setString(3, claveEncriptada);
            ps.setString(4, pnom);
            ps.setString(5, snom);
            ps.setString(6, papell);
            ps.setString(7, sapell);
            ps.setString(8, correo);
            ps.setLong(9, tel);
            ps.setLong(10, salario);
            ps.setString(11, fecha_nac);
            ps.setString(12, direccion);

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error insertando usuario: " + e.getMessage());
        }
    }
    public void eliminarUsuario(long id) {
    String sql = "DELETE FROM usuarios WHERE id_usuario = ?";
    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setLong(1, id);
        ps.executeUpdate();
    } catch (SQLException e) {
        System.err.println("Error eliminando usuario: " + e.getMessage());
    }
}
public List<usuarios> listarUsuarios() {
    List<usuarios> lista = new ArrayList<>();
    String sql = "SELECT id_usuario, p_nombre, p_apellido, tipo_usu, fecha_nacimiento FROM usuarios";

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            usuarios u = new usuarios();
            u.setId_usuario(rs.getInt("id_usuario"));
            u.setP_nombre(rs.getString("p_nombre"));
            u.setP_apellido(rs.getString("p_apellido"));
            u.setTipo_usu(rs.getString("tipo_usu"));
            u.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
            lista.add(u);
        }

    } catch (SQLException e) {
        System.err.println("Error listando usuarios: " + e.getMessage());
    }

    return lista;
}
public void actualizarUsuario(usuarios u) {
    String sql = "UPDATE usuarios SET num_identificacion = ?, tipo_usu = ?, clave = ?, p_nombre = ?, s_nombre = ?, " +
                 "p_apellido = ?, s_apellido = ?, correo = ?, telefono = ?, salario = ?, fecha_nacimiento = ?, direccion = ? " +
                 "WHERE id_usuario = ?";

    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        // Encriptamos la clave antes de enviarla al UPDATE
        String claveEncriptada = Encriptador.encriptarSHA256(u.getClave());

        ps.setLong(1, u.getNum_identificacion());
        ps.setString(2, u.getTipo_usu());
        ps.setString(3, claveEncriptada);
        ps.setString(4, u.getP_nombre());
        ps.setString(5, u.getS_nombre());
        ps.setString(6, u.getP_apellido());
        ps.setString(7, u.getS_apellido());
        ps.setString(8, u.getCorreo());
        ps.setLong(9, u.getTelefono());
        ps.setLong(10, u.getSalario());
        ps.setDate(11, (Date) u.getFecha_nacimiento());
        ps.setString(12, u.getDireccion());
        ps.setInt(13, u.getId_usuario());

        ps.executeUpdate();

    } catch (SQLException e) {
        System.err.println("Error actualizando usuario: " + e.getMessage());
    }
}
public usuarios obtenerUsuarioPorId(int id) {
    usuarios u = null;
    String sql = "SELECT * FROM usuarios WHERE id_usuario = ?";
    try (Connection con = Conexion.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            u = new usuarios();
            u.setId_usuario(rs.getInt("id_usuario"));
            u.setNum_identificacion((long) rs.getDouble("num_identificacion"));
            u.setTipo_usu(rs.getString("tipo_usu"));
            u.setClave(rs.getString("clave"));
            u.setP_nombre(rs.getString("p_nombre"));
            u.setS_nombre(rs.getString("s_nombre"));
            u.setP_apellido(rs.getString("p_apellido"));
            u.setS_apellido(rs.getString("s_apellido"));
            u.setCorreo(rs.getString("correo"));
            u.setTelefono((long) rs.getDouble("telefono"));
            u.setSalario((long) rs.getDouble("salario"));
            u.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
            u.setDireccion(rs.getString("direccion"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return u;
}
public List<usuarios> buscarUsuarios(String filtro) {
    List<usuarios> lista = new ArrayList<>();
    String sql = "SELECT * FROM usuarios WHERE " +
                 "LOWER(p_nombre) LIKE ? OR " +
                 "LOWER(p_apellido) LIKE ? OR " +
                 "LOWER(tipo_usu) LIKE ?";
    try {
        Connection con = Conexion.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        String wildcard = "%" + filtro.toLowerCase() + "%";
        ps.setString(1, wildcard);
        ps.setString(2, wildcard);
        ps.setString(3, wildcard);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            usuarios u = new usuarios();
            u.setId_usuario(rs.getInt("id_usuario"));
            u.setNum_identificacion(rs.getLong("num_identificacion"));
            u.setTipo_usu(rs.getString("tipo_usu"));
            u.setClave(rs.getString("clave"));
            u.setP_nombre(rs.getString("p_nombre"));
            u.setS_nombre(rs.getString("s_nombre"));
            u.setP_apellido(rs.getString("p_apellido"));
            u.setS_apellido(rs.getString("s_apellido"));
            u.setCorreo(rs.getString("correo"));
            u.setTelefono(rs.getLong("telefono"));
            u.setSalario(rs.getLong("salario"));
            u.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
            u.setDireccion(rs.getString("direccion"));
            lista.add(u);
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        System.err.println("Error en buscarUsuarios: " + e.getMessage());
    }
    return lista;
}


}
