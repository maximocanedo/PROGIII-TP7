<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursales.aspx.cs" Inherits="TrabajoPractico7.ListadoSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Título y descripción -->
    <title>Listado de Sucursales · T.P. N.º 7</title>
    <meta name="description" content="
        Listado de sucursales. Trabajo Práctico N.º 7 para la materia Programación III. 
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
<body>
    <form id="form1" class="centered-form" runat="server">
        <br />
        <h1>Seleccionar sucursales</h1>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Sucursal" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                <span style="">Id_Sucursal:
                <asp:Label ID="Id_SucursalLabel1" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
                <br />
                NombreSucursal:
                <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                <br />
                DescripcionSucursal:
                <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                <br />
                Id_HorarioSucursal:
                <asp:TextBox ID="Id_HorarioSucursalTextBox" runat="server" Text='<%# Bind("Id_HorarioSucursal") %>' />
                <br />
                Id_ProvinciaSucursal:
                <asp:TextBox ID="Id_ProvinciaSucursalTextBox" runat="server" Text='<%# Bind("Id_ProvinciaSucursal") %>' />
                <br />
                DireccionSucursal:
                <asp:TextBox ID="DireccionSucursalTextBox" runat="server" Text='<%# Bind("DireccionSucursal") %>' />
                <br />
                URL_Imagen_Sucursal:
                <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">NombreSucursal:
                <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                <br />
                DescripcionSucursal:
                <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                <br />
                Id_HorarioSucursal:
                <asp:TextBox ID="Id_HorarioSucursalTextBox" runat="server" Text='<%# Bind("Id_HorarioSucursal") %>' />
                <br />
                Id_ProvinciaSucursal:
                <asp:TextBox ID="Id_ProvinciaSucursalTextBox" runat="server" Text='<%# Bind("Id_ProvinciaSucursal") %>' />
                <br />
                DireccionSucursal:
                <asp:TextBox ID="DireccionSucursalTextBox" runat="server" Text='<%# Bind("DireccionSucursal") %>' />
                <br />
                URL_Imagen_Sucursal:
                <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="card" style="width: 18rem;">
                  <img src="<%# Eval("URL_Imagen_Sucursal") %>" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%# Eval("NombreSucursal") %></h5>
                    <p class="card-text"><%# Eval("DescripcionSucursal") %></p>
                    <asp:LinkButton runat="server" href="#" CommandName="Select" class="btn btn-primary">Seleccionar</asp:LinkButton>
                  </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <div class="card text-bg-primary" style="width: 18rem;">
                  <img src="<%# Eval("URL_Imagen_Sucursal") %>" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%# Eval("NombreSucursal") %></h5>
                    <p class="card-text"><%# Eval("DescripcionSucursal") %></p>
                    <asp:LinkButton runat="server" href="#" CommandName="Select" class="btn btn-light">Seleccionar</asp:LinkButton>
                  </div>
                </div>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_HorarioSucursal], [Id_ProvinciaSucursal], [DireccionSucursal], REPLACE([URL_Imagen_Sucursal], '~', '') as [URL_Imagen_Sucursal] FROM [Sucursal]"></asp:SqlDataSource>
    </form>
    <script type="module" src="/Recursos/index.js"></script>
</body>
</html>
