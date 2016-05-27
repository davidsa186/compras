using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CT = upb.tabd.controladora;
using EN = upb.tabd.entidades;

namespace CarritoDeCompras
{
    public partial class Producto : System.Web.UI.Page
    {
        private static string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
        }

        [System.Web.Services.WebMethod]
        public static EN.Producto GetProducto()
        {
            int Id_Producto = int.Parse(id);
            CT.Producto controladora = new CT.Producto();            
            return controladora.GetProducto(Id_Producto);
        }

        [System.Web.Services.WebMethod]
        public static bool AgregarALista()
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                int IdProducto = int.Parse(id);
                string IdUsuario = HttpContext.Current.User.Identity.Name;
                CT.Mongo controladora = new CT.Mongo();
                controladora.AgregarALista(IdUsuario, IdProducto);
                return true;
            }
            else
            {
                return false;
            }
        }

        [System.Web.Services.WebMethod]
        public static List<EN.Calificaciones> GetComentarios()
        {
            try
            {
                int Id_Producto = int.Parse(id);
                CT.Mongo controladora = new CT.Mongo();
                return controladora.CargarCalificaion(Id_Producto);
            }
            catch (Exception ex)
            {
                throw ex;
            }            
        }
    }
}