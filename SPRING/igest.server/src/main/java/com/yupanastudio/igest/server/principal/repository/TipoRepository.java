/*
 * Document   : TipoRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Tipo;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoRepository extends CrudRepository<Tipo, Integer> {

    @Override
    List<Tipo> findAll();
}
