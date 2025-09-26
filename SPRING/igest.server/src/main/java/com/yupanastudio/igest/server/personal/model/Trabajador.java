/*
 * Document    : Trabajador
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.personal.model;

import com.yupanastudio.igest.server.principal.model.Persona;

public class Trabajador extends Persona {

    private Long idTrabajador;
    private int idTipoSexo;
    private int idTipoEstCivil;
    private int idTipoVivienda;
    private int idTipoVivMaterial;
    private int idTipoVivCondicion;
    private long idDireccion;
    private int idTipoMovilidad;
    private int idTipoSitEdu;
    private long idInstEgreso;
    private int idTipoTitulo;
    private String profesion;
    private String ocupacion;
    private String correoPer;
    private String correoLab;
    private String celularPer;
    private String celularLab;
    private String telefono;
    private String obs;
    private boolean activo;

    public void setDataPersona(Persona obPersona) {
//        this.idPersona = obPersona.getIdPersona();
//        this.idEmpresa = obPersona.getIdEmpresa();
//        this.idTipoPersona = obPersona.getIdTipoPersona();
//        this.idTipoDocIdent = obPersona.getIdTipoDocIdent();
//        this.numDocIdent = obPersona.getNumDocIdent();
//        this.paterno = obPersona.getPaterno();
//        this.materno = obPersona.getMaterno();
//        this.nombres = obPersona.getNombres();
//        this.numRucPerNat = obPersona.getNumRucPerNat();
//        this.sigla = obPersona.getSigla();
//        this.validado = obPersona.getValidado();
    }

    public Long getIdTrabajador() {
        return idTrabajador;
    }

    public void setIdTrabajador(Long idTrabajador) {
        this.idTrabajador = idTrabajador;
    }

    public int getIdTipoSexo() {
        return idTipoSexo;
    }

    public void setIdTipoSexo(int idTipoSexo) {
        this.idTipoSexo = idTipoSexo;
    }

    public int getIdTipoEstCivil() {
        return idTipoEstCivil;
    }

    public void setIdTipoEstCivil(int idTipoEstCivil) {
        this.idTipoEstCivil = idTipoEstCivil;
    }

    public int getIdTipoVivienda() {
        return idTipoVivienda;
    }

    public void setIdTipoVivienda(int idTipoVivienda) {
        this.idTipoVivienda = idTipoVivienda;
    }

    public int getIdTipoVivMaterial() {
        return idTipoVivMaterial;
    }

    public void setIdTipoVivMaterial(int idTipoVivMaterial) {
        this.idTipoVivMaterial = idTipoVivMaterial;
    }

    public int getIdTipoVivCondicion() {
        return idTipoVivCondicion;
    }

    public void setIdTipoVivCondicion(int idTipoVivCondicion) {
        this.idTipoVivCondicion = idTipoVivCondicion;
    }

    public long getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(long idDireccion) {
        this.idDireccion = idDireccion;
    }

    public int getIdTipoMovilidad() {
        return idTipoMovilidad;
    }

    public void setIdTipoMovilidad(int idTipoMovilidad) {
        this.idTipoMovilidad = idTipoMovilidad;
    }

    public int getIdTipoSitEdu() {
        return idTipoSitEdu;
    }

    public void setIdTipoSitEdu(int idTipoSitEdu) {
        this.idTipoSitEdu = idTipoSitEdu;
    }

    public long getIdInstEgreso() {
        return idInstEgreso;
    }

    public void setIdInstEgreso(long idInstEgreso) {
        this.idInstEgreso = idInstEgreso;
    }

    public int getIdTipoTitulo() {
        return idTipoTitulo;
    }

    public void setIdTipoTitulo(int idTipoTitulo) {
        this.idTipoTitulo = idTipoTitulo;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getCorreoPer() {
        return correoPer;
    }

    public void setCorreoPer(String correoPer) {
        this.correoPer = correoPer;
    }

    public String getCorreoLab() {
        return correoLab;
    }

    public void setCorreoLab(String correoLab) {
        this.correoLab = correoLab;
    }

    public String getCelularPer() {
        return celularPer;
    }

    public void setCelularPer(String celularPer) {
        this.celularPer = celularPer;
    }

    public String getCelularLab() {
        return celularLab;
    }

    public void setCelularLab(String celularLab) {
        this.celularLab = celularLab;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

}
