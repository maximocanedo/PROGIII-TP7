using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrabajoPractico7.Clases;

namespace TrabajoPractico7 {

    public partial class ListadoSucursales : System.Web.UI.Page {
        protected DataTable tabla;
        protected readonly string y = "Seleccionados";
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                if (Session[y] == null) {

                }
                else {
                    tabla = (DataTable)Session[y];
                    GridView1.DataSource = tabla;
                    GridView1.DataBind();
                }
            }
        }
    }
}