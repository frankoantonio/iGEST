/*
 * Document   : EmpresaController
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.controller;

import com.yupanastudio.igest.server.MyResponseEntity;
import com.yupanastudio.igest.server.principal.service.EmpresaService;
import com.yupanastudio.igest.server.principal.model.Empresa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/empresa")
public class EmpresaController {

    @Autowired
    EmpresaService obEmpresaService;

//    @GetMapping("/{idEmpresa}")
//    public ResponseEntity<Empresa> getEmpresa(@PathVariable Integer idEmpresa) {
//        try {
//            return new ResponseEntity<>(obEmpresaService.getEmpresa(idEmpresa), HttpStatus.OK);
//        } catch (Exception ex) {
//            //return new MyResponseEntity(getClass(), ex, "MI_GRP_EMP").getResponse();
//            return new MyResponseEntity(getClass(), ex, "").getResponse();
//        }
//    }

    @PutMapping
    public Empresa update(@RequestBody Empresa obEmpresa) {
        return obEmpresaService.save(obEmpresa);
    }

}
