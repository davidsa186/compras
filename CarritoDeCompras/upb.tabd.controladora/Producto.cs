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
            producto.Categoria = new EN.Categoria { Id_Categoria = p.Categoria.Id_Categoria, Descripcion = p.Categoria.Descripcion };
            producto.Precio = p.Precio;
            producto.Proveedor = new EN.Proveedor { Id_Proveedor = p.Proveedor.Id_Proveedor, Nombre = p.Proveedor.Nombres };
            producto.Imagen = p.Imagen;
            producto.Stock = p.Stock;

            return producto;
        }

        public List<EN.Producto> GetProductoDefault()
        {
            var listado = db.Producto.Take(6);
            List<EN.Producto> resultado = new List<EN.Producto>();
            foreach (var item in listado)
            {
                EN.Producto producto = new EN.Producto();
                producto.Id_Producto = item.Id_Producto;
                producto.Nombre_Producto = item.Nombre_Producto;
                //Categoria = p.Categoria,
                producto.Precio = item.Precio;
                producto.Proveedor = new EN.Proveedor { Id_Proveedor = item.Proveedor.Id_Proveedor, Nombre = item.Proveedor.Nombres };
                producto.Imagen = item.Imagen;
                producto.Stock = item.Stock;
                resultado.Add(producto);
            }
            return resultado;
        }

        public List<EN.Producto> GetProductoCategoria(int IdCategoria)
        {
            var listado = db.Producto.Where(x => x.Id_Categoria == IdCategoria);
            List<EN.Producto> resultado = new List<EN.Producto>();
            foreach (var item in listado)
            {
                EN.Producto producto = new EN.Producto();
                producto.Id_Producto = item.Id_Producto;
                producto.Nombre_Producto = item.Nombre_Producto;
                //Categoria = p.Categoria,
                producto.Precio = item.Precio;
                producto.Proveedor = new EN.Proveedor { Id_Proveedor = item.Proveedor.Id_Proveedor, Nombre = item.Proveedor.Nombres };
                producto.Imagen = item.Imagen;
                producto.Stock = item.Stock;
                resultado.Add(producto);
            }
            return resultado;
        }

        public List<EN.Producto> GetResultados(string consulta)
        {
            string[] palabras = consulta.Split();
            List<BR.Producto> listado = new List<BR.Producto>();
            List<EN.Producto> resultado = new List<EN.Producto>();

            foreach (string p in palabras)
            {
                var productoNombre = db.Producto.Where(x => x.Nombre_Producto.ToLower().Contains(p));
                var categoria = db.Categoria.Where(x => x.Nombre_Categoria.ToLower() == p).FirstOrDefault();

                foreach (var item in productoNombre)
                {
                    if (!listado.Contains(item))
                    {
                        listado.Add(item);
                    }
                }

                if (categoria != null)
                {
                    var productoCategoria = db.Producto.Where(x => x.Id_Categoria == categoria.Id_Categoria);
                    foreach (var item in productoCategoria)
                    {
                        if (!listado.Contains(item))
                        {
                            listado.Add(item);
                        }
                    }
                }
            }

            foreach (var item in listado)
            {
                EN.Producto producto = new EN.Producto();
                producto.Id_Producto = item.Id_Producto;
                producto.Nombre_Producto = item.Nombre_Producto;
                //Categoria = p.Categoria,
                producto.Precio = item.Precio;
                producto.Proveedor = new EN.Proveedor { Id_Proveedor = item.Proveedor.Id_Proveedor, Nombre = item.Proveedor.Nombres };
                producto.Imagen = item.Imagen;
                producto.Stock = item.Stock;
                resultado.Add(producto);
            }

            return resultado;
        }

        public List<EN.Producto> GetProductosLista(List<int> ItemsCarrito)
        {
            List<EN.Producto> resultado = new List<EN.Producto>();
            foreach (int i in ItemsCarrito)
            {
                var producto = GetProducto(i);
                resultado.Add(producto);
            }
            return resultado;
        }
    }
}
