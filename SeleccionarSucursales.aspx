<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TrabajoPractico7.SeleccionarSucursales" %>
<%@ Import Namespace="TrabajoPractico7.Clases" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Título y descripción -->
    <title>Seleccionar Sucursales · T.P. N.º 7</title>
    <meta name="description" content="
        Seleccionar sucursales. Trabajo Práctico N.º 7 para la materia Programación III. 
        Universidad Tecnológica Nacional, Facultad Regional General Pacheco. 
        Repositorio disponible aquí:  https://github.com/maximocanedo/PROGIII-TP7" />
    <!-- Integrantes -->
    <meta name="author" content="Ezequiel Martínez" />
    <meta name="author" content="Javier Torales" />
    <meta name="author" content="Jean Pierre Esquén" />
    <meta name="author" content="María Olivia Hanczyc" />
    <meta name="author" content="Máximo Canedo" />
    <!-- Otras metaetiquetas útiles -->
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Librerías utilizadas -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="/Recursos/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <!-- Archivos usados -->
    <link rel="icon" href="/utn.ico" type="image/x-icon" />
    <link href="/Recursos/index.css" rel="stylesheet" />
    <script src="/Recursos/global.js"></script>
</head>
<body class="container">
    <form id="form1" style="padding-top: 50px; max-width: 100vw;" class="row" runat="server">
        <div class="col">
            <!-- ListView Provincias -->
            <div class="list-group">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Provincia" DataSourceID="SqlDataSource1">
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnSeleccionarProvincia" CssClass="list-group-item list-group-item-action" CommandName="Filtrar" CommandArgument='<%# Eval("Id_Provincia") %>' Text='<%# Eval("DescripcionProvincia") %>' runat="server" OnCommand="btnSeleccionarProvincia_Command" />
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

        </div>
        <div class="col">
            <div class="input-group mb-3">
                <asp:TextBox ID="TextBox1" runat="server" type="text" class="form-control" placeholder="Buscar por nombre" aria-label="Buscar por nombre" aria-describedby="basic-addon1"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Button" OnClick="Button1_Click" />
            <!-- Cuadro de búsqueda, ListView Sucursales -->
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="Id_Sucursal" DataSourceID="SqlDataSource2" GroupItemCount="3">

            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server">
                    <div class="card" style="width: 18rem;">
                        <asp:Image ID="Image1" CssClass="card-img-top" ImageUrl='<%# Eval(Sucursal.Columns.Imagen) %>' runat="server" />
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval(Sucursal.Columns.Nombre) %></h5>
                            <p class="card-text"><%# Eval(Sucursal.Columns.Descripcion) %></p>
                            <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Seleccionar" CommandName="Select" CommandArgument='<%# Eval(Sucursal.Columns.Id) %>' OnCommand="Button2_Command" />
                        </div>
                    </div>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        </div>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SucursalesConnectionString %>" SelectCommand="SELECT [Id_Provincia], [DescripcionProvincia] FROM [Provincia]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SucursalesConnectionString %>" SelectCommand="SELECT * FROM [Sucursal]"></asp:SqlDataSource>
        

    </form>
    <script type="module" src="/Recursos/index.js"></script>
</body>
</html>
