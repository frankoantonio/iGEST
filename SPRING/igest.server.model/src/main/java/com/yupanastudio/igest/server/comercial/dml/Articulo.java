/*
 * Document    : Articulo
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.dml;

public class Articulo {

    private long idArticulo;
    private long idCategoria;
    private int idAfectacion;
    private boolean venta;
    private boolean compra;
    private String codInterno;
    private long idProdSunat;
    private String subCategoria;
    private String nomArticulo;
    private String marca;
    private String modelo;
    private String descripcion;
    private boolean activo;
    private String undMed;
    private boolean validado;
    private int fraccion;
    private String tipo;
    private double precioConIgv;
    private double precioConIgvFr;
    private int idNegocio;
    private int idEmpresa;
    private boolean editPrecio;
    private boolean patrimonio;
    private int stock;
    private int stockFr;
    private String undMoneda;

    public long getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(long idArticulo) {
        this.idArticulo = idArticulo;
    }

    public long getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(long idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getIdAfectacion() {
        return idAfectacion;
    }

    public void setIdAfectacion(int idAfectacion) {
        this.idAfectacion = idAfectacion;
    }

    public boolean getVenta() {
        return venta;
    }

    public void setVenta(boolean venta) {
        this.venta = venta;
    }

    public boolean getCompra() {
        return compra;
    }

    public void setCompra(boolean compra) {
        this.compra = compra;
    }

    public String getCodInterno() {
        return codInterno;
    }

    public void setCodInterno(String codInterno) {
        this.codInterno = codInterno;
    }

    public long getIdProdSunat() {
        return idProdSunat;
    }

    public void setIdProdSunat(long idProdSunat) {
        this.idProdSunat = idProdSunat;
    }

    public String getSubCategoria() {
        return subCategoria;
    }

    public void setSubCategoria(String subCategoria) {
        this.subCategoria = subCategoria;
    }

    public String getNomArticulo() {
        return nomArticulo;
    }

    public void setNomArticulo(String nomArticulo) {
        this.nomArticulo = nomArticulo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getUndMed() {
        return undMed;
    }

    public void setUndMed(String undMed) {
        this.undMed = undMed;
    }

    public boolean getValidado() {
        return validado;
    }

    public void setValidado(boolean validado) {
        this.validado = validado;
    }

    public int getFraccion() {
        return fraccion;
    }

    public void setFraccion(int fraccion) {
        this.fraccion = fraccion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getPrecioConIgv() {
        return precioConIgv;
    }

    public void setPrecioConIgv(double precioConIgv) {
        this.precioConIgv = precioConIgv;
    }

    public double getPrecioConIgvFr() {
        return precioConIgvFr;
    }

    public void setPrecioConIgvFr(double precioConIgvFr) {
        this.precioConIgvFr = precioConIgvFr;
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

    public boolean getEditPrecio() {
        return editPrecio;
    }

    public void setEditPrecio(boolean editPrecio) {
        this.editPrecio = editPrecio;
    }

    public boolean getPatrimonio() {
        return patrimonio;
    }

    public void setPatrimonio(boolean patrimonio) {
        this.patrimonio = patrimonio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStockFr() {
        return stockFr;
    }

    public void setStockFr(int stockFr) {
        this.stockFr = stockFr;
    }

    public String getUndMoneda() {
        return undMoneda;
    }

    public void setUndMoneda(String undMoneda) {
        this.undMoneda = undMoneda;
    }

}
