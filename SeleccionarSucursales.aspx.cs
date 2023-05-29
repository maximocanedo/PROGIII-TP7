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

        protected void Page_Load(object sender, EventArgs e)
		{

		}

        // PARA SELECCIONAR UN ITEM ESPECÍFICO:
        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoButton")
            {
                // Guardo los items seleccionados en Session.
                if (Session[SucursalesSeleccionadas] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add(Sucursal.Columns.Nombre, typeof(string));
                    dt.Columns.Add(Sucursal.Columns.Descripcion, typeof(string));
                    dt.Columns.Add(Sucursal.Columns.Imagen, typeof(string));
                    Session[SucursalesSeleccionadas] = dt;
                }
                Session[SucursalesSeleccionadas] = e.CommandArgument.ToString();
               // DataTable dtSucursalesSel = (DataTable)Session[SucursalesSeleccionadas];

                /* REFERENCIA - BORRAR LUEGO
                    //VERIFICACION DE PRODUCTO REPETIDO
                    bool productoExistente = dtProductosSel.AsEnumerable()
                        .Any(row => row.Field<string>(Producto.Columns.Id) == s_IDProducto);

                    //SI NO SE REPITE, SE AGREGA
                    if (!productoExistente) {
                        DataRow newRow = dtProductosSel.NewRow();
                        newRow[Producto.Columns.Id] = s_IDProducto;
                        newRow[Producto.Columns.Nombre] = s_NombreProducto;
                        newRow[Producto.Columns.IdProveedor] = s_IDProveedor;
                        newRow[Producto.Columns.PrecioUnitario] = s_PrecioUnitario;
                        dtProductosSel.Rows.Add(newRow);

                        //CARGAR TABLA ACTUALIZADA A LA VARIABLE SESSION
                        Session[TablaProductosSeleccionados] = dtProductosSel;
                        ShowSnackbar($"Seleccionado: {s_NombreProducto}");
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
    }
}