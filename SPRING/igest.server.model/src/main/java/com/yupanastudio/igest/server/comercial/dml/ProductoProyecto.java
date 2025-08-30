/*
 * Document   : ProductoProyecto
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.dml;

public class ProductoProyecto {

    private int idProdProy;
    private int idNegocio;
    private String nomProdProy;
    private String tipo;
    private boolean ventas;
    private boolean planilla;
    private int orden;
    private boolean activo;

    public int getIdProdProy() {
        return idProdProy;
    }

    public void setIdProdProy(int idProdProy) {
        this.idProdProy = idProdProy;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public String getNomProdProy() {
        return nomProdProy;
    }

    public void setNomProdProy(String nomProdProy) {
        this.nomProdProy = nomProdProy;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean getVentas() {
        return ventas;
    }

    public void setVentas(boolean ventas) {
        this.ventas = ventas;
    }

    public boolean getPlanilla() {
        return planilla;
    }

    public void setPlanilla(boolean planilla) {
        this.planilla = planilla;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

}
