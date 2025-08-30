/*
 * Document   : TrabajadorDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import com.yupanastudio.igest.server.personal.dml.Trabajador;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrabajadorDAL extends CrudRepository<Trabajador, Long> {

}
