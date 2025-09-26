/*
 * Document    : Beneficio
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.model;

public class Beneficio {

    private long idBeneficio;
    private int idNegocio;
    private int idTipoBeneficio;
    private String nomBeneficio;
    private boolean activo;
    private boolean porcentual;
    private int orden;
    private boolean modificable;
    private boolean total;

    public long getIdBeneficio() {
        return idBeneficio;
    }

    public void setIdBeneficio(long idBeneficio) {
        this.idBeneficio = idBeneficio;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public int getIdTipoBeneficio() {
        return idTipoBeneficio;
    }

    public void setIdTipoBeneficio(int idTipoBeneficio) {
        this.idTipoBeneficio = idTipoBeneficio;
    }

    public String getNomBeneficio() {
        return nomBeneficio;
    }

    public void setNomBeneficio(String nomBeneficio) {
        this.nomBeneficio = nomBeneficio;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public boolean getPorcentual() {
        return porcentual;
    }

    public void setPorcentual(boolean porcentual) {
        this.porcentual = porcentual;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public boolean getModificable() {
        return modificable;
    }

    public void setModificable(boolean modificable) {
        this.modificable = modificable;
    }

    public boolean getTotal() {
        return total;
    }

    public void setTotal(boolean total) {
        this.total = total;
    }

}
