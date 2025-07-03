/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author User
 */
public class venta_has_producto {
    public int venta_idfactura;
    public int productos_idproducto;
    
    public venta_has_producto(){
    }

    public venta_has_producto(int venta_idfactura, int venta_cliente_id_usuario, int venta_operaro_id_usuario, int venta_administrador_id_usuario, int productos_idproducto) {
        this.venta_idfactura = venta_idfactura;
        this.productos_idproducto = productos_idproducto;
    }

    public int getVenta_idfactura() {
        return venta_idfactura;
    }

    public void setVenta_idfactura(int venta_idfactura) {
        this.venta_idfactura = venta_idfactura;
    }

    public int getProductos_idproducto() {
        return productos_idproducto;
    }

    public void setProductos_idproducto(int productos_idproducto) {
        this.productos_idproducto = productos_idproducto;
    }

    @Override
    public String toString() {
        return "venta_has_producto{" + "venta_idfactura=" + venta_idfactura + ", productos_idproducto=" + productos_idproducto + '}';
    }

    
    
}
