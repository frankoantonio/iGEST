/*
 * Document    : Descalifica
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.dml;

public class Descalifica {

    private long idDescalifica;
    private long idInforme;
    private long idAtencion;
    private int idTipoDescalifica;
    private long idInstEst;
    private String porqueInstEst;
    private String obs;
    private boolean llamarProx;
    private int idTipoAtencion;

    public long getIdDescalifica() {
        return idDescalifica;
    }

    public void setIdDescalifica(long idDescalifica) {
        this.idDescalifica = idDescalifica;
    }

    public long getIdInforme() {
        return idInforme;
    }

    public void setIdInforme(long idInforme) {
        this.idInforme = idInforme;
    }

    public long getIdAtencion() {
        return idAtencion;
    }

    public void setIdAtencion(long idAtencion) {
        this.idAtencion = idAtencion;
    }

    public int getIdTipoDescalifica() {
        return idTipoDescalifica;
    }

    public void setIdTipoDescalifica(int idTipoDescalifica) {
        this.idTipoDescalifica = idTipoDescalifica;
    }

    public long getIdInstEst() {
        return idInstEst;
    }

    public void setIdInstEst(long idInstEst) {
        this.idInstEst = idInstEst;
    }

    public String getPorqueInstEst() {
        return porqueInstEst;
    }

    public void setPorqueInstEst(String porqueInstEst) {
        this.porqueInstEst = porqueInstEst;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public boolean getLlamarProx() {
        return llamarProx;
    }

    public void setLlamarProx(boolean llamarProx) {
        this.llamarProx = llamarProx;
    }

    public int getIdTipoAtencion() {
        return idTipoAtencion;
    }

    public void setIdTipoAtencion(int idTipoAtencion) {
        this.idTipoAtencion = idTipoAtencion;
    }

}
