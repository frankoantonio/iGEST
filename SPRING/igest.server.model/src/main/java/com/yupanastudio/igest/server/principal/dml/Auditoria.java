/*
 * Document   : Auditoria
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import java.time.LocalDate;
import java.time.LocalDateTime;
import org.springframework.data.annotation.Id;

public class Auditoria {

    @Id
    private Long idAuditoria;
    private int anio;
    private String nomEntidad;
    private long idEntidad;
    private String operacion;
    private long idUsuario;
    private String nomUsuario;
    private String ip;
    private String host;
    private String dispositivo;
    private LocalDate feOper;
    private LocalDateTime fhOper;
    private String valores;

    public Long getIdAuditoria() {
        return idAuditoria;
    }

    public void setIdAuditoria(Long idAuditoria) {
        this.idAuditoria = idAuditoria;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getNomEntidad() {
        return nomEntidad;
    }

    public void setNomEntidad(String nomEntidad) {
        this.nomEntidad = nomEntidad;
    }

    public long getIdEntidad() {
        return idEntidad;
    }

    public void setIdEntidad(long idEntidad) {
        this.idEntidad = idEntidad;
    }

    public String getOperacion() {
        return operacion;
    }

    public void setOperacion(String operacion) {
        this.operacion = operacion;
    }

    public long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNomUsuario() {
        return nomUsuario;
    }

    public void setNomUsuario(String nomUsuario) {
        this.nomUsuario = nomUsuario;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getDispositivo() {
        return dispositivo;
    }

    public void setDispositivo(String dispositivo) {
        this.dispositivo = dispositivo;
    }

    public LocalDate getFeOper() {
        return feOper;
    }

    public void setFeOper(LocalDate feOper) {
        this.feOper = feOper;
    }

    public LocalDateTime getFhOper() {
        return fhOper;
    }

    public void setFhOper(LocalDateTime fhOper) {
        this.fhOper = fhOper;
    }

    public String getValores() {
        return valores;
    }

    public void setValores(String valores) {
        this.valores = valores;
    }

}
