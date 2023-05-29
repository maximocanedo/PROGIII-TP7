using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrabajoPractico7.Clases;

namespace TrabajoPractico7 {
    public partial class SeleccionarSucursales : System.Web.UI.Page {
        protected DataTable tabla;
        protected readonly string y = "Seleccionados";
        protected void Page_Load(object sender, EventArgs e) {
            if (Session[y] == null) {
                DataTable dataTable = new DataTable(y);
                dataTable.Columns.Add("Id_Sucursal", typeof(int));
                dataTable.Columns.Add("NombreSucursal", typeof(string));
                dataTable.Columns.Add("DescripcionSucursal", typeof(string));
                Session[y] = dataTable;
            }
            tabla = (DataTable)Session[y];
        }


        protected void btnSeleccionarProvincia_Click(object sender, EventArgs e) {

        }

        protected void btnSeleccionarProvincia_Command(object sender, CommandEventArgs e) {
            if (e.CommandName == "Filtrar") {
                string consulta = "SELECT * FROM [Sucursal] where [Id_ProvinciaSucursal] = '" + e.CommandArgument.ToString() + "' ";
                SqlDataSource2.SelectCommand = consulta;
                SqlDataSource2.DataBind();
                ListView2.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e) {
            string keywords = TextBox1.Text;
            string consulta = $"SELECT * FROM [Sucursal] where [NombreSucursal] LIKE '%{keywords}%'";
            SqlDataSource2.SelectCommand = consulta;
            SqlDataSource2.DataBind();
            ListView2.DataBind();

        }

        protected void Button2_Command(object sender, CommandEventArgs e) {
            if (e.CommandName == "Select") {
                var s = new Sucursal();
                int id = int.Parse((string)e.CommandArgument);
                if (s.GetById(id)) {
                    string nombre = s.Nombre;
                    string descripcion = s.Descripcion;
                    tabla.Rows.Add(id, nombre, descripcion);
                    Session[y] = tabla;
                    // Label1.Text = $"{id}-{nombre}-{descripcion}";
                }

            }
        }
    }
}