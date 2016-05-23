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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<EN.Categoria> GetCategorias(int id)
        {
            CT.Categorias controladora = new CT.Categorias();
            var lista = controladora.ListaCategorias(id);
            return lista;
        }

        [System.Web.Services.WebMethod]
        public static List<EN.Producto> GetProductoDefault()
        {
            CT.Producto controladora = new CT.Producto();
            var lista = controladora.GetProductoDefault();
            return lista;
        }

    }
}
