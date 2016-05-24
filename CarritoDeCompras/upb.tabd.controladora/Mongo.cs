using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace upb.tabd.controladora
{
    class Mongo
    {
        protected static IMongoClient cliente = new MongoClient(" mongodb://cliente:1234567@ds011933.mlab.com:11933/tabd_final");
        //Base de datos
        protected static IMongoDatabase database = cliente.GetDatabase("tabd_final");

        //Metodos
    }
}
