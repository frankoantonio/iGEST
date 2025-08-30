/*
 * Document   : Usuario
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;

public class Usuario {

    @Id
    private Long idUsuario;
    private String nomUsu;
    private String pwdUsu;
    private Boolean activo;
    private Boolean cambioPwd;
    @Transient
    private Persona obPersona;
    @Transient
    private List<UsuarioSedeSistema> lsUsuarioSedeSistema;
    @Transient
    private List<Perfil> lsPerfil;

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNomUsu() {
        return nomUsu;
    }

    public void setNomUsu(String nomUsu) {
        this.nomUsu = nomUsu;
    }

    public String getPwdUsu() {
        return pwdUsu;
    }

    public void setPwdUsu(String pwdUsu) {
        this.pwdUsu = pwdUsu;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Boolean getCambioPwd() {
        return cambioPwd;
    }

    public void setCambioPwd(Boolean cambioPwd) {
        this.cambioPwd = cambioPwd;
    }

    public Persona getObPersona() {
        return obPersona;
    }

    public void setObPersona(Persona obPersona) {
        this.obPersona = obPersona;
    }

    public List<UsuarioSedeSistema> getLsUsuarioSedeSistema() {
        return lsUsuarioSedeSistema;
    }

    public void setLsUsuarioSedeSistema(List<UsuarioSedeSistema> lsUsuarioSedeSistema) {
        this.lsUsuarioSedeSistema = lsUsuarioSedeSistema;
    }

    public List<Perfil> getLsPerfil() {
        return lsPerfil;
    }

    public void setLsPerfil(List<Perfil> lsPerfil) {
        this.lsPerfil = lsPerfil;
    }

}
