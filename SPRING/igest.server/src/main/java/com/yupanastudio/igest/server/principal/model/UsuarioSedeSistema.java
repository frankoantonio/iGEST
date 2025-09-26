/*
 * Document   : UsuarioSedeSistema
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.model;

import org.springframework.data.annotation.Id;

public class UsuarioSedeSistema {

    @Id
    private Integer idUsuSedSis;
    private int idEmpresa;
    private long idUsuario;
    private int idSede;
    private Boolean activoSede;
    private String idSistema;
    private Boolean activoSistema;

    public Integer getIdUsuSedSis() {
        return idUsuSedSis;
    }

    public void setIdUsuSedSis(Integer idUsuSedSis) {
        this.idUsuSedSis = idUsuSedSis;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    public Boolean getActivoSede() {
        return activoSede;
    }

    public void setActivoSede(Boolean activoSede) {
        this.activoSede = activoSede;
    }

    public String getIdSistema() {
        return idSistema;
    }

    public void setIdSistema(String idSistema) {
        this.idSistema = idSistema;
    }

    public Boolean getActivoSistema() {
        return activoSistema;
    }

    public void setActivoSistema(Boolean activoSistema) {
        this.activoSistema = activoSistema;
    }

}
