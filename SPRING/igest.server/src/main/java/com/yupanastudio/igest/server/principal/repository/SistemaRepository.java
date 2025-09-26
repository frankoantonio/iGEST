/*
 * Document   : SistemaRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Sistema;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SistemaRepository extends CrudRepository<Sistema, Integer> {

    @Override
    List<Sistema> findAll();

    @Query("""
           SELECT A.id_sistema, nom_sistema, nom_corto, descripcion, orden, codigo, B.activo activo_sistema_x, B.solo_lectura solo_lectura_x, B.id_tipo_edition id_tipo_edition_x 
           FROM sistema A 
                INNER JOIN empresa_sistema B ON (A.id_sistema=B.id_sistema )
           WHERE B.id_empresa = :idEmpresa AND B.activo=true;
           """)
    List<Sistema> findByIdEmpresa(int idEmpresa);

    @Query("""
           SELECT A.id_sistema, nom_sistema, nom_corto, descripcion, orden, codigo, B.activo_sistema activo_sistema_x, false solo_lectura_x, -1 id_tipo_edition_x 
           FROM sistema A 
           	INNER JOIN usuario_sede_sistema B ON (A.id_sistema=B.id_sistema)
           WHERE B.id_usuario=:idUsuario AND B.activo_sistema=true;
           """)
    List<Sistema> findByIdUsuario(long idUsuario);

}
