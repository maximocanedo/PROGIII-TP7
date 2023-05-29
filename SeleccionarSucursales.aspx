<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TrabajoPractico7.SeleccionarSucursales" %>

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
    <script src="/Recursos/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <!-- Archivos usados -->
    <link rel="icon" href="/utn.ico" type="image/x-icon" />
    <link href="/Recursos/index.css" rel="stylesheet" />
    <script src="/Recursos/global.js"></script>
</head>
<body>
    <form id="form1" class="centered-form" runat="server">
        <!-- Empezar aquí -->
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </form>
    <script type="module" src="/Recursos/index.js"></script>
</body>
</html>
