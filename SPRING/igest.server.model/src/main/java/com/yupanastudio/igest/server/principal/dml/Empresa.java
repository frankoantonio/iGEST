/*
 * Document   : Empresa
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import java.util.List;
import java.util.Map;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;

public class Empresa {

    @Id
    private Integer idEmpresa;
    private String grupoEmp;
    private String nomEmpresa;
    private String nomComercial;
    private String direccion;
    private String telefonos;
    private String ruc;
    private String sunatUsu;
    private String sunatPwd;
    private Boolean activo;
    private int idTipoEmpresa;
    private String dominio;
    private String dominioMail;
    private String codeName;
    private String interfaz;
    @Transient
    private List<Sede> lsSedes;
    @Transient
    private List<EmpresaSistema> lsEmpresaSistemas;

    public Integer getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(Integer idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getGrupoEmp() {
        return grupoEmp;
    }

    public void setGrupoEmp(String grupoEmp) {
        this.grupoEmp = grupoEmp;
    }

    public String getNomEmpresa() {
        return nomEmpresa;
    }

    public void setNomEmpresa(String nomEmpresa) {
        this.nomEmpresa = nomEmpresa;
    }

    public String getNomComercial() {
        return nomComercial;
    }

    public void setNomComercial(String nomComercial) {
        this.nomComercial = nomComercial;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefonos() {
        return telefonos;
    }

    public void setTelefonos(String telefonos) {
        this.telefonos = telefonos;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getSunatUsu() {
        return sunatUsu;
    }

    public void setSunatUsu(String sunatUsu) {
        this.sunatUsu = sunatUsu;
    }

    public String getSunatPwd() {
        return sunatPwd;
    }

    public void setSunatPwd(String sunatPwd) {
        this.sunatPwd = sunatPwd;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public int getIdTipoEmpresa() {
        return idTipoEmpresa;
    }

    public void setIdTipoEmpresa(int idTipoEmpresa) {
        this.idTipoEmpresa = idTipoEmpresa;
    }

    public String getDominio() {
        return dominio;
    }

    public void setDominio(String dominio) {
        this.dominio = dominio;
    }

    public String getDominioMail() {
        return dominioMail;
    }

    public void setDominioMail(String dominioMail) {
        this.dominioMail = dominioMail;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getInterfaz() {
        return interfaz;
    }

    public void setInterfaz(String interfaz) {
        this.interfaz = interfaz;
    }

    public List<Sede> getLsSedes() {
        return lsSedes;
    }

    public void setLsSedes(List<Sede> lsSedes) {
        this.lsSedes = lsSedes;
    }

    public List<EmpresaSistema> getLsEmpresaSistemas() {
        return lsEmpresaSistemas;
    }

    public void setLsEmpresaSistemas(List<EmpresaSistema> lsEmpresaSistemas) {
        this.lsEmpresaSistemas = lsEmpresaSistemas;
    }

}
