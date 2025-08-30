/*
 * Document   : Opcion
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

public class Opcion {

    private int idOpcion;
    private int idPadre;
    private String idSistema;
    private int idPerfil;
    private String nomOpcion;
    private String nomControl;
    private int orden;
    private int idTipoOpcion;
    private int idTipoEmpresa;
    private Boolean activo;
    private Boolean premium;
    private int idEmpresa;

    public int getIdOpcion() {
        return idOpcion;
    }

    public void setIdOpcion(int idOpcion) {
        this.idOpcion = idOpcion;
    }

    public int getIdPadre() {
        return idPadre;
    }

    public void setIdPadre(int idPadre) {
        this.idPadre = idPadre;
    }

    public String getIdSistema() {
        return idSistema;
    }

    public void setIdSistema(String idSistema) {
        this.idSistema = idSistema;
    }

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getNomOpcion() {
        return nomOpcion;
    }

    public void setNomOpcion(String nomOpcion) {
        this.nomOpcion = nomOpcion;
    }

    public String getNomControl() {
        return nomControl;
    }

    public void setNomControl(String nomControl) {
        this.nomControl = nomControl;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public int getIdTipoOpcion() {
        return idTipoOpcion;
    }

    public void setIdTipoOpcion(int idTipoOpcion) {
        this.idTipoOpcion = idTipoOpcion;
    }

    public int getIdTipoEmpresa() {
        return idTipoEmpresa;
    }

    public void setIdTipoEmpresa(int idTipoEmpresa) {
        this.idTipoEmpresa = idTipoEmpresa;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Boolean getPremium() {
        return premium;
    }

    public void setPremium(Boolean premium) {
        this.premium = premium;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

}
