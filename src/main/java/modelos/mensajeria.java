/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author User
 */
public class mensajeria {
    public int idmensajeria;
    public String nombre_mensajeria;
    public long tel_mensajeria;
    public String direccion_mensajeria;
    public String cobertura;
    
    public mensajeria(){
    }

    public mensajeria(int idmensajeria, String nombre_mensajeria, long tel_mensajeria, String direccion_mensajeria, String cobertura) {
        this.idmensajeria = idmensajeria;
        this.nombre_mensajeria = nombre_mensajeria;
        this.tel_mensajeria = tel_mensajeria;
        this.direccion_mensajeria = direccion_mensajeria;
        this.cobertura = cobertura;
    }

    public int getIdmensajeria() {
        return idmensajeria;
    }

    public void setIdmensajeria(int idmensajeria) {
        this.idmensajeria = idmensajeria;
    }

    public String getNombre_mensajeria() {
        return nombre_mensajeria;
    }

    public void setNombre_mensajeria(String nombre_mensajeria) {
        this.nombre_mensajeria = nombre_mensajeria;
    }

    public long getTel_mensajeria() {
        return tel_mensajeria;
    }

    public void setTel_mensajeria(long tel_mensajeria) {
        this.tel_mensajeria = tel_mensajeria;
    }

    public String getDireccion_mensajeria() {
        return direccion_mensajeria;
    }

    public void setDireccion_mensajeria(String direccion_mensajeria) {
        this.direccion_mensajeria = direccion_mensajeria;
    }

    public String getCobertura() {
        return cobertura;
    }

    public void setCobertura(String cobertura) {
        this.cobertura = cobertura;
    }

    @Override
    public String toString() {
        return "mensajeria{" + "idmensajeria=" + idmensajeria + ", nombre_mensajeria=" + nombre_mensajeria + ", tel_mensajeria=" + tel_mensajeria + ", direccion_mensajeria=" + direccion_mensajeria + ", cobertura=" + cobertura + '}';
    }
    
    
}
