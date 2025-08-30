/*
 * Document    : AlmacenArticulo
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.dml;

public class AlmacenArticulo {

    private int idAlmacenArticulo;
    private int idAlmacen;
    private int idArticulo;
    private int stockFis;
    private int stockFisFrac;
    private int stockVir;
    private int stockVirFrac;
    private Articulo obArt_x;
    private int idLocal;
    private String nomAlmacen_x;
    private boolean activoAlm_x;
    private boolean sel_x;

    public int getIdAlmacenArticulo() {
        return idAlmacenArticulo;
    }

    public void setIdAlmacenArticulo(int idAlmacenArticulo) {
        this.idAlmacenArticulo = idAlmacenArticulo;
    }

    public int getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(int idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    public int getStockFis() {
        return stockFis;
    }

    public void setStockFis(int stockFis) {
        this.stockFis = stockFis;
    }

    public int getStockFisFrac() {
        return stockFisFrac;
    }

    public void setStockFisFrac(int stockFisFrac) {
        this.stockFisFrac = stockFisFrac;
    }

    public int getStockVir() {
        return stockVir;
    }

    public void setStockVir(int stockVir) {
        this.stockVir = stockVir;
    }

    public int getStockVirFrac() {
        return stockVirFrac;
    }

    public void setStockVirFrac(int stockVirFrac) {
        this.stockVirFrac = stockVirFrac;
    }

    public Articulo getObArt_x() {
        return obArt_x;
    }

    public void setObArt_x(Articulo obArt_x) {
        this.obArt_x = obArt_x;
    }

    public String getNomAlmacen_x() {
        return nomAlmacen_x;
    }

    public void setNomAlmacen_x(String nomAlmacen_x) {
        this.nomAlmacen_x = nomAlmacen_x;
    }

    public boolean isActivoAlm_x() {
        return activoAlm_x;
    }

    public void setActivoAlm_x(boolean activoAlm_x) {
        this.activoAlm_x = activoAlm_x;
    }

    public boolean getSel_x() {
        return sel_x;
    }

    public void setSel_x(boolean sel_x) {
        this.sel_x = sel_x;
    }

}
