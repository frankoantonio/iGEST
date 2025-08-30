/*
 * Document    : TrabClase
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.personal.dml;

/**
 *
 * @author Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
public class TrabClase {

    private int idTrabClase;
    private int idEmpresa;
    private int idTipoCatTrab;
    private String catTrab;
    private int idTipoTipTrab;
    private String tipTrab;
    private int idTipoCeCosto;
    private String ceCosto;
    private String nomTrabClase;
    private boolean activo;
    private int orden;

    public int getIdTrabClase() {
        return idTrabClase;
    }

    public void setIdTrabClase(int idTrabClase) {
        this.idTrabClase = idTrabClase;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getIdTipoCatTrab() {
        return idTipoCatTrab;
    }

    public void setIdTipoCatTrab(int idTipoCatTrab) {
        this.idTipoCatTrab = idTipoCatTrab;
    }

    public String getCatTrab() {
        return catTrab;
    }

    public void setCatTrab(String catTrab) {
        this.catTrab = catTrab;
    }

    public int getIdTipoTipTrab() {
        return idTipoTipTrab;
    }

    public void setIdTipoTipTrab(int idTipoTipTrab) {
        this.idTipoTipTrab = idTipoTipTrab;
    }

    public String getTipTrab() {
        return tipTrab;
    }

    public void setTipTrab(String tipTrab) {
        this.tipTrab = tipTrab;
    }

    public int getIdTipoCeCosto() {
        return idTipoCeCosto;
    }

    public void setIdTipoCeCosto(int idTipoCeCosto) {
        this.idTipoCeCosto = idTipoCeCosto;
    }

    public String getCeCosto() {
        return ceCosto;
    }

    public void setCeCosto(String ceCosto) {
        this.ceCosto = ceCosto;
    }

    public String getNomTrabClase() {
        return "[" + this.getCeCosto() + "] " + nomTrabClase;
    }

    public void setNomTrabClase(String nomTrabClase) {
        this.nomTrabClase = nomTrabClase;
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
