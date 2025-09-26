/*
 * Document    : Campania
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.model;

import java.time.LocalDate;

public class Campania {

    private long idCampania;
    private int idNegocio;
    private int idSede;
    private int anio;
    private int frecuencia;
    private int idProdProy;
    private LocalDate feIni;
    private LocalDate feFin;
    private String nomCampania;
    private boolean activo;
    private int idTipoModEst;
    private String codSede;
    private int idTipoTurno;
    private int idTipoInscripcion;
    private boolean matrSinPago;
    private LocalDate feIniClas;
    private LocalDate feFinClas;
    private int idTipoPeriodo;
    private boolean redefinir;
    private int ordenX;

    public long getIdCampania() {
        return idCampania;
    }

    public void setIdCampania(long idCampania) {
        this.idCampania = idCampania;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getFrecuencia() {
        return frecuencia;
    }

    public void setFrecuencia(int frecuencia) {
        this.frecuencia = frecuencia;
    }

    public int getIdProdProy() {
        return idProdProy;
    }

    public void setIdProdProy(int idProdProy) {
        this.idProdProy = idProdProy;
    }

    public LocalDate getFeIni() {
        return feIni;
    }

    public void setFeIni(LocalDate feIni) {
        this.feIni = feIni;
    }

    public LocalDate getFeFin() {
        return feFin;
    }

    public void setFeFin(LocalDate feFin) {
        this.feFin = feFin;
    }

    public String getNomCampania() {
        return nomCampania;
    }

    public void setNomCampania(String nomCampania) {
        this.nomCampania = nomCampania;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public int getIdTipoModEst() {
        return idTipoModEst;
    }

    public void setIdTipoModEst(int idTipoModEst) {
        this.idTipoModEst = idTipoModEst;
    }

    public String getCodSede() {
        return codSede;
    }

    public void setCodSede(String codSede) {
        this.codSede = codSede;
    }

    public int getIdTipoTurno() {
        return idTipoTurno;
    }

    public void setIdTipoTurno(int idTipoTurno) {
        this.idTipoTurno = idTipoTurno;
    }

    public int getIdTipoInscripcion() {
        return idTipoInscripcion;
    }

    public void setIdTipoInscripcion(int idTipoInscripcion) {
        this.idTipoInscripcion = idTipoInscripcion;
    }

    public boolean getMatrSinPago() {
        return matrSinPago;
    }

    public void setMatrSinPago(boolean matrSinPago) {
        this.matrSinPago = matrSinPago;
    }

    public LocalDate getFeIniClas() {
        return feIniClas;
    }

    public void setFeIniClas(LocalDate feIniClas) {
        this.feIniClas = feIniClas;
    }

    public LocalDate getFeFinClas() {
        return feFinClas;
    }

    public void setFeFinClas(LocalDate feFinClas) {
        this.feFinClas = feFinClas;
    }

    public int getIdTipoPeriodo() {
        return idTipoPeriodo;
    }

    public void setIdTipoPeriodo(int idTipoPeriodo) {
        this.idTipoPeriodo = idTipoPeriodo;
    }

    public boolean getRedefinir() {
        return redefinir;
    }

    public void setRedefinir(boolean redefinir) {
        this.redefinir = redefinir;
    }

    public int getOrdenX() {
        return ordenX;
    }

    public void setOrdenX(int ordenX) {
        this.ordenX = ordenX;
    }

    @Override
    public String toString() {
        return "Campania{" + "idCampania=" + idCampania + ", idNegocio=" + idNegocio + ", idSede=" + idSede + ", anio=" + anio + ", frecuencia=" + frecuencia + ", idProdProy=" + idProdProy + ", feIni=" + feIni + ", feFin=" + feFin + ", nomCampania=" + nomCampania + ", activo=" + activo + ", idTipoModEst=" + idTipoModEst + ", codSede=" + codSede + ", idTipoTurno=" + idTipoTurno + ", idTipoInscripcion=" + idTipoInscripcion + ", matrSinPago=" + matrSinPago + ", feIniClas=" + feIniClas + ", feFinClas=" + feFinClas + ", idTipoPeriodo=" + idTipoPeriodo + ", redefinir=" + redefinir + ", ordenX=" + ordenX + '}';
    }
    
    

}
