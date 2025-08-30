/*
 * Document   : UsuarioRSL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.rsl;

import com.yupanastudio.igest.server.MyResponseEntity;
import com.yupanastudio.igest.server.principal.bll.UsuarioBLL;
import com.yupanastudio.igest.server.principal.dml.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/usuario")
public class UsuarioRSL {

    @Autowired
    UsuarioBLL obUsuarioBLL;

    @GetMapping("/{idUsuario}")
    public ResponseEntity<Usuario> getUsuario(@PathVariable long idUsuario) {
//        return obUsuarioBLL.getUsuario(idUsuario, true);

        try {
            return new ResponseEntity<>(obUsuarioBLL.getUsuario(idUsuario, true), HttpStatus.OK);
        } catch (Exception ex) {
            //return new MyResponseEntity(getClass(), ex, "MI_GRP_EMP").getResponse();
            return new MyResponseEntity(getClass(), ex, "").getResponse();
        }

    }

//    @GetMapping("/reval/{idUsuario}")
//    public Usuario getUsuario(int tipoUsuario) {
//        // validar que el usuario tenga habilitado el tipo de usuario
//        // validar que el usuario sea trabajador
//        // validar que el usuario tenga contrato vigente o este activo
//        return obUsuarioBLL.getUsuario();
//    }
    //buscar a los usuarios
    //mostrar usuarios
    //crear usuarios de uno en uno
    //crear usuarios en lote
    //exigir cambiar contraseña
}
