/*
 * Document   : SedeController
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.controller;

import com.yupanastudio.igest.server.principal.service.SedeService;
import com.yupanastudio.igest.server.principal.model.Sede;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/sede")
public class SedeController {

    @Autowired
    SedeService obSedeService;

//    @GetMapping("/{idSede}")
//    public Sede getSede(@PathVariable Integer idSede) {
//        return obSedeService.getSede(idSede);
//    }
    @PostMapping
    public Sede insert(@RequestBody Sede obSede) {
        return obSedeService.save(obSede);
    }

    @PutMapping
    public Sede update(@RequestBody Sede obSede) {
        return obSedeService.save(obSede);
    }

}
