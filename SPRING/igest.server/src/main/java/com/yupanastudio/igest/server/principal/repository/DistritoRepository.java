/*
 * Document   : DistritoRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Distrito;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DistritoRepository extends CrudRepository<Distrito, String> {

    @Override
    List<Distrito> findAll();

}
