/*
 * Document   : UsuarioSedeSistemaDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.principal.dml.UsuarioSedeSistema;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioSedeSistemaDAL extends CrudRepository<UsuarioSedeSistema, Integer> {

    List<UsuarioSedeSistema> findByIdUsuario(long idUsuario);

}
