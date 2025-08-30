using System;
using System.Collections.Generic;

namespace com.yupanastudio.polariss.app
{
    public class LoginX
    {
        public Boolean ok { get; set; }
        public String msg { get; set; }
        public Empresa obEmpresa { get; set; }
        public List<Empresa> lsEmpresaGroup { get; set; }
        public Usuario obUsuario { get; set; }
        public List<Sistema> lsSistemasEmp { get; set; }
        public List<Sede> lsSedesEmp { get; set; }
        public List<Sistema> lsSistemasUsu { get; set; }
        public List<Perfil> lsPerfilUsu { get; set; }
        public List<Pais> lsPaises { get; set; }
        public List<Departamento> lsDptos { get; set; }
        public List<Provincia> lsProvs { get; set; }
        public List<Distrito> lsDists { get; set; }
        public List<Tipo> lsTipos { get; set; }
        public List<VarGlobal> lsVarGlobal { get; set; }
        public DateTime feHhServer { get; set; }

    }//end class

}
