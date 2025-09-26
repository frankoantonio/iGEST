/*
 * Document    : CronogramaPlantilla
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.comercial.model;

import java.time.LocalDate;

public class CronogramaPlantilla {

    private long idCronPlant;
    private long idCampania;
    private int orden;
    private String nombre;
    private int numMes;
    private String periodo;
    private LocalDate fePago;
    private LocalDate fePagoOrig;

    public long getIdCronPlant() {
        return idCronPlant;
    }

    public void setIdCronPlant(long idCronPlant) {
        this.idCronPlant = idCronPlant;
    }

    public long getIdCampania() {
        return idCampania;
    }

    public void setIdCampania(long idCampania) {
        this.idCampania = idCampania;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumMes() {
        return numMes;
    }

    public void setNumMes(int numMes) {
        this.numMes = numMes;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public LocalDate getFePago() {
        return fePago;
    }

    public void setFePago(LocalDate fePago) {
        this.fePago = fePago;
    }

    public LocalDate getFePagoOrig() {
        return fePagoOrig;
    }

    public void setFePagoOrig(LocalDate fePagoOrig) {
        this.fePagoOrig = fePagoOrig;
    }

}
