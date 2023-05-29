using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrabajoPractico7.Clases {
    public class Provincia {
        private int Id { get; set; }
        private string Descripcion { get; set; }
        public static string Table { get { return "Provincia"; } }
        public static class Columns {
            public static string Id { get { return "Id_Provincia"; } }
            public static string Descripcion { get { return "DescripcionProvincia"; } }
        }
        public Provincia(int id, string Descripcion) {
            Id = id;
            this.Descripcion = Descripcion;
        }
        public static Response GetAllData() {
            Connection con = new Connection(Connection.Database.BDSucursales);
            return con.Response.ErrorFound
                ? con.Response
                : con.FetchData(
                    query: $"SELECT [{Columns.Id}], [{Columns.Descripcion}] FROM [{Table}]"
                    );
        }
    }
}