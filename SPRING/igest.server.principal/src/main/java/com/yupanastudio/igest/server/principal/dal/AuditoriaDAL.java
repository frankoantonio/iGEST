/*
 * Document   : AuditoriaDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.principal.dml.Auditoria;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuditoriaDAL extends CrudRepository<Auditoria, Long> {
    // List<Empresa> findByActivoTrue();
    // List<Empresa> findByGrupoEmp(String grupoEmp);
}
