/*
 * Document   : LoginXService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.yupanastudio.igest.server.principal.repository.AccesoRepository;
import com.yupanastudio.igest.server.principal.repository.DepartamentoRepository;
import com.yupanastudio.igest.server.principal.repository.DistritoRepository;
import com.yupanastudio.igest.server.principal.repository.EmpresaRepository;
import com.yupanastudio.igest.server.principal.repository.EmpresaSistemaRepository;
import com.yupanastudio.igest.server.principal.repository.OpcionRepository;
import com.yupanastudio.igest.server.principal.repository.PaisRepository;
import com.yupanastudio.igest.server.principal.repository.PerfilRepository;
import com.yupanastudio.igest.server.principal.repository.PersonaRepository;
import com.yupanastudio.igest.server.principal.repository.ProvinciaRepository;
import com.yupanastudio.igest.server.principal.repository.SedeRepository;
import com.yupanastudio.igest.server.principal.repository.SistemaRepository;
import com.yupanastudio.igest.server.principal.repository.TipoRepository;
import com.yupanastudio.igest.server.principal.repository.UsuarioRepository;
import com.yupanastudio.igest.server.principal.repository.UsuarioSedeSistemaRepository;
import com.yupanastudio.igest.server.principal.repository.VarGlobalRepository;
import com.yupanastudio.igest.server.principal.model.Acceso;
import com.yupanastudio.igest.server.principal.model.Empresa;
import com.yupanastudio.igest.server.principal.model.LoginX;
import com.yupanastudio.igest.server.principal.model.Perfil;
import com.yupanastudio.igest.server.principal.model.Usuario;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginXService {

    @Autowired
    UsuarioRepository obUsuarioRepository;
    @Autowired
    EmpresaRepository obEmpresaRepository;
    @Autowired
    SistemaRepository obSistemaRepository;
    @Autowired
    PersonaRepository obPersonaRepository;
    @Autowired
    UsuarioSedeSistemaRepository obUsuarioSedeSistemaRepository;
    @Autowired
    PerfilRepository obPerfilRepository;
    @Autowired
    OpcionRepository obOpcionRepository;
    @Autowired
    SedeRepository obSedeRepository;
    @Autowired
    EmpresaSistemaRepository obEmpresaSistemaRepository;
    @Autowired
    PaisRepository obPaisRepository;
    @Autowired
    DepartamentoRepository obDepartamentoRepository;
    @Autowired
    ProvinciaRepository obProvinciaRepository;
    @Autowired
    DistritoRepository obDistritoRepository;
    @Autowired
    TipoRepository obTipoRepository;
    @Autowired
    VarGlobalRepository obVarGlobalRepository;
    @Autowired
    AccesoRepository obAccesoRepository;

    public LoginX getUsuEmp(int idEmpresa, String nomUsuario) {
        LoginX obLoginX = new LoginX();
        //long idUsuario = 

        
        
        Usuario obUsuario = obUsuarioRepository.findByNomUsu(nomUsuario);
        Empresa obEmpresa = obEmpresaRepository.findById(idEmpresa).orElse(null);

        if (obUsuario == null || obEmpresa == null) {
            return null;
        }
        
        obLoginX.setFhServer(LocalDateTime.now());

        obUsuario.setPwdUsu("");
        obLoginX.setLsSistema(obSistemaRepository.findAll());

        obUsuario.setObPersona(obPersonaRepository.findById(obUsuario.getIdUsuario()).orElse(null));
        obUsuario.setLsUsuarioSedeSistema(obUsuarioSedeSistemaRepository.findByIdUsuario(obUsuario.getIdUsuario()));
        List<Perfil> lsPerfil = obPerfilRepository.findByIdUsuario(obUsuario.getIdUsuario());
        for (Perfil item : lsPerfil) {
            item.setLsOpcionX(obOpcionRepository.findByIdPerfil(item.getIdPerfil()));
        }
        obUsuario.setLsPerfil(lsPerfil);

        obEmpresa.setLsSedes(obSedeRepository.findByIdEmpresa(idEmpresa));
        obEmpresa.setLsEmpresaSistemas(obEmpresaSistemaRepository.findByIdEmpresa(idEmpresa));

        obLoginX.setObUsuario(obUsuario);
        obLoginX.setObEmpresa(obEmpresa);
        obLoginX.setLsEmpresa(obEmpresaRepository.findByGrupoEmp(obEmpresa.getGrupoEmp()));
        obLoginX.setLsPais(obPaisRepository.findAll());
        obLoginX.setLsDepartamento(obDepartamentoRepository.findAll());
        obLoginX.setLsProvincia(obProvinciaRepository.findAll());
        obLoginX.setLsDistrito(obDistritoRepository.findAll());
        obLoginX.setLsTipo(obTipoRepository.findAll());
        obLoginX.setLsVarGlobal(obVarGlobalRepository.findByIdEmpresa(idEmpresa));

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
        obAccesoRepository.save(obAcceso);
        System.out.println("Acceso guardado con ID: " + obAcceso.getIdAcceso());

        //Acceso guardado = obAccesoRepository.save(obAcceso); // save() devolverá la entidad con el idAcceso poblado
//        System.out.println("Acceso guardado con ID: " + guardado.getIdAcceso());
        System.out.println(obLoginX.toString());
        return obLoginX;
    }

}
