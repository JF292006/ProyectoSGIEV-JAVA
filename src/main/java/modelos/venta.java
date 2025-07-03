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
public class venta {
    public int idfactura;
    public Date fecha_factura;
    public int subtotal;
    public int descuento;
    public int abono;
    public int valor_total;
    public String observaciones;
    public int usuarios_id_usuario;
    
    public venta(){
    }

    public venta(int idfactura, Date fecha_factura, int subtotal, int descuento, int abono, int valor_total, String observaciones, int usuarios_id_usuario) {
        this.idfactura = idfactura;
        this.fecha_factura = fecha_factura;
        this.subtotal = subtotal;
        this.descuento = descuento;
        this.abono = abono;
        this.valor_total = valor_total;
        this.observaciones = observaciones;
        this.usuarios_id_usuario = usuarios_id_usuario;
    }

    public int getIdfactura() {
        return idfactura;
    }

    public void setIdfactura(int idfactura) {
        this.idfactura = idfactura;
    }

    public Date getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(Date fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }

    public int getDescuento() {
        return descuento;
    }

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }

    public int getAbono() {
        return abono;
    }

    public void setAbono(int abono) {
        this.abono = abono;
    }

    public int getValor_total() {
        return valor_total;
    }

    public void setValor_total(int valor_total) {
        this.valor_total = valor_total;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public int getUsuarios_id_usuario() {
        return usuarios_id_usuario;
    }

    public void setUsuarios_id_usuario(int usuarios_id_usuario) {
        this.usuarios_id_usuario = usuarios_id_usuario;
    }

    @Override
    public String toString() {
        return "venta{" + "idfactura=" + idfactura + ", fecha_factura=" + fecha_factura + ", subtotal=" + subtotal + ", descuento=" + descuento + ", abono=" + abono + ", valor_total=" + valor_total + ", observaciones=" + observaciones + ", usuarios_id_usuario=" + usuarios_id_usuario + '}';
    }
    
    
    
}
