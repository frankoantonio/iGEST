/*
 * Document    : Atencion
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.model;

import java.time.LocalDateTime;

public class Atencion {

    private long idAtencion;
    private int idNegocio;
    private long idInforme;
    private LocalDateTime fecha;
    private int idTipoAtencion;
    private int idTipoGdoInteres;
    private String proxFecha;
    private String proxHora;
    private String obs;
    private long idVendedor;
    private String vendedor;

    public long getIdAtencion() {
        return idAtencion;
    }

    public void setIdAtencion(long idAtencion) {
        this.idAtencion = idAtencion;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public long getIdInforme() {
        return idInforme;
    }

    public void setIdInforme(long idInforme) {
        this.idInforme = idInforme;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public int getIdTipoAtencion() {
        return idTipoAtencion;
    }

    public void setIdTipoAtencion(int idTipoAtencion) {
        this.idTipoAtencion = idTipoAtencion;
    }

    public int getIdTipoGdoInteres() {
        return idTipoGdoInteres;
    }

    public void setIdTipoGdoInteres(int idTipoGdoInteres) {
        this.idTipoGdoInteres = idTipoGdoInteres;
    }

    public String getProxFecha() {
        return proxFecha;
    }

    public void setProxFecha(String proxFecha) {
        this.proxFecha = proxFecha;
    }

    public String getProxHora() {
        return proxHora;
    }

    public void setProxHora(String proxHora) {
        this.proxHora = proxHora;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public long getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(long idVendedor) {
        this.idVendedor = idVendedor;
    }

    public String getVendedor() {
        return vendedor;
    }

    public void setVendedor(String vendedor) {
        this.vendedor = vendedor;
    }

}
