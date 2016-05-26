<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CarritoDeCompras.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        var items = sessionStorage.getItem("ItemsCarrito");
        if (items == null) {
            console.log("No hay productos en el carrito");
        } else {
            var arrayItems = JSON.parse(items);
            console.log(items);
        }

        $.ajax({
            type: "POST",
            url: "Carrito.aspx/CargarCarrito",
            data: '{ItemsCarrito: ' + items + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert('ok');
            },
            error: function (response) {
                //Mostrar un mensaje de error
            }
        });
    </script>
</asp:Content>
