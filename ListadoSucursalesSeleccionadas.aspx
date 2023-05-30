<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursalesSeleccionadas.aspx.cs" Inherits="TrabajoPractico7.ListadoSucursalesSeleccionados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style14 {
            height: 26px;
            width: 259px;
        }
        .auto-style3 {
            height: 26px;
            width: 273px;
        }
        .auto-style5 {
            height: 26px;
            width: 333px;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style1 {
            width: 100%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style14"></td>
                    <td aria-activedescendant="z" class="auto-style3">
                        <asp:HyperLink ID="hlSeleccionSucursales" runat="server" NavigateUrl="SeleccionarSucursales.aspx">Selección de sucursales</asp:HyperLink>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlSucursalesSeleccionadas" runat="server" NavigateUrl="ListadoSucursalesSeleccionadas.aspx">Listado de  sucursales seleccionadas</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMostrar" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Mostrar sucursales seleccionadas"></asp:Label>
        </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="gvSucursalesSeleccionadas" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="ID_Sucursal">
                    <ItemTemplate>
                        <asp:Label ID="lblID_Sucursal" runat="server" Text='<%# Bind("Id_Sucursal") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#003399" ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("NombreSucursal") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#003399" ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripcion">
                    <ItemTemplate>
                        <asp:Label ID="lblDescripcion" runat="server" Text='<%# Bind("DescripcionSucursal") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle ForeColor="White" />
                    <HeaderStyle BackColor="#003399" ForeColor="White" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
