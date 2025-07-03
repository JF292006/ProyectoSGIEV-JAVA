/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author User
 */
public class producto {
    public int idproducto;
    public String nombre_producto;
    public int precio_producto;
    public String descripcion_producto;
    public String nombre_tipo;
    public String registrosanitario;
    public int proveedor_idproveedor;
    
    public producto(){
    }

    public producto(int idproducto, String nombre_producto, int precio_producto, String descripcion_producto, String nombre_tipo, String registrosanitario, int proveedor_idproveedor) {
        this.idproducto = idproducto;
        this.nombre_producto = nombre_producto;
        this.precio_producto = precio_producto;
        this.descripcion_producto = descripcion_producto;
        this.nombre_tipo = nombre_tipo;
        this.registrosanitario = registrosanitario;
        this.proveedor_idproveedor = proveedor_idproveedor;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public int getPrecio_producto() {
        return precio_producto;
    }

    public void setPrecio_producto(int precio_producto) {
        this.precio_producto = precio_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    public String getNombre_tipo() {
        return nombre_tipo;
    }

    public void setNombre_tipo(String nombre_tipo) {
        this.nombre_tipo = nombre_tipo;
    }

    public String getRegistrosanitario() {
        return registrosanitario;
    }

    public void setRegistrosanitario(String registrosanitario) {
        this.registrosanitario = registrosanitario;
    }

    public int getProveedor_idproveedor() {
        return proveedor_idproveedor;
    }

    public void setProveedor_idproveedor(int proveedor_idproveedor) {
        this.proveedor_idproveedor = proveedor_idproveedor;
    }

    @Override
    public String toString() {
        return "producto{" + "idproducto=" + idproducto + ", nombre_producto=" + nombre_producto + ", precio_producto=" + precio_producto + ", descripcion_producto=" + descripcion_producto + ", nombre_tipo=" + nombre_tipo + ", registrosanitario=" + registrosanitario + ", proveedor_idproveedor=" + proveedor_idproveedor + '}';
    }

    
}
