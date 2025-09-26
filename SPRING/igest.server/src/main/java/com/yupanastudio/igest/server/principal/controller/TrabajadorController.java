/*
 * Document   : TrabajadorController
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.controller;

import com.yupanastudio.igest.server.principal.service.TrabajadorService;
import com.yupanastudio.igest.server.personal.model.Trabajador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/trabajador")
public class TrabajadorController {

    @Autowired
    TrabajadorService obTrabajadorService;

//    @GetMapping("/auth/{idEmpresa}")
//    public Trabajador getTrabajador() {
//        return obTrabajadorService.getTrabajador();
//    }
    @GetMapping("/{idTrabajador}")
    public Trabajador getTrabajador(@PathVariable long idTrabajador) {
        return obTrabajadorService.getTrabajador(idTrabajador);
    }

}
