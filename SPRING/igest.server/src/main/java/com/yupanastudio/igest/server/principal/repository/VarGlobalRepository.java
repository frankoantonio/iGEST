package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.principal.model.VarGlobal;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VarGlobalRepository extends CrudRepository<VarGlobal, Integer> {

    List<VarGlobal> findByIdEmpresa(int idEmpresa);

}
