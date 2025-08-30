/*
 * Document    : NivelEdu
 * Author      : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.colegio.dml;

public class NivelEdu {

    private int idNivEdu;
    private int idNegocio;
    private int idTipoNivEduc;
//    private int idProdProy;
    private String nomNivEdu;
    private boolean postula;
    private int orden;
    private boolean activo;

    public int getIdNivEdu() {
        return idNivEdu;
    }

    public void setIdNivEdu(int idNivEdu) {
        this.idNivEdu = idNivEdu;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public int getIdTipoNivEduc() {
        return idTipoNivEduc;
    }

    public void setIdTipoNivEduc(int idTipoNivEduc) {
        this.idTipoNivEduc = idTipoNivEduc;
    }

//    public int getIdProdProy() {
//        return idProdProy;
//    }
//
//    public void setIdProdProy(int idProdProy) {
//        this.idProdProy = idProdProy;
//    }

    public String getNomNivEdu() {
        return nomNivEdu;
    }

    public void setNomNivEdu(String nomNivEdu) {
        this.nomNivEdu = nomNivEdu;
    }

    public boolean getPostula() {
        return postula;
    }

    public void setPostula(boolean postula) {
        this.postula = postula;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

}
