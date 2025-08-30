/*
 * Document    : AreaProf
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.academia.dml;

public class AreaProf {

    private int idAreaProf;
    private int idNegocio;
    private String nomAreaProf;
    private int idTipoGrupoEst;
    private boolean activo;
    private int orden;

    public int getIdAreaProf() {
        return idAreaProf;
    }

    public void setIdAreaProf(int idAreaProf) {
        this.idAreaProf = idAreaProf;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public String getNomAreaProf() {
        return nomAreaProf;
    }

    public void setNomAreaProf(String nomAreaProf) {
        this.nomAreaProf = nomAreaProf;
    }

    public int getIdTipoGrupoEst() {
        return idTipoGrupoEst;
    }

    public void setIdTipoGrupoEst(int idTipoGrupoEst) {
        this.idTipoGrupoEst = idTipoGrupoEst;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

}
