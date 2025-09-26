package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.Usuario;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends CrudRepository<Usuario, Long> {

    Usuario findByNomUsu(String nomUsu);

}
