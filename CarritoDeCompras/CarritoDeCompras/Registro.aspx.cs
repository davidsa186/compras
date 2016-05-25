using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CarritoDeCompras
{
    public partial class Registro : System.Web.UI.Page
    {
        public string Clase { get; set; }
        public string Mensaje { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Clase = "invisible";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                var mu = Membership.CreateUser(TextBox_username.Text, TextBox_password.Text, TextBox_email.Text);
                Guid userID = (Guid)mu.ProviderUserKey;


                //var ctx = new BusesDataContext();
                //var usuario = new Usuario()
                //{
                //    Cedula = Convert.ToInt32(TextBox_Cedula.Text),
                //    Direccion = TextBox_Direccion.Text,
                //    Telefono = Convert.ToInt32(TextBox_Telefono.Text),
                //    Nombre = TextBox_Nombre.Text,
                //    Id_Usuario = userID

                //};
                //ctx.Usuario.InsertOnSubmit(usuario);
                //ctx.SubmitChanges();

                Clase = "alert alert-success alert-dismissable";
                Mensaje = "Se agregó el usuario correctamente";

            }
            catch (MembershipCreateUserException ex)
            {

                Clase = "alert alert-danger alert-dismissable";
                Mensaje = "No se agregó el usuario";

                switch (ex.StatusCode)
                {
                    case MembershipCreateStatus.Success:
                        string script = "alert('Creado Exitosamente');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alerta", script, true);
                        string cerrar = "window.close();window.opener.document.location='Default.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "cerrar", cerrar, true);
                        break;
                    case MembershipCreateStatus.InvalidUserName:
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        string script1 = "alert('El password no cumple con las condiciones mínimas de seguridad. Ingrese un passsword de 7 caracteres');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alerta", script1, true);
                        break;
                    case MembershipCreateStatus.InvalidQuestion:
                        break;
                    case MembershipCreateStatus.InvalidAnswer:
                        break;
                    case MembershipCreateStatus.InvalidEmail:
                        break;
                    case MembershipCreateStatus.DuplicateUserName:
                        break;
                    case MembershipCreateStatus.DuplicateEmail:
                        break;
                    case MembershipCreateStatus.UserRejected:
                        break;
                    case MembershipCreateStatus.InvalidProviderUserKey:
                        break;
                    case MembershipCreateStatus.DuplicateProviderUserKey:
                        break;
                    case MembershipCreateStatus.ProviderError:
                        break;
                    default:
                        break;
                }
            }

        }
    }
}