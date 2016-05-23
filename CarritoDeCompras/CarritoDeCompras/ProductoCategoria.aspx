<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductoCategoria.aspx.cs" Inherits="CarritoDeCompras.ProductoCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">

        <div class="row" id="index">
            <div class="container">
                <h3>Categoria: <small id="nom_cat"></small></h3>
            </div>
            <hr />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="/js/cargarProductos.js"></script>

    <script>
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "ProductoCategoria.aspx/GetCategoria",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    for (var i = 0; i < response.d.length; i++) {
                        var categoria = response.d[i].Nombre_Categoria;
                        var id = response.d[i].Id_Categoria;
                        $("#nom_cat").text(categoria);
                    }
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
            cargar('ProductoCategoria.aspx/GetProductoCategoria', '{}');
        });
    </script>
</asp:Content>
