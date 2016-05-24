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
    public partial class Busqueda : System.Web.UI.Page
    {
        private static string consulta;

        protected void Page_Load(object sender, EventArgs e)
        {
            consulta = Request.QueryString["consulta"];
            lblBusqueda.Text = consulta;            
        }

        [System.Web.Services.WebMethod]
        public static List<EN.Producto> Resultados()
        {
            if(consulta != null && consulta != "")
            {
                consulta = consulta.ToLower();
                CT.Producto controladora = new CT.Producto();
                return controladora.GetProductoDefault();
            }
            return null;
        }
        
    }
}