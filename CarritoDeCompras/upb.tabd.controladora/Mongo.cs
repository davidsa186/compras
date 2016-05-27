using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using MongoDB.Bson.Serialization.Attributes;
using EN = upb.tabd.entidades;

namespace upb.tabd.controladora
{
    public class Mongo
    {
        protected static IMongoClient cliente = new MongoClient("mongodb://cliente:1234567@ds011933.mlab.com:11933/tabd_final");
        //Base de datos
        protected static IMongoDatabase database = cliente.GetDatabase("tabd_final");

        //Metodos
        public void AgregarALista(string IdUsuario, int IdProducto)
        {
            var coleccion = database.GetCollection<BsonDocument>("ListaDeseos");
            var filtro = Builders<BsonDocument>.Filter.Eq("IdUsuario", IdUsuario);
            var resultado = coleccion.Find(filtro).FirstOrDefault();
            if (resultado == null)
            {
                EN.ListaDeDeseos lista = new EN.ListaDeDeseos();
                lista.IdUsuario = IdUsuario;
                lista.ProductosDeseados = new List<int>();
                lista.ProductosDeseados.Add(IdProducto);
                var documento = lista.ToBsonDocument();
                coleccion.InsertOne(documento);
            }
            else
            {
                var updateMl = Builders<BsonDocument>.Update.AddToSet("ProductosDeseados", IdProducto);
                coleccion.UpdateManyAsync(filtro, updateMl, new UpdateOptions { IsUpsert = true });
            }
        }

        public void AgregarABusqueda(string IdUsuario, string consulta)
        {
            var coleccion = database.GetCollection<BsonDocument>("BusquedasUsuario");
            var filtro = Builders<BsonDocument>.Filter.Eq("IdUsuario", IdUsuario);
            var resultado = coleccion.Find(filtro).FirstOrDefault();
            if (resultado == null)
            {
                var documento = new BsonDocument
                {
                    { "IdUsuario", IdUsuario },
                    { "Busquedas", new BsonArray
                        {
                            consulta
                        }
                    }
                };
                coleccion.InsertOne(documento);
            }
            else
            {
                var updateMl = Builders<BsonDocument>.Update.AddToSet("Busquedas", consulta);
                coleccion.UpdateManyAsync(filtro, updateMl, new UpdateOptions { IsUpsert = true });
            }
        }

        public List<int> CargarListaDeseos(string IdUsuario)
        {
            try
            {
                var coleccion = database.GetCollection<BsonDocument>("ListaDeseos");
                var filtro = Builders<BsonDocument>.Filter.Eq("IdUsuario", IdUsuario);
                return coleccion.Find(filtro).FirstOrDefault()["ProductosDeseados"].AsBsonArray.Select(p => p.AsInt32).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //No funciona
        public void EliminarDeLista(string IdUsuario, int id_producto)
        {
            var coleccion = database.GetCollection<BsonDocument>("ListaDeseos");
            var filtro = Builders<BsonDocument>.Filter.Eq("IdUsuario", IdUsuario);
            var resultado = coleccion.Find(filtro).FirstOrDefault();
            var filtroEliminar = Builders<BsonDocument>.Filter.Eq("ProductosDeseados", id_producto);
            var eliminar = Builders<BsonDocument>.Update.PullFilter("resultado", filtroEliminar);
            //coleccion.Find(filtro).FirstOrDefault()["ProductosDeseados"].AsBsonArray.Select(p => p.AsInt32).ToList();
        }


        public void AgregarCalificacion(int id_producto, int puntuacion, string comentario, string nombre_usuario)
        {
            var coleccion = database.GetCollection<BsonDocument>("Calificacion");
            var filtro = Builders<BsonDocument>.Filter.Eq("IdProducto", id_producto);
            //obtenemos el resultado
            var resultado = coleccion.Find(filtro).FirstOrDefault();
            if (resultado == null)
            {
                var documento = new BsonDocument
                {
                    { "IdProducto", id_producto },
                    { "Calificaciones", new BsonArray
                        {
                              new BsonDocument {
                                  {"Puntuacion",puntuacion },
                                  {"Comentario",comentario },
                                  {"NombreUsuario",nombre_usuario }
                              }
                        }
                    }
                };
                coleccion.InsertOne(documento);
            }
            else
            {
                var documento = new BsonDocument {
                                  {"Puntuacion",puntuacion },
                                  {"Comentario",comentario },
                                  {"NombreUsuario",nombre_usuario }
                              };
                var updateMl = Builders<BsonDocument>.Update.AddToSet("Calificaciones", documento);
                coleccion.UpdateManyAsync(filtro, updateMl, new UpdateOptions { IsUpsert = true });
            }
        }

        public List<EN.Calificaciones> CargarCalificaion(int id_producto)
        {
            try
            {
                var coleccion = database.GetCollection<BsonDocument>("Calificacion");
                var filtro = Builders<BsonDocument>.Filter.Eq("IdProducto", id_producto);
                var resultado = coleccion.Find(filtro).FirstOrDefault()["Calificaciones"].AsBsonArray;
                List<EN.Calificaciones> listado = new List<EN.Calificaciones>();
                foreach (var item in resultado)
                {
                    EN.Calificaciones c = new EN.Calificaciones();
                    c.NombreUsuario = item["NombreUsuario"].AsString;
                    c.Puntuacion = item["Puntuacion"].AsInt32;
                    c.Comentario = item["Comentario"].AsString;
                    listado.Add(c);
                }
                return listado;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
