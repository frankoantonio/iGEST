/*
 * Document   : EmpresaSistemaRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.EmpresaSistema;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpresaSistemaRepository extends CrudRepository<EmpresaSistema, Integer> {

    List<EmpresaSistema> findByIdEmpresa(int idEmpresa);

}
