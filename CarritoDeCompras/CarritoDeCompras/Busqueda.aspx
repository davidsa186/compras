<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="CarritoDeCompras.Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">

        <div class="row" id="index">
            <div class="container">
                <h3>Búsqueda: <small><asp:Label ID="lblBusqueda" runat="server"></asp:Label></small></h3>
            </div>
            <hr />
        </div>
        
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="/js/cargarProductos.js"></script>

    <script>
        $(document).ready(function () {
            cargar('Busqueda.aspx/Resultados', '{}');
        });
    </script>
</asp:Content>
