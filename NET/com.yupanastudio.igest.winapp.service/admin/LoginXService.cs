using System.Threading.Tasks;

namespace com.yupanastudio.igest.winapp
{
    public class LoginXService
    {
        public static async Task<LoginX> getLoginX(int idEmpresa, long idUsuario)
        {
            return await Service.GetAsync<LoginX>($"{Vars.urlServerApp}/admin/perfilAdmin/login/{idEmpresa}/{idUsuario}");
        }

    }//end class

}
