/*
 * Document    : Seccion
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.academico.colegio;

public class Seccion {

    private long idSeccion;
    private int idNegocio;
    private long idCampania;
    private int idNivEdu;
    private int idGrado;
    private int idTipTurno;
    private String nomSeccion;
    private int idAmbiente;
    private int numVacante;
    private boolean activo;
    private String nomCorto;
    private String nomGrupo1;
    private String nomGrupo2;
    private String nomGrado;
    private String nomNivEdu;

    public long getIdSeccion() {
        return idSeccion;
    }

    public void setIdSeccion(long idSeccion) {
        this.idSeccion = idSeccion;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public long getIdCampania() {
        return idCampania;
    }

    public void setIdCampania(long idCampania) {
        this.idCampania = idCampania;
    }

    public int getIdNivEdu() {
        return idNivEdu;
    }

    public void setIdNivEdu(int idNivEdu) {
        this.idNivEdu = idNivEdu;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public int getIdTipTurno() {
        return idTipTurno;
    }

    public void setIdTipTurno(int idTipTurno) {
        this.idTipTurno = idTipTurno;
    }

    public String getNomSeccion() {
        return nomSeccion;
    }

    public void setNomSeccion(String nomSeccion) {
        this.nomSeccion = nomSeccion;
    }

    public int getIdAmbiente() {
        return idAmbiente;
    }

    public void setIdAmbiente(int idAmbiente) {
        this.idAmbiente = idAmbiente;
    }

    public int getNumVacante() {
        return numVacante;
    }

    public void setNumVacante(int numVacante) {
        this.numVacante = numVacante;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getNomCorto() {
        return nomCorto;
    }

    public void setNomCorto(String nomCorto) {
        this.nomCorto = nomCorto;
    }

    public String getNomGrupo1() {
        return nomGrupo1;
    }

    public void setNomGrupo1(String nomGrupo1) {
        this.nomGrupo1 = nomGrupo1;
    }

    public String getNomGrupo2() {
        return nomGrupo2;
    }

    public void setNomGrupo2(String nomGrupo2) {
        this.nomGrupo2 = nomGrupo2;
    }

    public String getNomGrado() {
        return nomGrado;
    }

    public void setNomGrado(String nomGrado) {
        this.nomGrado = nomGrado;
    }

    public String getNomNivEdu() {
        return nomNivEdu;
    }

    public void setNomNivEdu(String nomNivEdu) {
        this.nomNivEdu = nomNivEdu;
    }

}
