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
    public partial class ListaDeseos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<EN.Producto> CargarListaDeseos()
        {
            CT.Mongo controlMongo = new CT.Mongo();            
            List<int> productos = controlMongo.CargarListaDeseos(HttpContext.Current.User.Identity.Name);
            CT.Producto controlProducto = new CT.Producto();
            return controlProducto.GetProductosLista(productos);
        }
        

        [System.Web.Services.WebMethod]
        public static void EliminardeLista(int id_producto)
        {
            CT.Mongo controlMongo = new CT.Mongo();
            controlMongo.EliminarDeLista(HttpContext.Current.User.Identity.Name, id_producto);
           
        }

    }
}