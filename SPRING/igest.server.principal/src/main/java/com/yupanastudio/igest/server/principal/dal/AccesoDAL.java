/*
 * Document   : AccesoDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.principal.dml.Acceso;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccesoDAL extends CrudRepository<Acceso, Long> {
    // List<Empresa> findByActivoTrue();
    // List<Empresa> findByGrupoEmp(String grupoEmp);
}
