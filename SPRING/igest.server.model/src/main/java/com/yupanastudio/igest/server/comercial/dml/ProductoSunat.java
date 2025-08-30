/*
 * Document    : ProductoSunat
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.dml;

public class ProductoSunat {

    private long idProdSunat;
    private String tipo;
    private String codigo;
    private String codigoPadre;
    private String nombre;
    private int nivel;

    public long getIdProdSunat() {
        return idProdSunat;
    }

    public void setIdProdSunat(long idProdSunat) {
        this.idProdSunat = idProdSunat;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigoPadre() {
        return codigoPadre;
    }

    public void setCodigoPadre(String codigoPadre) {
        this.codigoPadre = codigoPadre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

}
