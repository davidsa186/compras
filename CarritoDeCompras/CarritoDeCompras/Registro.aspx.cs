using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using CT = upb.tabd.controladora;
using EN = upb.tabd.entidades;

namespace CarritoDeCompras
{
    public partial class Registro : System.Web.UI.Page
    {
        public static Guid userID;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<EN.Ciudad> ListadoCiudades()
        {
            CT.Ciudad controladora = new CT.Ciudad();
            return controladora.ListaCiudades();            
        }

        [System.Web.Services.WebMethod]
        public static bool Insertar(int ciudad, int cedula, string direccion, string nombre, int[] arrayTelefonos)
        {
            EN.Cliente cliente = new EN.Cliente();
            cliente.Id_Cliente = userID;
            cliente.Id_Ciudad = ciudad;
            cliente.Cedula = cedula;
            cliente.Direccion = direccion;
            cliente.Nombre = nombre;
            cliente.Array_Telefonos = arrayTelefonos;

            CT.Cliente controladora = new CT.Cliente();
            var resultado = controladora.IngresarCliente(cliente);
            return resultado;
        }

        protected void Btn_Siguiente_Click(object sender, EventArgs e)
        {
            try
            {
                var mu = Membership.CreateUser(TextBox_username.Text, TextBox_password.Text, TextBox_email.Text);
                userID = (Guid)mu.ProviderUserKey;

                PanelInicial.Visible = false;
                Panel1.Visible = true;
                Panel2.Visible = true;
            }
            catch (MembershipCreateUserException )
            {

            }
        }
    }
}
