/*
 * Document   : LoginXRSL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.rsl;

import com.yupanastudio.igest.server.MyResponseEntity;
import com.yupanastudio.igest.server.principal.bll.LoginXBLL;
import com.yupanastudio.igest.server.principal.dml.LoginX;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/login")
public class LoginXRSL {

    @Autowired
    LoginXBLL obLoginXBLL;

    @GetMapping("/{idEmpresa}/{nomUsu}")
    public ResponseEntity<LoginX> getLoginX(@PathVariable int idEmpresa, @PathVariable String nomUsu) {
        try {
            return new ResponseEntity<>(obLoginXBLL.getUsuEmp(idEmpresa, nomUsu), HttpStatus.OK);
        } catch (Exception ex) {
            //return new MyResponseEntity(getClass(), ex, "MI_GRP_EMP").getResponse();
            return new MyResponseEntity(getClass(), ex, "").getResponse();
        }
    }

}
