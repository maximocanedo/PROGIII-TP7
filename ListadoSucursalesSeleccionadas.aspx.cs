using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TrabajoPractico7
{
    public partial class ListadoSucursalesSeleccionados : System.Web.UI.Page
    {
        private void mostrarSucursalesSeleccionadas()
        {
            DataTable dt = (DataTable)Session["SucursalesSeleccionadas"];
            gvSucursalesSeleccionadas.DataSource = dt;
            gvSucursalesSeleccionadas.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mostrarSucursalesSeleccionadas();
            }
        }
    }
}