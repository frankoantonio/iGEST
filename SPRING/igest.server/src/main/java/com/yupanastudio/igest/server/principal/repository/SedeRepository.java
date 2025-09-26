/*
 * Document   : SedeRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Sede;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SedeRepository extends CrudRepository<Sede, Integer> {

    List<Sede> findByIdEmpresa(int idEmpresa);

}
