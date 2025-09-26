/*
 * Document   : PersonaRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Persona;
import java.util.List;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonaRepository extends CrudRepository<Persona, Long> {

    @Query("""
           SELECT id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, validado 
           FROM persona 
           WHERE id_persona=0 
           LIMIT 1 ;
           """)
    Persona findByVarios();

    // 95019 = VARIOS
    @Query("""
           SELECT id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, validado 
           FROM persona 
           WHERE id_empresa= :idEmpresa AND id_tipo_persona <> 95019  
                 AND UNACCENT( paterno || ' ' || materno  || ' ' ||  nombres || ' ' ||  sigla)  ILIKE  UNACCENT(:apeNomsRzSoc) ; 
           """)
    List<Persona> findByApeNomsRzSoc(int idEmpresa, String apeNomsRzSoc);

    @Query("""
           SELECT id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, validado 
           FROM persona 
           WHERE id_empresa= :idEmpresa AND id_tipo_persona <> 95019  
                 AND (num_doc_ident= :numDoc  OR  num_ruc_per_nat= :numDoc)
           LIMIT 1 ;
           """)
    Persona findByNumDoc(int idEmpresa, String numDoc);

}
