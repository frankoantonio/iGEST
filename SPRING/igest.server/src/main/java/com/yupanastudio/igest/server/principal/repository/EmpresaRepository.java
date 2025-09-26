/*
 * Document   : EmpresaRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Empresa;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpresaRepository extends CrudRepository<Empresa, Integer> {

    // List<Empresa> findByActivoTrue();
    List<Empresa> findByGrupoEmp(String grupoEmp);

    @Query("""
            SELECT id_empresa, grupo_emp, nom_empresa, nom_comercial, direccion, telefonos, ruc, sunat_usu, sunat_pwd, activo, id_tipo_empresa, dominio, dominio_mail, code_name, interfaz::text 
            FROM empresa 
            WHERE grupo_emp in (SELECT e.grupo_emp FROM empresa e WHERE e.ruc = :ruc) 
           """)
    List<Empresa> findByRuc(String ruc);

    @Query("SELECT interfaz FROM empresa WHERE code_name = :codeName ")
    String findByCodeName(@Param("codeName") String codeName);

}
