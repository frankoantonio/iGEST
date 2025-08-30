/*
 * Document   : LoginX
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import java.time.LocalDateTime;
import java.util.List;

public class LoginX {

    private LocalDateTime fhServer;          // viene con perfiles
    private Usuario obUsuario;          // viene con perfiles
    private Empresa obEmpresa;          // viene con sedes
    private List<Empresa> lsEmpresa;   // empresas del grupo empresarial    
    private List<Sistema> lsSistema;
    private List<Pais> lsPais;
    private List<Departamento> lsDepartamento;
    private List<Provincia> lsProvincia;
    private List<Distrito> lsDistrito;
    private List<Tipo> lsTipo;
    private List<VarGlobal> lsVarGlobal;

    public LocalDateTime getFhServer() {
        return fhServer;
    }

    public void setFhServer(LocalDateTime fhServer) {
        this.fhServer = fhServer;
    }

    public Usuario getObUsuario() {
        return obUsuario;
    }

    public void setObUsuario(Usuario obUsuario) {
        this.obUsuario = obUsuario;
    }

    public Empresa getObEmpresa() {
        return obEmpresa;
    }

    public void setObEmpresa(Empresa obEmpresa) {
        this.obEmpresa = obEmpresa;
    }

    public List<Empresa> getLsEmpresa() {
        return lsEmpresa;
    }

    public void setLsEmpresa(List<Empresa> lsEmpresa) {
        this.lsEmpresa = lsEmpresa;
    }

    public List<Sistema> getLsSistema() {
        return lsSistema;
    }

    public void setLsSistema(List<Sistema> lsSistema) {
        this.lsSistema = lsSistema;
    }

    public List<Pais> getLsPais() {
        return lsPais;
    }

    public void setLsPais(List<Pais> lsPais) {
        this.lsPais = lsPais;
    }

    public List<Departamento> getLsDepartamento() {
        return lsDepartamento;
    }

    public void setLsDepartamento(List<Departamento> lsDepartamento) {
        this.lsDepartamento = lsDepartamento;
    }

    public List<Provincia> getLsProvincia() {
        return lsProvincia;
    }

    public void setLsProvincia(List<Provincia> lsProvincia) {
        this.lsProvincia = lsProvincia;
    }

    public List<Distrito> getLsDistrito() {
        return lsDistrito;
    }

    public void setLsDistrito(List<Distrito> lsDistrito) {
        this.lsDistrito = lsDistrito;
    }

    public List<Tipo> getLsTipo() {
        return lsTipo;
    }

    public void setLsTipo(List<Tipo> lsTipo) {
        this.lsTipo = lsTipo;
    }

    public List<VarGlobal> getLsVarGlobal() {
        return lsVarGlobal;
    }

    public void setLsVarGlobal(List<VarGlobal> lsVarGlobal) {
        this.lsVarGlobal = lsVarGlobal;
    }

}
