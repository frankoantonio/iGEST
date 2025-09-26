/*
 * Document   : ProvinciaRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Provincia;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProvinciaRepository extends CrudRepository<Provincia, String> {

    @Override
    List<Provincia> findAll();

}
