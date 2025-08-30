/*
 * Document   : Persona
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import org.springframework.data.annotation.Id;

public class Persona {

    @Id
    private Long idPersona;
    private int idEmpresa;
    private int idTipoPersona;
    private int idTipoDocIdent;
    private String numDocIdent;
    private String paterno;
    private String materno;
    private String nombres;
    private String numRucPerNat;
    private String sigla;
    private Boolean validado;

    public Long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Long idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getIdTipoPersona() {
        return idTipoPersona;
    }

    public void setIdTipoPersona(int idTipoPersona) {
        this.idTipoPersona = idTipoPersona;
    }

    public int getIdTipoDocIdent() {
        return idTipoDocIdent;
    }

    public void setIdTipoDocIdent(int idTipoDocIdent) {
        this.idTipoDocIdent = idTipoDocIdent;
    }

    public String getNumDocIdent() {
        return numDocIdent;
    }

    public void setNumDocIdent(String numDocIdent) {
        this.numDocIdent = numDocIdent;
    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getNumRucPerNat() {
        return numRucPerNat;
    }

    public void setNumRucPerNat(String numRucPerNat) {
        this.numRucPerNat = numRucPerNat;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public Boolean getValidado() {
        return validado;
    }

    public void setValidado(Boolean validado) {
        this.validado = validado;
    }

}
