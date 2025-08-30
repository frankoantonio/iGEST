/*
 * Document   : OpcionDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.principal.dml.Opcion;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OpcionDAL extends CrudRepository<Opcion, Integer> {

    List<Opcion> findByIdPerfil(int idPerfil);

}
