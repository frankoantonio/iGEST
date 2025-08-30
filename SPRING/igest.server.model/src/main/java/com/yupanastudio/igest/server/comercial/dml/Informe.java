/*
 * Document    : Informe
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.dml;

import java.time.LocalDateTime;

public class Informe {

    private long idInforme;
    private int idNegocio;
    private long idPersona;
    private long idFamiliar;
    private long idCampania;
    private int idProdProy;
    private int idGrado;
    private int idCarrProf;
    private long idVendedor;
    private LocalDateTime feIni;
    private LocalDateTime feFin;
    private int idTipoEstado;
    private long idInstEst;
    private boolean cerrado;
    private String nomGrado;
    private String vendedor;
    private int idTipoGdoInteres;
    private String nomCampaniaX;
    private String nomSedeX;
    private int idTipoModEstX;
    private String nomPersonaX;
    private Atencion obAtencionX;
    private Descalifica obDescalificaX;

    public long getIdInforme() {
        return idInforme;
    }

    public void setIdInforme(long idInforme) {
        this.idInforme = idInforme;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
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

    public long getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(long idVendedor) {
        this.idVendedor = idVendedor;
    }

    public LocalDateTime getFeIni() {
        return feIni;
    }

    public void setFeIni(LocalDateTime feIni) {
        this.feIni = feIni;
    }

    public LocalDateTime getFeFin() {
        return feFin;
    }

    public void setFeFin(LocalDateTime feFin) {
        this.feFin = feFin;
    }

    public int getIdTipoEstado() {
        return idTipoEstado;
    }

    public void setIdTipoEstado(int idTipoEstado) {
        this.idTipoEstado = idTipoEstado;
    }

    public long getIdInstEst() {
        return idInstEst;
    }

    public void setIdInstEst(long idInstEst) {
        this.idInstEst = idInstEst;
    }

    public boolean getCerrado() {
        return cerrado;
    }

    public void setCerrado(boolean cerrado) {
        this.cerrado = cerrado;
    }

    public String getNomGrado() {
        return nomGrado;
    }

    public void setNomGrado(String nomGrado) {
        this.nomGrado = nomGrado;
    }

    public String getVendedor() {
        return vendedor;
    }

    public void setVendedor(String vendedor) {
        this.vendedor = vendedor;
    }

    public int getIdTipoGdoInteres() {
        return idTipoGdoInteres;
    }

    public void setIdTipoGdoInteres(int idTipoGdoInteres) {
        this.idTipoGdoInteres = idTipoGdoInteres;
    }

    public String getNomCampaniaX() {
        return nomCampaniaX;
    }

    public void setNomCampaniaX(String nomCampaniaX) {
        this.nomCampaniaX = nomCampaniaX;
    }

    public String getNomSedeX() {
        return nomSedeX;
    }

    public void setNomSedeX(String nomSedeX) {
        this.nomSedeX = nomSedeX;
    }

    public int getIdTipoModEstX() {
        return idTipoModEstX;
    }

    public void setIdTipoModEstX(int idTipoModEstX) {
        this.idTipoModEstX = idTipoModEstX;
    }

    public String getNomPersonaX() {
        return nomPersonaX;
    }

    public void setNomPersonaX(String nomPersonaX) {
        this.nomPersonaX = nomPersonaX;
    }

    public Atencion getObAtencionX() {
        return obAtencionX;
    }

    public void setObAtencionX(Atencion obAtencionX) {
        this.obAtencionX = obAtencionX;
    }

    public Descalifica getObDescalificaX() {
        return obDescalificaX;
    }

    public void setObDescalificaX(Descalifica obDescalificaX) {
        this.obDescalificaX = obDescalificaX;
    }

}
