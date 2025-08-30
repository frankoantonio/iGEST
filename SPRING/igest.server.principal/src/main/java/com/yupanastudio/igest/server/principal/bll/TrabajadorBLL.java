/*
 * Document   : TrabajadorBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.yupanastudio.igest.server.principal.dal.TrabajadorDAL;
import com.yupanastudio.igest.server.personal.dml.Trabajador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrabajadorBLL {

    @Autowired
    TrabajadorDAL obTrabajadorDAL;

    public Trabajador getTrabajador(long idTrabajador) {
        //completar con datos de la persona 
        return obTrabajadorDAL.findById(idTrabajador).orElse(null);
    }

//    public Trabajador getTrabajadorSimple(long idTrabajador) {
//        //completar con datos de la persona 
//        return obTrabajadorDAL.findById(idTrabajador).orElse(null);
//    }
//
//    public Trabajador getTrabajadorComplete(long idTrabajador) {
//        //completar con datos de la persona 
//        return obTrabajadorDAL.findById(idTrabajador).orElse(null);
//    }

}
