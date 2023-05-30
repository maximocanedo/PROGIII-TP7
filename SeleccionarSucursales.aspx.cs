using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TrabajoPractico7.Clases;

namespace TrabajoPractico7
{
	public partial class SeleccionarSucursales1 : System.Web.UI.Page
	{
        protected const string SucursalesSeleccionadas = "SucursalesSeleccionadas";
        
        protected DataTable crearTablaSeleccion()
        {
            // Guardo los items seleccionados en Session.
            DataTable dt = new DataTable();
            if (Session[SucursalesSeleccionadas] == null)
            {
                dt.Columns.Add(Sucursal.Columns.Id, typeof(string));
                dt.Columns.Add(Sucursal.Columns.Nombre, typeof(string));
                dt.Columns.Add(Sucursal.Columns.Descripcion, typeof(string));
                Session[SucursalesSeleccionadas] = dt;
            }
            else
            {
                dt = (DataTable)Session[SucursalesSeleccionadas];
            }
            return dt;
        }

        protected bool registroRepetido(DataTable tabla, string ID)
        {
            // Verifico si el registro está repetido:
            bool noExisteID = false;
            foreach (System.Data.DataRow row in tabla.Rows)
            {
                if(row[Sucursal.Columns.Id].ToString() == ID)
                {
                    noExisteID = true;
                    break;
                }
            }
            return noExisteID;
        }

        protected void insertarFila(DataSet dataset, string ID)
        {
            DataTable tabla = crearTablaSeleccion();
            DataTable registroTabla = dataset.Tables[0];
            string nombre, descripcion;
            foreach(DataRow row in registroTabla.Rows)
            {
                nombre = row[Sucursal.Columns.Nombre].ToString();
                descripcion = row[Sucursal.Columns.Descripcion].ToString();
                // bool noExisteID = registroRepetido(tabla, ID);
                if(!registroRepetido(tabla, ID))
                {
                    tabla.Rows.Add(ID, nombre, descripcion);
                }
            }
            Session[SucursalesSeleccionadas] = tabla;
        }

        protected void Page_Load(object sender, EventArgs e)
		{

		}

        // PARA SELECCIONAR UN ITEM ESPECÍFICO:
        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoButton")
            {
                string ID_Sucursal = e.CommandArgument.ToString();
                Connection conexion = new Connection(Connection.Database.BDSucursales);
                Response res = conexion.FetchData("SELECT Id_Sucursal, NombreSucursal, DescripcionSucursal FROM Sucursal WHERE Id_Sucursal = " + ID_Sucursal);
                DataSet dataSet = res.ObjectReturned as DataSet;
                insertarFila(dataSet, ID_Sucursal);

                /* Código que estaba intentando realizar antes:
                DataTable dtSucursalesSel = new DataTable();
                var suc = new Sucursal();
                int id = int.Parse((string)e.CommandArgument);
                if (suc.Id == id)
                {
                    string nombre = suc.Nombre;
                    string descripcion = suc.Descripcion;
                    dtSucursalesSel.Rows.Add(id, nombre, descripcion);
                    Session[SucursalesSeleccionadas] = dtSucursalesSel;
                }
                 */
            }
        }

        // PARA SELECCIONAR POR PROVINCIA:
        protected void eventoSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                SqlDataSource2.SelectCommand = "SELECT [NombreSucursal],[DescripcionSucursal],[URL_Imagen_Sucursal] FROM [Sucursal] WHERE [Id_ProvinciaSucursal] = '" + e.CommandArgument + "'";
                           
            }
        }

        // PARA BUSCAR POR NOMBRE DE SUCURSAL:
        protected void Button1_Click(object sender, EventArgs e)
        {
            string text = TextBox1.Text;
            SqlDataSource2.SelectCommand = "SELECT * FROM Sucursal WHERE NombreSucursal LIKE '" + text + "%'";
        }
    }
}