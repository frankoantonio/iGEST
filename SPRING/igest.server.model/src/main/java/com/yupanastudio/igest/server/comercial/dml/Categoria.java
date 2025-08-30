/*
 * Document    : Categoria
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.dml;

public class Categoria {

    private long idCategoria;
    private String nomCategoria;
    private String codInterno;
    private int orden;
    private int idNegocio;
    private int idEmpresa;
    private long idClaseSunat;
    private String nomClaseSunatX;

    public long getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(long idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNomCategoria() {
        return nomCategoria;
    }

    public void setNomCategoria(String nomCategoria) {
        this.nomCategoria = nomCategoria;
    }

    public String getCodInterno() {
        return codInterno;
    }

    public void setCodInterno(String codInterno) {
        this.codInterno = codInterno;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public long getIdClaseSunat() {
        return idClaseSunat;
    }

    public void setIdClaseSunat(long idClaseSunat) {
        this.idClaseSunat = idClaseSunat;
    }

    public String getNomClaseSunatX() {
        return nomClaseSunatX;
    }

    public void setNomClaseSunatX(String nomClaseSunatX) {
        this.nomClaseSunatX = nomClaseSunatX;
    }

}
