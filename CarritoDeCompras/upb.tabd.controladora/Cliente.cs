using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BR = upb.tabd.broker;
using EN = upb.tabd.entidades;

namespace upb.tabd.controladora
{
    public class Cliente
    {
        private BR.TABD_FinalEntities db = new BR.TABD_FinalEntities();

        public bool IngresarCliente(EN.Cliente cliente)
        {
            var resultado = true;
            try
            {
                BR.Cliente cliente1 = new BR.Cliente();

                cliente1.Id_Cliente = cliente.Id_Cliente;
                cliente1.Id_Ciudad = cliente.Id_Ciudad;
                cliente1.Nombres = cliente.Nombre;
                cliente1.Cedula = cliente.Cedula;
                cliente1.Direccion = cliente.Direccion;
                db.Cliente.Add(cliente1);


                foreach (var item in cliente.Array_Telefonos)
                {
                    BR.Telefono telefono = new BR.Telefono();
                    telefono.Id_Cliente = cliente.Id_Cliente;
                    telefono.Numero_Telefono = item;
                    db.Telefono.Add(telefono);
                      
                }
                resultado = true;
                db.SaveChanges();

            }
            catch (Exception)
            {

                resultado = false;
            }

            return resultado;
        }
    }
}
