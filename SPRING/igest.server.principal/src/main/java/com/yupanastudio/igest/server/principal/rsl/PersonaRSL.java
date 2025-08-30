/*
 * Document   : PersonaRSL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.rsl;

import com.yupanastudio.igest.server.MyResponseEntity;
import com.yupanastudio.igest.server.principal.bll.PersonaBLL;
import com.yupanastudio.igest.server.principal.dml.Persona;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/perfilAdmin/persona")
public class PersonaRSL {

    @Autowired
    PersonaBLL obPersonaBLL;

    @GetMapping("/{idPersona}")
    public ResponseEntity<Persona> getPersona(@PathVariable Integer idPersona) {
        try {
            //return obEmpresaBLL.getEmpresa(idEmpresa);
            return new ResponseEntity<>(obPersonaBLL.getPersonaById(idPersona), HttpStatus.OK);
        } catch (Exception ex) {
            //return new MyResponseEntity(getClass(), ex, "MI_GRP_EMP").getResponse();
            return new MyResponseEntity(getClass(), ex, "").getResponse();
        }
    }
    
    @GetMapping("/varios")
    public ResponseEntity<Persona> getPersonaVarios() {
        try {
            return new ResponseEntity<>(obPersonaBLL.getPersonaVarios(), HttpStatus.OK);
        } catch (Exception ex) {
            return new MyResponseEntity(getClass(), ex, "").getResponse();
        }
    }

    @GetMapping("/byNoms/{apeNomsRzSoc}")
    public ResponseEntity<List<Persona>> getPersonaByNoms(@PathVariable int idEmpresa, @PathVariable int idTipoPersona, @PathVariable String apeNomsRzSoc) {
        try {
            return new ResponseEntity<>(obPersonaBLL.getPersonaByNoms(idEmpresa, apeNomsRzSoc), HttpStatus.OK);
        } catch (Exception ex) {
            return new MyResponseEntity(getClass(), ex, "").getResponse();
        }
    }

    @GetMapping("/byNumDoc/{numDoc}")
    public ResponseEntity<Persona> getPersonaByNumDoc(@PathVariable int idEmpresa, @PathVariable String apeNomsRzSoc) {
        try {
            return new ResponseEntity<>(obPersonaBLL.getPersonaByNumDoc(idEmpresa, apeNomsRzSoc), HttpStatus.OK);
        } catch (Exception ex) {
            return new MyResponseEntity(getClass(), ex, "").getResponse();
        }
    }

    @PostMapping
    public Persona insert(@RequestBody Persona obPersona) {
        return obPersonaBLL.save(obPersona);
    }

    @PutMapping
    public Persona update(@RequestBody Persona obPersona) {
        return obPersonaBLL.save(obPersona);
    }

}
