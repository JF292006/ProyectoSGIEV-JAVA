/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import java.util.Date;

/**
 *
 * @author User
 */
public class usuarios {
    public int id_usuario;
    public long num_identificacion;
    public String tipo_usu;
    public String clave;
    public String p_nombre;
    public String s_nombre;
    public String p_apellido;
    public String s_apellido;
    public String correo;
    public long telefono;
    public long salario;
    public Date fecha_nacimiento;
    public String direccion;
    
    public usuarios(){
    }

    public usuarios(int id_usuario, long num_identificacion, String tipo_usu, String clave, String p_nombre, String s_nombre, String p_apellido, String s_apellido, String correo, long telefono, long salario, Date fecha_nacimiento, String direccion) {
        this.id_usuario = id_usuario;
        this.num_identificacion = num_identificacion;
        this.tipo_usu = tipo_usu;
        this.clave = clave;
        this.p_nombre = p_nombre;
        this.s_nombre = s_nombre;
        this.p_apellido = p_apellido;
        this.s_apellido = s_apellido;
        this.correo = correo;
        this.telefono = telefono;
        this.salario = salario;
        this.fecha_nacimiento = fecha_nacimiento;
        this.direccion = direccion;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public long getNum_identificacion() {
        return num_identificacion;
    }

    public void setNum_identificacion(long num_identificacion) {
        this.num_identificacion = num_identificacion;
    }

    public String getTipo_usu () {
        return tipo_usu;
    }

    public void setTipo_usu(String tipo_usu) {
        this.tipo_usu = tipo_usu;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getP_nombre() {
        return p_nombre;
    }

    public void setP_nombre(String p_nombre) {
        this.p_nombre = p_nombre;
    }

    public String getS_nombre() {
        return s_nombre;
    }

    public void setS_nombre(String s_nombre) {
        this.s_nombre = s_nombre;
    }

    public String getP_apellido() {
        return p_apellido;
    }

    public void setP_apellido(String p_apellido) {
        this.p_apellido = p_apellido;
    }

    public String getS_apellido() {
        return s_apellido;
    }

    public void setS_apellido(String s_apellido) {
        this.s_apellido = s_apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public long getSalario() {
        return salario;
    }

    public void setSalario(long salario) {
        this.salario = salario;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "usuarios{" + "id_usuario=" + id_usuario + ", num_identificacion=" + num_identificacion + ", tipo_usu=" + tipo_usu + ", clave=" + clave + ", p_nombre=" + p_nombre + ", s_nombre=" + s_nombre + ", p_apellido=" + p_apellido + ", s_apellido=" + s_apellido + ", correo=" + correo + ", telefono=" + telefono + ", salario=" + salario + ", fecha_nacimiento=" + fecha_nacimiento + ", direccion=" + direccion + '}';
    }

    public Object getTipo() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

   
    
    
}
