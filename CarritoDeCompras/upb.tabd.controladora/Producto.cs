using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BR = upb.tabd.broker;
using EN = upb.tabd.entidades;


namespace upb.tabd.controladora
{
    public class Producto
    {
        private BR.TABD_FinalEntities db = new BR.TABD_FinalEntities();

        public EN.Producto GetProducto(int IdProducto)
        {
            BR.Producto p = db.Producto.Where(x => x.Id_Producto == IdProducto).FirstOrDefault();
            return new EN.Producto
            {
                Id_Producto = p.Id_Producto,
                Nombre_Producto = p.Nombre_Producto,
                //Categoria = p.Categoria,
                Precio = p.Precio,
                //Proveedor = p.Proveedor,
                Imagen = p.Imagen
            };
        }

        public List<EN.Producto> GetProductoDefault()
        {
            var list = db.Producto.Take(6);
            List<EN.Producto> result = new List<EN.Producto>();
            foreach (var p in list)
            {
                result.Add(new EN.Producto
                {
                    Id_Producto = p.Id_Producto,
                    Nombre_Producto = p.Nombre_Producto,
                    //Categoria = p.Categoria,
                    Precio = p.Precio,
                    //Proveedor = p.Proveedor,
                    Imagen = p.Imagen
                });
            }
            return result;
        }

    }
}
