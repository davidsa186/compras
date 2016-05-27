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
            //obtenemos el resultado
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
            //obtenemos el resultado
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
            var coleccion = database.GetCollection<BsonDocument>("ListaDeseos");
            var filtro = Builders<BsonDocument>.Filter.Eq("IdUsuario", IdUsuario);
            return coleccion.Find(filtro).FirstOrDefault()["ProductosDeseados"].AsBsonArray.Select(p=>p.AsInt32).ToList();
        }


        public void EliminarDeLista(string IdUsuario,int id_producto)
        {
            var coleccion = database.GetCollection<BsonDocument>("ListaDeseos");
            var filtro = Builders<BsonDocument>.Filter.Eq("IdUsuario", IdUsuario);
            var resultado=coleccion.Find(filtro).FirstOrDefault();
            var filtroEliminar = Builders<BsonDocument>.Filter.Eq("ProductosDeseados", id_producto);
            var eliminar = Builders<BsonDocument>.Update.PullFilter("resultado", filtroEliminar);
            //coleccion.Find(filtro).FirstOrDefault()["ProductosDeseados"].AsBsonArray.Select(p => p.AsInt32).ToList();
        }
    }
}
