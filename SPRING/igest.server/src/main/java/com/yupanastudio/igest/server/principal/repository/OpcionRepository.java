/*
 * Document   : OpcionRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Opcion;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OpcionRepository extends CrudRepository<Opcion, Integer> {

    List<Opcion> findByIdPerfil(int idPerfil);

}
