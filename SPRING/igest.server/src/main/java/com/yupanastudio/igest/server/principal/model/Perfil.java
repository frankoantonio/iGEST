/*
 * Document   : Perfil
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.model;

import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;

public class Perfil {

    @Id
    private int idPerfil;
    private String idSistema;
    private String nomPerfil;
    private Boolean activo;
    private int idTipoEmpresa;
    private String ruta;
    private String descripcion;
    private int idEmpresa;
    private int idUsuPerfilX;
    private long idUsuarioX;
    private Boolean verX;
    private Boolean crearX;
    private Boolean editarX;
    private Boolean eliminarX;
    private Boolean imprimirX;
    @Transient
    private List<Opcion> lsOpcionX;

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getIdSistema() {
        return idSistema;
    }

    public void setIdSistema(String idSistema) {
        this.idSistema = idSistema;
    }

    public String getNomPerfil() {
        return nomPerfil;
    }

    public void setNomPerfil(String nomPerfil) {
        this.nomPerfil = nomPerfil;
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

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getIdUsuPerfilX() {
        return idUsuPerfilX;
    }

    public void setIdUsuPerfilX(int idUsuPerfilX) {
        this.idUsuPerfilX = idUsuPerfilX;
    }

    public long getIdUsuarioX() {
        return idUsuarioX;
    }

    public void setIdUsuarioX(long idUsuarioX) {
        this.idUsuarioX = idUsuarioX;
    }

    public Boolean getVerX() {
        return verX;
    }

    public void setVerX(Boolean verX) {
        this.verX = verX;
    }

    public Boolean getCrearX() {
        return crearX;
    }

    public void setCrearX(Boolean crearX) {
        this.crearX = crearX;
    }

    public Boolean getEditarX() {
        return editarX;
    }

    public void setEditarX(Boolean editarX) {
        this.editarX = editarX;
    }

    public Boolean getEliminarX() {
        return eliminarX;
    }

    public void setEliminarX(Boolean eliminarX) {
        this.eliminarX = eliminarX;
    }

    public Boolean getImprimirX() {
        return imprimirX;
    }

    public void setImprimirX(Boolean imprimirX) {
        this.imprimirX = imprimirX;
    }

    public List<Opcion> getLsOpcionX() {
        return lsOpcionX;
    }

    public void setLsOpcionX(List<Opcion> lsOpcionX) {
        this.lsOpcionX = lsOpcionX;
    }

}
