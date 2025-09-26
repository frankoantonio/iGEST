/*
 * Document   : PerfilRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Perfil;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PerfilRepository extends CrudRepository<Perfil, Integer> {

    @Query("""
            SELECT A.id_perfil, A.id_sistema, A.nom_perfil, A.activo, A.id_tipo_empresa, A.ruta, A.descripcion, A.id_empresa, 
           	  B.id_usu_perfil id_usu_perfil_x, B.id_usuario id_usuario_x, B.ver ver_x, B.crear crear_x, B.editar editar_x, B.eliminar eliminar_x, B.imprimir imprimir_x
            FROM perfil A 
            INNER JOIN usuario_perfil B ON A.id_perfil = B.id_perfil 
            WHERE B.id_usuario = :idUsuario AND A.activo=true AND B.ver=true
           """)
    List<Perfil> findByIdUsuario(long idUsuario);

}
