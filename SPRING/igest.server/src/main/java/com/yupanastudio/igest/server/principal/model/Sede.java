/*
 * Document   : Sede
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.model;

import org.springframework.data.annotation.Id;

public class Sede {

    @Id
    private Integer idSede;
    private int idPadre;
    private int idEmpresa;
    private int nivel;
    private int idTipoSede;
    private String nomSede;
    private String dirSede;
    private String idDistrito;
    private Boolean activo;
    private Boolean sunatOficial;
    private String sunatCod;
    private String facEleRuta;
    private String facEleToken;
    private String latitud;
    private String longitud;
    private int orden;

    public Integer getIdSede() {
        return idSede;
    }

    public void setIdSede(Integer idSede) {
        this.idSede = idSede;
    }

    public int getIdPadre() {
        return idPadre;
    }

    public void setIdPadre(int idPadre) {
        this.idPadre = idPadre;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getIdTipoSede() {
        return idTipoSede;
    }

    public void setIdTipoSede(int idTipoSede) {
        this.idTipoSede = idTipoSede;
    }

    public String getNomSede() {
        return nomSede;
    }

    public void setNomSede(String nomSede) {
        this.nomSede = nomSede;
    }

    public String getDirSede() {
        return dirSede;
    }

    public void setDirSede(String dirSede) {
        this.dirSede = dirSede;
    }

    public String getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(String idDistrito) {
        this.idDistrito = idDistrito;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Boolean getSunatOficial() {
        return sunatOficial;
    }

    public void setSunatOficial(Boolean sunatOficial) {
        this.sunatOficial = sunatOficial;
    }

    public String getSunatCod() {
        return sunatCod;
    }

    public void setSunatCod(String sunatCod) {
        this.sunatCod = sunatCod;
    }

    public String getFacEleRuta() {
        return facEleRuta;
    }

    public void setFacEleRuta(String facEleRuta) {
        this.facEleRuta = facEleRuta;
    }

    public String getFacEleToken() {
        return facEleToken;
    }

    public void setFacEleToken(String facEleToken) {
        this.facEleToken = facEleToken;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

}
