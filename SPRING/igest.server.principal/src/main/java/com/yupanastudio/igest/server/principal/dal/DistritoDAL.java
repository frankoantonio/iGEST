/*
 * Document   : DistritoDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.principal.dml.Distrito;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DistritoDAL extends CrudRepository<Distrito, String> {

    @Override
    List<Distrito> findAll();

}
