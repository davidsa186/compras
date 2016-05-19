using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BR = upb.tabd.broker;
using EN = upb.tabd.entidades;

namespace upb.tabd.controladora
{
    public class Categorias
    {
        private BR.TABD_FinalEntities db = new BR.TABD_FinalEntities();

        public List<EN.Categoria> ListaCategorias(int i)
        {
            
            List<EN.Categoria> listado = new List<EN.Categoria>();
            try
            {

                var resultado = from b in db.Categoria
                                where b.Id_Categoria == i || i ==-1
                                select new { b.Id_Categoria, b.Nombre_Categoria };

                

                foreach (var item in resultado)
                {

                    EN.Categoria categorias = new EN.Categoria();

                    categorias.Id_Categoria = item.Id_Categoria;
                    categorias.Nombre_Categoria = item.Nombre_Categoria;
                    listado.Add(categorias);
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
