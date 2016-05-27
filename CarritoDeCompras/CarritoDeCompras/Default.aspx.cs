using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CT = upb.tabd.controladora;
using EN = upb.tabd.entidades;

namespace CarritoDeCompras
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<EN.Categoria> GetCategorias(int i)
        {
            CT.Categoria controladora = new CT.Categoria();
            var categorias = controladora.ListaCategorias(i);
            return categorias;
        }

        [System.Web.Services.WebMethod]
        public static List<EN.Producto> GetProductoDefault()
        {
            CT.Producto controladora = new CT.Producto();
            return controladora.GetProductoDefault();
        }

        [System.Web.Services.WebMethod]
        public static bool Login(string user, string password)
        {
            var valid = Membership.ValidateUser(user, password);
            if (valid == true)
            {
                FormsAuthentication.SetAuthCookie(user, true);
            }
            return valid;
        }
    }
}
