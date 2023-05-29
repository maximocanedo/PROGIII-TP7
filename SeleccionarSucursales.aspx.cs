using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabajoPractico7
{
	public partial class SeleccionarSucursales1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}


        protected void eventoSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                SqlDataSource2.SelectCommand = "SELECT [NombreSucursal],[DescripcionSucursal],[URL_Imagen_Sucursal] FROM [Sucursal] WHERE [Id_ProvinciaSucursal] = '" + e.CommandArgument + "'";
                           
            }
        }
    }
}