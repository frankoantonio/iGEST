/*
 * Document   : SedeBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.yupanastudio.igest.server.principal.dal.SedeDAL;
import com.yupanastudio.igest.server.principal.dml.Sede;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SedeBLL {

    @Autowired
    SedeDAL obSedeDAL;

//    public Sede getSede(int idSede) {
//        return obSedeDAL.findById(idSede).orElse(null);
//    }
    public Sede save(Sede obSede) {
        if (obSede.getIdSede() != null && obSede.getIdSede() == -1) {
            obSede.setIdSede(null);
        }
        return obSedeDAL.save(obSede);
    }

}
