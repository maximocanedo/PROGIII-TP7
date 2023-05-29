using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrabajoPractico7.Clases {
    public class Sucursal {
        private string _n, _d, _ds, _u;
        public int Id { get; set; }
        public string Nombre { get { return _n; } set { _n = value.Length > 100 ? value.Substring(0, 100) : value; } }
        public string Descripcion { get { return _d; } set { _d = value.Length > 100 ? value.Substring(0, 100) : value; } }
        public int Horario { get; set; }
        public int Provincia { get; set; }
        public string Direccion { get { return _ds; } set { _ds = value.Length > 100 ? value.Substring(0, 100) : value; } }
        public string Imagen { get { return _u; } set { _u = value.Length > 100 ? value.Substring(0, 100) : value; } }
        public static string Table { get { return "Sucursal"; } }
        public static class Columns {
            public static string Id { get { return "Id_Sucursal"; } }
            public static string Nombre { get { return "NombreSucursal"; } }
            public static string Descripcion { get { return "DescripcionSucursal"; } }
            public static string Horario { get { return "Id_HorarioSucursal"; } }
            public static string Provincia { get { return "Id_ProvinciaSucursal"; } }
            public static string Direccion { get { return "DireccionSucursal"; } }
            public static string Imagen { get { return "URL_Imagen_Sucursal"; } }
        }
        public Sucursal() {

        }
        public static Response GetAll() {
            Connection con = new Connection(Connection.Database.BDSucursales);
            return con.Response.ErrorFound
                ? con.Response
                : con.FetchData(
                    query: $"SELECT [{Columns.Id}], " +
                           $"[{Columns.Nombre}], " +
                           $"[{Columns.Descripcion}], " +
                           $"[{Columns.Horario}], " +
                           $"[{Columns.Provincia}], " +
                           $"[{Columns.Direccion}], " +
                           $"REPLACE([{Columns.Imagen}], '~', '') as [{Columns.Imagen}] " +
                           $"FROM [{Table}]"
                    );
        }
        public static Response FilterByProvinceId(int provinceId) {
            Connection con = new Connection(Connection.Database.BDSucursales);
            return con.Response.ErrorFound
                ? con.Response
                : con.FetchData(
                    query: $"SELECT [{Columns.Id}], " +
                           $"[{Columns.Nombre}], " +
                           $"[{Columns.Descripcion}], " +
                           $"[{Columns.Horario}], " +
                           $"[{Columns.Provincia}], " +
                           $"[{Columns.Direccion}], " +
                           $"REPLACE([{Columns.Imagen}], '~', '') as [{Columns.Imagen}] " +
                           $"FROM [{Table}] " +
                           $"WHERE [{Columns.Provincia}] = @id",
                    parameters: new Dictionary<string, object> {
                        { "@id", provinceId }
                    });
        }
    }
}