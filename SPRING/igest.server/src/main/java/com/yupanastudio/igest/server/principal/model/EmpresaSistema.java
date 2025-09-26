/*
 * Document   : EmpresaSistema
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.model;

import org.springframework.data.annotation.Id;

public class EmpresaSistema {

    @Id
    private Integer idEmpSis;
    private int idEmpresa;
    private String idSistema;
    private Boolean activo;
    private Boolean soloLectura;
    private int idTipoEdition;

    public Integer getIdEmpSis() {
        return idEmpSis;
    }

    public void setIdEmpSis(Integer idEmpSis) {
        this.idEmpSis = idEmpSis;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getIdSistema() {
        return idSistema;
    }

    public void setIdSistema(String idSistema) {
        this.idSistema = idSistema;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Boolean getSoloLectura() {
        return soloLectura;
    }

    public void setSoloLectura(Boolean soloLectura) {
        this.soloLectura = soloLectura;
    }

    public int getIdTipoEdition() {
        return idTipoEdition;
    }

    public void setIdTipoEdition(int idTipoEdition) {
        this.idTipoEdition = idTipoEdition;
    }

}
