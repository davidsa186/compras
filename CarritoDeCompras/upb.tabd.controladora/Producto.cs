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
            EN.Producto producto = new EN.Producto();
            producto.Id_Producto = p.Id_Producto;
            producto.Nombre_Producto = p.Nombre_Producto;
            producto.Categoria = new EN.Categoria { Id_Categoria = p.Categoria.Id_Categoria,Descripcion = p.Categoria.Descripcion };
            producto.Precio = p.Precio;
            producto.Proveedor = new EN.Proveedor { Id_Proveedor = p.Proveedor.Id_Proveedor, Nombre = p.Proveedor.Nombres };
            producto.Imagen = p.Imagen;
            producto.Stock = p.Stock;


            return producto;
        }

        public List<EN.Producto> GetProductoDefault()
        {
            var list = db.Producto.Take(6);
            List<EN.Producto> result = new List<EN.Producto>();
            foreach (var p in list)
            {
                EN.Producto producto = new EN.Producto();
                producto.Id_Producto = p.Id_Producto;
                producto.Nombre_Producto = p.Nombre_Producto;
                //Categoria = p.Categoria,
                producto.Precio = p.Precio;
                producto.Proveedor = new EN.Proveedor { Id_Proveedor = p.Proveedor.Id_Proveedor, Nombre = p.Proveedor.Nombres };
                producto.Imagen = p.Imagen;
                producto.Stock = p.Stock;
                result.Add(producto);
            }
            return result;
        }

        public List<EN.Producto> GetProductoCategoria(int IdCategoria)
        {
            var list = db.Producto.Where(x => x.Id_Categoria == IdCategoria);
            List<EN.Producto> result = new List<EN.Producto>();
            foreach (var p in list)
            {
                EN.Producto producto = new EN.Producto();
                producto.Id_Producto = p.Id_Producto;
                producto.Nombre_Producto = p.Nombre_Producto;
                //Categoria = p.Categoria,
                producto.Precio = p.Precio;
                producto.Proveedor = new EN.Proveedor { Id_Proveedor = p.Proveedor.Id_Proveedor, Nombre = p.Proveedor.Nombres };
                producto.Imagen = p.Imagen;
                producto.Stock = p.Stock;
                result.Add(producto);
            }
            return result;
        }
    }
}
