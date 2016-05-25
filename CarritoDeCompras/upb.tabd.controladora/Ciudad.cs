using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BR = upb.tabd.broker;
using EN = upb.tabd.entidades;

namespace upb.tabd.controladora
{
    public class Ciudad
    {
        private BR.TABD_FinalEntities db = new BR.TABD_FinalEntities();
        public List<EN.Ciudad> ListaCiudades()
        {

            List<EN.Ciudad> listado = new List<EN.Ciudad>();
            try
            {

                var resultado = from c in db.Ciudad
                                select new { c.Id_Ciudad, c.Nombre_Ciudad };

                foreach (var item in resultado)
                {

                    EN.Ciudad ciudades = new EN.Ciudad();

                    ciudades.Id_Ciudad = item.Id_Ciudad;
                    ciudades.Nombre_Ciudad = item.Nombre_Ciudad;
                    listado.Add(ciudades);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return listado;
        }
    }
}
