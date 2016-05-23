using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarritoDeCompras
{
    public partial class Busqueda : System.Web.UI.Page
    {
        private static string consulta;

        protected void Page_Load(object sender, EventArgs e)
        {
            consulta = Request.QueryString["consulta"].ToLower();
            lblBusqueda.Text = consulta;
        }
    }
}