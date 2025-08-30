/*
 * Document   : ProvinciaDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.principal.dml.Provincia;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProvinciaDAL extends CrudRepository<Provincia, String> {

    @Override
    List<Provincia> findAll();

}
