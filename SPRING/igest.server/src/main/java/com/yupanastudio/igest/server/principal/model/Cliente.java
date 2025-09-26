/*
 * Document   : Cliente
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.model;

public class Cliente {

    private long idCliente;
    private String direccion;
    private String idDistrito;
    private int idContacto;
    private String obsContacto;
    private String estadoRUC;
    private String condicionRUC;
    private int creditoDias;        // 0=sin credito
    private double creditoLimite;
    private double deuda;
    private String comprobPred; // comprobante predeterminado si tiene dni y ruc:01,03

    public Cliente() {
    }

//    public Cliente(Persona obPersona, String direccion, String idDistrito, int idContacto, String obsContacto, String estadoRUC, String condicionRUC, int creditoDias, double creditoLimite, double deuda, String comprobPred) {
//        super(obPersona);
//        this.idCliente = obPersona.getIdPersona();
//        this.direccion = direccion;
//        this.idDistrito = idDistrito;
//        this.idContacto = idContacto;
//        this.obsContacto = obsContacto;
//        this.estadoRUC = estadoRUC;
//        this.condicionRUC = condicionRUC;
//        this.creditoDias = creditoDias;
//        this.creditoLimite = creditoLimite;
//        this.deuda = deuda;
//        this.comprobPred = comprobPred;
//    }
    public long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(long idCliente) {
        this.idCliente = idCliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(String idDistrito) {
        this.idDistrito = idDistrito;
    }

    public int getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(int idContacto) {
        this.idContacto = idContacto;
    }

    public String getObsContacto() {
        return obsContacto;
    }

    public void setObsContacto(String obsContacto) {
        this.obsContacto = obsContacto;
    }

    public String getEstadoRUC() {
        return estadoRUC;
    }

    public void setEstadoRUC(String estadoRUC) {
        this.estadoRUC = estadoRUC;
    }

    public String getCondicionRUC() {
        return condicionRUC;
    }

    public void setCondicionRUC(String condicionRUC) {
        this.condicionRUC = condicionRUC;
    }

    public int getCreditoDias() {
        return creditoDias;
    }

    public void setCreditoDias(int creditoDias) {
        this.creditoDias = creditoDias;
    }

    public double getCreditoLimite() {
        return creditoLimite;
    }

    public void setCreditoLimite(double creditoLimite) {
        this.creditoLimite = creditoLimite;
    }

    public double getDeuda() {
        return deuda;
    }

    public void setDeuda(double deuda) {
        this.deuda = deuda;
    }

    public String getComprobPred() {
        return comprobPred;
    }

    public void setComprobPred(String comprobPred) {
        this.comprobPred = comprobPred;
    }

}
