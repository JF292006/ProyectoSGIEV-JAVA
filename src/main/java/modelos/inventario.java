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
public class inventario {
    public int idinventario;
    public int cantidad_existente;
    public int stock_max;
    public int stock_min;
    public int num_lote;
    public Date fecha_vencimiento;
    public String observaciones;
    public Date fecha_entrada;
    public Date fecha_salida;
    public int productos_idproducto;
    
    public inventario(){
    }

    public inventario(int idinventario, int cantidad_existente, int stock_max, int stock_min, int num_lote, Date fecha_vencimiento, String observaciones, Date fecha_entrada, Date fecha_salida, int productos_idproducto) {
        this.idinventario = idinventario;
        this.cantidad_existente = cantidad_existente;
        this.stock_max = stock_max;
        this.stock_min = stock_min;
        this.num_lote = num_lote;
        this.fecha_vencimiento = fecha_vencimiento;
        this.observaciones = observaciones;
        this.fecha_entrada = fecha_entrada;
        this.fecha_salida = fecha_salida;
        this.productos_idproducto = productos_idproducto;
    }

    public int getIdinventario() {
        return idinventario;
    }

    public void setIdinventario(int idinventario) {
        this.idinventario = idinventario;
    }

    public int getCantidad_existente() {
        return cantidad_existente;
    }

    public void setCantidad_existente(int cantidad_existente) {
        this.cantidad_existente = cantidad_existente;
    }

    public int getStock_max() {
        return stock_max;
    }

    public void setStock_max(int stock_max) {
        this.stock_max = stock_max;
    }

    public int getStock_min() {
        return stock_min;
    }

    public void setStock_min(int stock_min) {
        this.stock_min = stock_min;
    }

    public int getNum_lote() {
        return num_lote;
    }

    public void setNum_lote(int num_lote) {
        this.num_lote = num_lote;
    }

    public Date getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(Date fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFecha_entrada() {
        return fecha_entrada;
    }

    public void setFecha_entrada(Date fecha_entrada) {
        this.fecha_entrada = fecha_entrada;
    }

    public Date getFecha_salida() {
        return fecha_salida;
    }

    public void setFecha_salida(Date fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    public int getProductos_idproducto() {
        return productos_idproducto;
    }

    public void setProductos_idproducto(int productos_idproducto) {
        this.productos_idproducto = productos_idproducto;
    }

    private String nombreProducto;

public String getNombreProducto() {
    return nombreProducto;
}

public void setNombreProducto(String nombreProducto) {
    this.nombreProducto = nombreProducto;
}

    @Override
    public String toString() {
        return "inventario{" + "idinventario=" + idinventario + ", cantidad_existente=" + cantidad_existente + ", stock_max=" + stock_max + ", stock_min=" + stock_min + ", num_lote=" + num_lote + ", fecha_vencimiento=" + fecha_vencimiento + ", observaciones=" + observaciones + ", fecha_entrada=" + fecha_entrada + ", fecha_salida=" + fecha_salida + ", productos_idproducto=" + productos_idproducto + '}';
    }

    
}
