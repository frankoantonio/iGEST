/*
 * Document   : AuditoriaRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Auditoria;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuditoriaRepository extends CrudRepository<Auditoria, Long> {
    // List<Empresa> findByActivoTrue();
    // List<Empresa> findByGrupoEmp(String grupoEmp);
}
