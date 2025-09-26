/*
 * Document   : TrabajadorRepository
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.repository;

import com.yupanastudio.igest.server.personal.model.Trabajador;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrabajadorRepository extends CrudRepository<Trabajador, Long> {

}
