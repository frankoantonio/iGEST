/*
 * Document   : SedeRSL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.rsl;

import com.yupanastudio.igest.server.principal.bll.SedeBLL;
import com.yupanastudio.igest.server.principal.dml.Sede;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/sede")
public class SedeRSL {

    @Autowired
    SedeBLL obSedeBLL;

//    @GetMapping("/{idSede}")
//    public Sede getSede(@PathVariable Integer idSede) {
//        return obSedeBLL.getSede(idSede);
//    }
    @PostMapping
    public Sede insert(@RequestBody Sede obSede) {
        return obSedeBLL.save(obSede);
    }

    @PutMapping
    public Sede update(@RequestBody Sede obSede) {
        return obSedeBLL.save(obSede);
    }

}
