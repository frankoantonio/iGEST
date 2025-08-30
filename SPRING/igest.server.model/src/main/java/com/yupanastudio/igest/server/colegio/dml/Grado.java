/*
 * Document    : Grado
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.colegio.dml;

public class Grado {

    private int idGrado;
    private int idNegocio;
    private int numGrado;
    private String nomGrado;
    private int idGradoSgte;
    private int idNivEdu;
    private boolean activo;
    private int idAreaProf;

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public int getNumGrado() {
        return numGrado;
    }

    public void setNumGrado(int numGrado) {
        this.numGrado = numGrado;
    }

    public String getNomGrado() {
        return nomGrado;
    }

    public void setNomGrado(String nomGrado) {
        this.nomGrado = nomGrado;
    }

    public int getIdGradoSgte() {
        return idGradoSgte;
    }

    public void setIdGradoSgte(int idGradoSgte) {
        this.idGradoSgte = idGradoSgte;
    }

    public int getIdNivEdu() {
        return idNivEdu;
    }

    public void setIdNivEdu(int idNivEdu) {
        this.idNivEdu = idNivEdu;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public int getIdAreaProf() {
        return idAreaProf;
    }

    public void setIdAreaProf(int idAreaProf) {
        this.idAreaProf = idAreaProf;
    }

}
