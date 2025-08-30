/*
 * Document   : TrabajadorRSL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.rsl;

import com.yupanastudio.igest.server.principal.bll.TrabajadorBLL;
import com.yupanastudio.igest.server.personal.dml.Trabajador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/trabajador")
public class TrabajadorRSL {

    @Autowired
    TrabajadorBLL obTrabajadorBLL;

//    @GetMapping("/auth/{idEmpresa}")
//    public Trabajador getTrabajador() {
//        return obTrabajadorBLL.getTrabajador();
//    }
    @GetMapping("/{idTrabajador}")
    public Trabajador getTrabajador(@PathVariable long idTrabajador) {
        return obTrabajadorBLL.getTrabajador(idTrabajador);
    }

}
