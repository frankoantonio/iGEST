/*
 * Document   : SecurityUserRSL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.rsl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yupanastudio.igest.server.JwtUtilService;
import com.yupanastudio.igest.server.MyResponseEntity;
import com.yupanastudio.igest.server.principal.bll.EmpresaBLL;
import com.yupanastudio.igest.server.principal.bll.LoginXBLL;
import com.yupanastudio.igest.server.principal.bll.SecurityUserBLL;
import com.yupanastudio.igest.server.principal.dml.Empresa;
import com.yupanastudio.igest.server.principal.dml.LoginX;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping
public class SecurityUserRSL {

    private final AuthenticationManager authenticationManager;
    private final SecurityUserBLL obSecurityUserBLL;
    private final JwtUtilService jwtUtilService;
//    @Autowired
    private final LoginXBLL obLoginXBLL;
    private final EmpresaBLL obEmpresaBLL;

    public SecurityUserRSL(AuthenticationManager authenticationManager, SecurityUserBLL obSecurityUserBLL, JwtUtilService jwtUtilService, LoginXBLL obLoginXBLL, EmpresaBLL obEmpresaBLL) {
        this.authenticationManager = authenticationManager;
        this.obSecurityUserBLL = obSecurityUserBLL;
        this.jwtUtilService = jwtUtilService;
        this.obLoginXBLL = obLoginXBLL;
        this.obEmpresaBLL = obEmpresaBLL;
    }

    public record ClientInfo(String hostName, String ip, String device, String so, String userSO,
            String nomUsu, String pwdUsu, long idUsuario, int idEmpresa, String grupoEmp, int idTipoPersona) {

    }

    public record RptaLogin(String token, LoginX obLoginX) {

    }

    @PostMapping("/auth/validar")
    public ResponseEntity<RptaLogin> autenticar(@RequestBody ClientInfo obUsuLogin) {
        try {
            // usuario y perfiles
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(obUsuLogin.nomUsu(), obUsuLogin.pwdUsu()));
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();

            // valida tipo de usuario antes de continuar
            if (!obSecurityUserBLL.isValidTipUser(userDetails.getUsername(), obUsuLogin.idTipoPersona())) {
                return new MyResponseEntity(getClass(), new AccessDeniedException("Falta definir la categoría de usuario/persona"), obUsuLogin.grupoEmp()).getResponse();
            }

            // token
            final String jwt = jwtUtilService.generateToken(userDetails);
            Map<String, String> response = Map.of("mitoken", jwt);

            // obLoginX
            LoginX obLoginX = obLoginXBLL.getUsuEmp(obUsuLogin.idEmpresa, obUsuLogin.nomUsu);
            RptaLogin authResponse = new RptaLogin(jwt, obLoginX);
            //
            //return new ResponseEntity<>(new ObjectMapper().writeValueAsString(response), HttpStatus.OK);
            return new ResponseEntity<>(authResponse, HttpStatus.OK);
        } catch (AuthenticationException ex) {
            return new MyResponseEntity(getClass(), ex, obUsuLogin.grupoEmp()).getResponse();
        }
    }

    @GetMapping("/auth/test")
    public ResponseEntity<String> test() {
        System.out.println("Prueba correcta, sin autenticación!!!");
        return new ResponseEntity<>("Prueba correcta, sin autenticación.", HttpStatus.OK);
    }

    @GetMapping("/auth/test/{numRuc}")
    public ResponseEntity<List<Empresa>> getEmpresas(@PathVariable String numRuc) {
        try {
            return new ResponseEntity<>(obEmpresaBLL.findByRuc(numRuc), HttpStatus.OK);
        } catch (Exception ex) {
            return new MyResponseEntity(getClass(), ex, "XXXXXXXXXXXXXXXXXXxx").getResponse();
        }
    }

    /**
     * Valores para los colores de la interfaz de usuario
     */
    public record ConfigUI(int idEmpresa, String codeName, String grupoEmp, String fondo1, String fondo2, String fondo3, String primary, String secondary, String tertiary) {

    }

    @GetMapping({"/auth/info", "/auth/info/{codeName}"})
    public ResponseEntity<ConfigUI> getConfigUI(@PathVariable(required = false) String codeName) {
        try {
            return new ResponseEntity<>(obEmpresaBLL.getConfigUI(codeName), HttpStatus.OK);
        } catch (Exception ex) {
            return new MyResponseEntity(getClass(), ex, codeName.toUpperCase()).getResponse();
        }
    }

    @GetMapping("/test/token")
    public ResponseEntity<String> testWithToken() throws JsonProcessingException {
        Map<String, Object> response = new HashMap<>();
        response.put("nombres", "Franklin Barzola");
        response.put("peso", 90.50);
        response.put("edad", 45);
        return new ResponseEntity<>(new ObjectMapper().writeValueAsString(response), HttpStatus.OK);
    }

}
