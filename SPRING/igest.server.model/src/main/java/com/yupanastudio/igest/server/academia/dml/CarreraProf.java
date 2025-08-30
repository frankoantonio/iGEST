/*
 * Document    : CarreraProf
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.academia.dml;

public class CarreraProf {

    private int idCarrProf;
    private int idNegocio;
    private String nomCarrProf;
    private int idAreaProf;
    private int orden;
    private boolean visible;

    public int getIdCarrProf() {
        return idCarrProf;
    }

    public void setIdCarrProf(int idCarrProf) {
        this.idCarrProf = idCarrProf;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public String getNomCarrProf() {
        return nomCarrProf;
    }

    public void setNomCarrProf(String nomCarrProf) {
        this.nomCarrProf = nomCarrProf;
    }

    public int getIdAreaProf() {
        return idAreaProf;
    }

    public void setIdAreaProf(int idAreaProf) {
        this.idAreaProf = idAreaProf;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public boolean getVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

}
