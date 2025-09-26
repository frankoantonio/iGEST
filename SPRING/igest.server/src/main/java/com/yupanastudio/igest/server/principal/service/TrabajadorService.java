/*
 * Document   : TrabajadorService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.yupanastudio.igest.server.principal.repository.TrabajadorRepository;
import com.yupanastudio.igest.server.personal.model.Trabajador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrabajadorService {

    @Autowired
    TrabajadorRepository obTrabajadorRepository;

    public Trabajador getTrabajador(long idTrabajador) {
        //completar con datos de la persona 
        return obTrabajadorRepository.findById(idTrabajador).orElse(null);
    }

//    public Trabajador getTrabajadorSimple(long idTrabajador) {
//        //completar con datos de la persona 
//        return obTrabajadorRepository.findById(idTrabajador).orElse(null);
//    }
//
//    public Trabajador getTrabajadorComplete(long idTrabajador) {
//        //completar con datos de la persona 
//        return obTrabajadorRepository.findById(idTrabajador).orElse(null);
//    }

}
