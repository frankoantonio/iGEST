/*
 * Document   : VarGlobal
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import org.springframework.data.annotation.Id;

public class VarGlobal {

    @Id
    private Integer idVarGb;
    private int idEmpresa;
    private String idSistema;
    private String nomVarGb;
    private String valor;
    private String descripcion;

    public Integer getIdVarGb() {
        return idVarGb;
    }

    public void setIdVarGb(Integer idVarGb) {
        this.idVarGb = idVarGb;
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

    public String getNomVarGb() {
        return nomVarGb;
    }

    public void setNomVarGb(String nomVarGb) {
        this.nomVarGb = nomVarGb;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
