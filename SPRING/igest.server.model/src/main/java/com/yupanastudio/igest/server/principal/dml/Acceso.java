/*
 * Document   : Acceso
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import java.time.LocalDate;
import java.time.LocalDateTime;
import org.springframework.data.annotation.Id;

public class Acceso {

    @Id
    private Long idAcceso;
    private int idEmpresa;
    private int idUsuario;
    private int idTipoUsu;
    private LocalDate feLogin;
    private LocalDateTime fhLogin;
    private LocalDateTime fhLogout;
    private String infoCliente;

    public Long getIdAcceso() {
        return idAcceso;
    }

    public void setIdAcceso(Long idAcceso) {
        this.idAcceso = idAcceso;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdTipoUsu() {
        return idTipoUsu;
    }

    public void setIdTipoUsu(int idTipoUsu) {
        this.idTipoUsu = idTipoUsu;
    }

    public LocalDate getFeLogin() {
        return feLogin;
    }

    public void setFeLogin(LocalDate feLogin) {
        this.feLogin = feLogin;
    }

    public LocalDateTime getFhLogin() {
        return fhLogin;
    }

    public void setFhLogin(LocalDateTime fhLogin) {
        this.fhLogin = fhLogin;
    }

    public LocalDateTime getFhLogout() {
        return fhLogout;
    }

    public void setFhLogout(LocalDateTime fhLogout) {
        this.fhLogout = fhLogout;
    }

    public String getInfoCliente() {
        return infoCliente;
    }

    public void setInfoCliente(String infoCliente) {
        this.infoCliente = infoCliente;
    }

    @Override
    public String toString() {
        return "Acceso{" + "idAcceso=" + idAcceso + ", idEmpresa=" + idEmpresa + ", idUsuario=" + idUsuario + ", idTipoUsu=" + idTipoUsu + ", feLogin=" + feLogin + ", fhLogin=" + fhLogin + ", fhLogout=" + fhLogout + ", infoCliente=" + infoCliente + '}';
    }

}
