/*
 * Document   : LoginXBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.yupanastudio.igest.server.principal.dal.AccesoDAL;
import com.yupanastudio.igest.server.principal.dal.DepartamentoDAL;
import com.yupanastudio.igest.server.principal.dal.DistritoDAL;
import com.yupanastudio.igest.server.principal.dal.EmpresaDAL;
import com.yupanastudio.igest.server.principal.dal.EmpresaSistemaDAL;
import com.yupanastudio.igest.server.principal.dal.OpcionDAL;
import com.yupanastudio.igest.server.principal.dal.PaisDAL;
import com.yupanastudio.igest.server.principal.dal.PerfilDAL;
import com.yupanastudio.igest.server.principal.dal.PersonaDAL;
import com.yupanastudio.igest.server.principal.dal.ProvinciaDAL;
import com.yupanastudio.igest.server.principal.dal.SedeDAL;
import com.yupanastudio.igest.server.principal.dal.SistemaDAL;
import com.yupanastudio.igest.server.principal.dal.TipoDAL;
import com.yupanastudio.igest.server.principal.dal.UsuarioDAL;
import com.yupanastudio.igest.server.principal.dal.UsuarioSedeSistemaDAL;
import com.yupanastudio.igest.server.principal.dal.VarGlobalDAL;
import com.yupanastudio.igest.server.principal.dml.Acceso;
import com.yupanastudio.igest.server.principal.dml.Empresa;
import com.yupanastudio.igest.server.principal.dml.LoginX;
import com.yupanastudio.igest.server.principal.dml.Perfil;
import com.yupanastudio.igest.server.principal.dml.Usuario;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginXBLL {

    @Autowired
    UsuarioDAL obUsuarioDAL;
    @Autowired
    EmpresaDAL obEmpresaDAL;
    @Autowired
    SistemaDAL obSistemaDAL;
    @Autowired
    PersonaDAL obPersonaDAL;
    @Autowired
    UsuarioSedeSistemaDAL obUsuarioSedeSistemaDAL;
    @Autowired
    PerfilDAL obPerfilDAL;
    @Autowired
    OpcionDAL obOpcionDAL;
    @Autowired
    SedeDAL obSedeDAL;
    @Autowired
    EmpresaSistemaDAL obEmpresaSistemaDAL;
    @Autowired
    PaisDAL obPaisDAL;
    @Autowired
    DepartamentoDAL obDepartamentoDAL;
    @Autowired
    ProvinciaDAL obProvinciaDAL;
    @Autowired
    DistritoDAL obDistritoDAL;
    @Autowired
    TipoDAL obTipoDAL;
    @Autowired
    VarGlobalDAL obVarGlobalDAL;
    @Autowired
    AccesoDAL obAccesoDAL;

    public LoginX getUsuEmp(int idEmpresa, String nomUsuario) {
        LoginX obLoginX = new LoginX();
        //long idUsuario = 

        
        
        Usuario obUsuario = obUsuarioDAL.findByNomUsu(nomUsuario);
        Empresa obEmpresa = obEmpresaDAL.findById(idEmpresa).orElse(null);

        if (obUsuario == null || obEmpresa == null) {
            return null;
        }
        
        obLoginX.setFhServer(LocalDateTime.now());

        obUsuario.setPwdUsu("");
        obLoginX.setLsSistema(obSistemaDAL.findAll());

        obUsuario.setObPersona(obPersonaDAL.findById(obUsuario.getIdUsuario()).orElse(null));
        obUsuario.setLsUsuarioSedeSistema(obUsuarioSedeSistemaDAL.findByIdUsuario(obUsuario.getIdUsuario()));
        List<Perfil> lsPerfil = obPerfilDAL.findByIdUsuario(obUsuario.getIdUsuario());
        for (Perfil item : lsPerfil) {
            item.setLsOpcionX(obOpcionDAL.findByIdPerfil(item.getIdPerfil()));
        }
        obUsuario.setLsPerfil(lsPerfil);

        obEmpresa.setLsSedes(obSedeDAL.findByIdEmpresa(idEmpresa));
        obEmpresa.setLsEmpresaSistemas(obEmpresaSistemaDAL.findByIdEmpresa(idEmpresa));

        obLoginX.setObUsuario(obUsuario);
        obLoginX.setObEmpresa(obEmpresa);
        obLoginX.setLsEmpresa(obEmpresaDAL.findByGrupoEmp(obEmpresa.getGrupoEmp()));
        obLoginX.setLsPais(obPaisDAL.findAll());
        obLoginX.setLsDepartamento(obDepartamentoDAL.findAll());
        obLoginX.setLsProvincia(obProvinciaDAL.findAll());
        obLoginX.setLsDistrito(obDistritoDAL.findAll());
        obLoginX.setLsTipo(obTipoDAL.findAll());
        obLoginX.setLsVarGlobal(obVarGlobalDAL.findByIdEmpresa(idEmpresa));

        // todo ok, guardamos el acceso        
        String mijson = "{\"ip\":\"192.168.1.23\",\"navegador\":\"Chrome\"}";
        Acceso obAcceso = new Acceso(); // Instancia directa de Acceso, no una subclase anónima

        obAcceso.setIdEmpresa(1004);
        obAcceso.setIdUsuario(101);
        obAcceso.setIdTipoUsu(3);
        obAcceso.setFeLogin(LocalDate.now());
        obAcceso.setFhLogin(LocalDateTime.now());
        obAcceso.setFhLogout(null); // No es necesario si el tipo de dato es un objeto y quieres que sea null
        obAcceso.setInfoCliente(mijson);
        System.out.println("HI_______>>>>>>>");
        System.out.println(obAcceso.toString());
        obAccesoDAL.save(obAcceso);
        System.out.println("Acceso guardado con ID: " + obAcceso.getIdAcceso());

        //Acceso guardado = obAccesoDAL.save(obAcceso); // save() devolverá la entidad con el idAcceso poblado
//        System.out.println("Acceso guardado con ID: " + guardado.getIdAcceso());
        System.out.println(obLoginX.toString());
        return obLoginX;
    }

}
