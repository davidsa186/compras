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
                BR.Cliente clienteNuevo = new BR.Cliente();

                clienteNuevo.Id_Cliente = cliente.Id_Cliente;
                clienteNuevo.Id_Ciudad = cliente.Id_Ciudad;
                clienteNuevo.Nombres = cliente.Nombre;
                clienteNuevo.Cedula = cliente.Cedula;
                clienteNuevo.Direccion = cliente.Direccion;
                db.Cliente.Add(clienteNuevo);

                foreach (int tel in cliente.Array_Telefonos)
                {
                    BR.Telefono telefono = new BR.Telefono();
                    telefono.Id_Cliente = cliente.Id_Cliente;
                    telefono.Numero_Telefono = tel;
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
