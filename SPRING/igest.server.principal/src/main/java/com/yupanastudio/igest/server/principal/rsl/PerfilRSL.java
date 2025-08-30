/*
 * Document   : PerfilRSL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.rsl;

import com.yupanastudio.igest.server.MyResponseEntity;
import com.yupanastudio.igest.server.principal.bll.PerfilBLL;
import com.yupanastudio.igest.server.principal.dml.Perfil;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/perfil")
public class PerfilRSL {

//    @Autowired
//    PerfilBLL obPerfilBLL;

//    @GetMapping("/{idUsuario}")
//    public ResponseEntity<List<Perfil>> getPerfilByIdUsuario(@PathVariable long idUsuario) {
//        try {
//            System.out.println("RSL_____________");
//            return new ResponseEntity<>(obPerfilBLL.getPerfilByIdUsuario(idUsuario), HttpStatus.OK);
//        } catch (Exception ex) {
//            return new MyResponseEntity(getClass(), ex, "MI_GRP_EMP").getResponse(); //MI_GRP_EMP
//        }
//    }
    
    // ANTES DE PEDIR DATOS DE SUS PERFILES VERIFICAR QUE LA EMPRESA ESTE ACTIVO

}
