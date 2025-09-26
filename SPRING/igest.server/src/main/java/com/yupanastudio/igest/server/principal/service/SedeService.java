/*
 * Document   : SedeService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.yupanastudio.igest.server.principal.repository.SedeRepository;
import com.yupanastudio.igest.server.principal.model.Sede;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SedeService {

    @Autowired
    SedeRepository obSedeRepository;

//    public Sede getSede(int idSede) {
//        return obSedeRepository.findById(idSede).orElse(null);
//    }
    public Sede save(Sede obSede) {
        if (obSede.getIdSede() != null && obSede.getIdSede() == -1) {
            obSede.setIdSede(null);
        }
        return obSedeRepository.save(obSede);
    }

}
