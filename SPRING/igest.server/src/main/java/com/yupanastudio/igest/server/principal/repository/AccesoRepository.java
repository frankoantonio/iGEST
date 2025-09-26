/*
 * Document   : AccesoRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Acceso;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccesoRepository extends CrudRepository<Acceso, Long> {
    // List<Empresa> findByActivoTrue();
    // List<Empresa> findByGrupoEmp(String grupoEmp);
}
