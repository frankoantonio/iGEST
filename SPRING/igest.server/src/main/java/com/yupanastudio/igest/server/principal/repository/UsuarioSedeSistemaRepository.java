/*
 * Document   : UsuarioSedeSistemaRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.UsuarioSedeSistema;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioSedeSistemaRepository extends CrudRepository<UsuarioSedeSistema, Integer> {

    List<UsuarioSedeSistema> findByIdUsuario(long idUsuario);

}
