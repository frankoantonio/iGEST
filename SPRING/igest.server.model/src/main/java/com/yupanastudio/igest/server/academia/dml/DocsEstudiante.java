/*
 * Document   : DocsEstudiante
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.academia.dml;

import java.time.LocalDateTime;

public class DocsEstudiante {

    private long idDocsEst;
    private int idNegocio;
    private long idEstudiante;
    private long idDocs;
    private LocalDateTime recibeFe;
    private String recibeUsu;
    private LocalDateTime actualizaFe;
    private String actualizaUsu;
    private LocalDateTime devuelveFe;
    private String devuelveUsu;
    private String nomDocX;
    private boolean obligadoX;

    public long getIdDocsEst() {
        return idDocsEst;
    }

    public void setIdDocsEst(long idDocsEst) {
        this.idDocsEst = idDocsEst;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public long getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(long idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public long getIdDocs() {
        return idDocs;
    }

    public void setIdDocs(long idDocs) {
        this.idDocs = idDocs;
    }

    public LocalDateTime getRecibeFe() {
        return recibeFe;
    }

    public void setRecibeFe(LocalDateTime recibeFe) {
        this.recibeFe = recibeFe;
    }

    public String getRecibeUsu() {
        return recibeUsu;
    }

    public void setRecibeUsu(String recibeUsu) {
        this.recibeUsu = recibeUsu;
    }

    public LocalDateTime getActualizaFe() {
        return actualizaFe;
    }

    public void setActualizaFe(LocalDateTime actualizaFe) {
        this.actualizaFe = actualizaFe;
    }

    public String getActualizaUsu() {
        return actualizaUsu;
    }

    public void setActualizaUsu(String actualizaUsu) {
        this.actualizaUsu = actualizaUsu;
    }

    public LocalDateTime getDevuelveFe() {
        return devuelveFe;
    }

    public void setDevuelveFe(LocalDateTime devuelveFe) {
        this.devuelveFe = devuelveFe;
    }

    public String getDevuelveUsu() {
        return devuelveUsu;
    }

    public void setDevuelveUsu(String devuelveUsu) {
        this.devuelveUsu = devuelveUsu;
    }

    public String getNomDocX() {
        return nomDocX;
    }

    public void setNomDocX(String nomDocX) {
        this.nomDocX = nomDocX;
    }

    public boolean getObligadoX() {
        return obligadoX;
    }

    public void setObligadoX(boolean obligadoX) {
        this.obligadoX = obligadoX;
    }

}
