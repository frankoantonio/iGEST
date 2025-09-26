/*
 * Document    : Afectacion
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.model;

public class Afectacion {

    private int idAfectacion;
    private String nomAfectacion;
    private String registro;
    private int orden;
    private boolean activo;

    public int getIdAfectacion() {
        return idAfectacion;
    }

    public void setIdAfectacion(int idAfectacion) {
        this.idAfectacion = idAfectacion;
    }

    public String getNomAfectacion() {
        return nomAfectacion;
    }

    public void setNomAfectacion(String nomAfectacion) {
        this.nomAfectacion = nomAfectacion;
    }

    public String getRegistro() {
        return registro;
    }

    public void setRegistro(String registro) {
        this.registro = registro;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

}
