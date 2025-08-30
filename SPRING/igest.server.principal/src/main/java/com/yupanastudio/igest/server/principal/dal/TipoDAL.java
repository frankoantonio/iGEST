/*
 * Document   : TipoDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.principal.dml.Tipo;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoDAL extends CrudRepository<Tipo, Integer> {

    @Override
    List<Tipo> findAll();
}
