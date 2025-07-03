/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author User
 */
public class proveedor {
    
    public int idproveedor;
    public String nombre_proveedor;
    public String correo_proveedor;
    public long telefono;
    public String direccion;
    
    public proveedor(){
    }

    public proveedor(int idproveedor, String nombre_proveedor, String correo_proveedor, long telefono, String direccion) {
        this.idproveedor = idproveedor;
        this.nombre_proveedor = nombre_proveedor;
        this.correo_proveedor = correo_proveedor;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getNombre_proveedor() {
        return nombre_proveedor;
    }

    public void setNombre_proveedor(String nombre_proveedor) {
        this.nombre_proveedor = nombre_proveedor;
    }

    public String getCorreo_proveedor() {
        return correo_proveedor;
    }

    public void setCorreo_proveedor(String correo_proveedor) {
        this.correo_proveedor = correo_proveedor;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "proveedor{" + "idproveedor=" + idproveedor + ", nombre_proveedor=" + nombre_proveedor + ", correo_proveedor=" + correo_proveedor + ", telefono=" + telefono + ", direccion=" + direccion + '}';
    }

    
    
}
