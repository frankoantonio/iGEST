/*
 * Document   : DepartamentoRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Departamento;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartamentoRepository extends CrudRepository<Departamento, String> {

    @Override
    List<Departamento> findAll();

}
