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
    public partial class ProductoCategoria : System.Web.UI.Page
    {
        private static string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
        }

        [System.Web.Services.WebMethod]
        public static List<EN.Categoria> GetCategoria()
        {          
            int Id_Categoria = int.Parse(id);
            CT.Categorias controladora = new CT.Categorias();
            var lista = controladora.ListaCategorias(Id_Categoria);
            return lista;
        }
    }
}