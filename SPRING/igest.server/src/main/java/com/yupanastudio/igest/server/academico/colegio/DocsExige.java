/*
 * Document   : DocsExige
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.academico.colegio;

public class DocsExige {

    private long idDocsExige;
    private int idNegocio;
    private String nomDoc;
    private boolean activo;
    private boolean obligado;

    public long getIdDocsExige() {
        return idDocsExige;
    }

    public void setIdDocsExige(long idDocsExige) {
        this.idDocsExige = idDocsExige;
    }

    public int getIdNegocio() {
        return idNegocio;
    }

    public void setIdNegocio(int idNegocio) {
        this.idNegocio = idNegocio;
    }

    public String getNomDoc() {
        return nomDoc;
    }

    public void setNomDoc(String nomDoc) {
        this.nomDoc = nomDoc;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public boolean getObligado() {
        return obligado;
    }

    public void setObligado(boolean obligado) {
        this.obligado = obligado;
    }

}
