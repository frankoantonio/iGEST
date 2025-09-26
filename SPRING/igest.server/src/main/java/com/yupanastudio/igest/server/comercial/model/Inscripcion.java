/*
 * Document   : Inscripcion
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.model;

import java.time.LocalDateTime;

public class Inscripcion {

    private long idInscripcion;
    private int idNegocio;
    private long idEstudiante;
    private long idFamiliar;
    private long idCampania;
    private int idProdProy;
    private int idGrado;
    private int idCarrProf;
    private int idAreaProf;
    private LocalDateTime feInsc;
    private long idInstEst;
    private long idVendedor;
    private String vendedor;
    private long idSeccion;
    private int idTipoPublicidad;
    private int idTipoEstado;
    private int idTipoDscto;
    private int idTipoIngreso;
    private int idTipoEvalIng;
    private int idTipoEvalFin;
    private long idInforme;
    private String codMatricula;
    private long idBeneficio;
    private String obs;
    private LocalDateTime feMatr;
    private boolean cerrado;
    private int idTipoInscripcion;
    private String nomSeccionX;
    private String nomGradoX;
    private String nomNivEduX;
    private int idTipoModEstX;

    public long getIdInscripcion() {
        return idInscripcion;
    }

    public void setIdInscripcion(long idInscripcion) {
        this.idInscripcion = idInscripcion;
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

    public long getIdFamiliar() {
        return idFamiliar;
    }

    public void setIdFamiliar(long idFamiliar) {
        this.idFamiliar = idFamiliar;
    }

    public long getIdCampania() {
        return idCampania;
    }

    public void setIdCampania(long idCampania) {
        this.idCampania = idCampania;
    }

    public int getIdProdProy() {
        return idProdProy;
    }

    public void setIdProdProy(int idProdProy) {
        this.idProdProy = idProdProy;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public int getIdCarrProf() {
        return idCarrProf;
    }

    public void setIdCarrProf(int idCarrProf) {
        this.idCarrProf = idCarrProf;
    }

    public int getIdAreaProf() {
        return idAreaProf;
    }

    public void setIdAreaProf(int idAreaProf) {
        this.idAreaProf = idAreaProf;
    }

    public LocalDateTime getFeInsc() {
        return feInsc;
    }

    public void setFeInsc(LocalDateTime feInsc) {
        this.feInsc = feInsc;
    }

    public long getIdInstEst() {
        return idInstEst;
    }

    public void setIdInstEst(long idInstEst) {
        this.idInstEst = idInstEst;
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

    public long getIdSeccion() {
        return idSeccion;
    }

    public void setIdSeccion(long idSeccion) {
        this.idSeccion = idSeccion;
    }

    public int getIdTipoPublicidad() {
        return idTipoPublicidad;
    }

    public void setIdTipoPublicidad(int idTipoPublicidad) {
        this.idTipoPublicidad = idTipoPublicidad;
    }

    public int getIdTipoEstado() {
        return idTipoEstado;
    }

    public void setIdTipoEstado(int idTipoEstado) {
        this.idTipoEstado = idTipoEstado;
    }

    public int getIdTipoDscto() {
        return idTipoDscto;
    }

    public void setIdTipoDscto(int idTipoDscto) {
        this.idTipoDscto = idTipoDscto;
    }

    public int getIdTipoIngreso() {
        return idTipoIngreso;
    }

    public void setIdTipoIngreso(int idTipoIngreso) {
        this.idTipoIngreso = idTipoIngreso;
    }

    public int getIdTipoEvalIng() {
        return idTipoEvalIng;
    }

    public void setIdTipoEvalIng(int idTipoEvalIng) {
        this.idTipoEvalIng = idTipoEvalIng;
    }

    public int getIdTipoEvalFin() {
        return idTipoEvalFin;
    }

    public void setIdTipoEvalFin(int idTipoEvalFin) {
        this.idTipoEvalFin = idTipoEvalFin;
    }

    public long getIdInforme() {
        return idInforme;
    }

    public void setIdInforme(long idInforme) {
        this.idInforme = idInforme;
    }

    public String getCodMatricula() {
        return codMatricula;
    }

    public void setCodMatricula(String codMatricula) {
        this.codMatricula = codMatricula;
    }

    public long getIdBeneficio() {
        return idBeneficio;
    }

    public void setIdBeneficio(long idBeneficio) {
        this.idBeneficio = idBeneficio;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public LocalDateTime getFeMatr() {
        return feMatr;
    }

    public void setFeMatr(LocalDateTime feMatr) {
        this.feMatr = feMatr;
    }

    public boolean getCerrado() {
        return cerrado;
    }

    public void setCerrado(boolean cerrado) {
        this.cerrado = cerrado;
    }

    public int getIdTipoInscripcion() {
        return idTipoInscripcion;
    }

    public void setIdTipoInscripcion(int idTipoInscripcion) {
        this.idTipoInscripcion = idTipoInscripcion;
    }

    public String getNomSeccionX() {
        return nomSeccionX;
    }

    public void setNomSeccionX(String nomSeccionX) {
        this.nomSeccionX = nomSeccionX;
    }

    public String getNomGradoX() {
        return nomGradoX;
    }

    public void setNomGradoX(String nomGradoX) {
        this.nomGradoX = nomGradoX;
    }

    public String getNomNivEduX() {
        return nomNivEduX;
    }

    public void setNomNivEduX(String nomNivEduX) {
        this.nomNivEduX = nomNivEduX;
    }

    public int getIdTipoModEstX() {
        return idTipoModEstX;
    }

    public void setIdTipoModEstX(int idTipoModEstX) {
        this.idTipoModEstX = idTipoModEstX;
    }

}
