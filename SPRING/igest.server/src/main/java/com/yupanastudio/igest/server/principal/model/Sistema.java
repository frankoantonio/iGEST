/*
 * Document    : Sistema
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.model;

import org.springframework.data.annotation.Id;

public class Sistema {

    @Id
    private String idSistema;
    private String nomSistema;
    private String nomCorto;
    private String descripcion;
    private int codigo;

    public String getIdSistema() {
        return idSistema;
    }

    public void setIdSistema(String idSistema) {
        this.idSistema = idSistema;
    }

    public String getNomSistema() {
        return nomSistema;
    }

    public void setNomSistema(String nomSistema) {
        this.nomSistema = nomSistema;
    }

    public String getNomCorto() {
        return nomCorto;
    }

    public void setNomCorto(String nomCorto) {
        this.nomCorto = nomCorto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

}
