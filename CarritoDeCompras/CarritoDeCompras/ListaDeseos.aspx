<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaDeseos.aspx.cs" Inherits="CarritoDeCompras.ListaDeseos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Lista de Deseos</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">
        <div class="row" id="index">
            <div class="container">
                <h3>Lista de Deseos</h3>
            </div>
            <hr />
        </div>        
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    

    <script>
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: 'ListaDeseos.aspx/CargarListaDeseos',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d);
                    for (var i = 0; i < response.d.length; i++) {
                        var div = '<div class="col-sm-4 col-lg-4 col-md-4 producto">';
                        div += '<div class="thumbnail">';
                        div += '<img class="img_small" src="' + response.d[i].Imagen + '" alt="">';
                        div += '<div class="caption">';
                        div += '<h5><strong>' + response.d[i].Nombre_Producto + '</strong></h5>';
                        div += '<h5>Cantidad en Stock: ' + response.d[i].Stock + '</h5>';
                        div += '<h5 class="precio">Valor: $' + response.d[i].Precio + '</h5><form class="form-inline">';
                        div += '<div class="row">'
                        div += '<div class="form-group col-xs-2"><button type="button" class="btn btn-default del"><i class="glyphicon glyphicon-remove"></i><span hidden="hidden" class="id_producto">';
                        div += response.d[i].Id_Producto + '</span></button></div></form>';
                        div += '</div></div></div>';
                        $("#index").append(div);
                    }
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    alert(err.Message);
                }
            });
            $("#index").on("click", ".del", function () {
                $(this).closest(".producto").remove();
                var id = $(this).find(".id_producto").text();
                $.ajax({
                    type: "POST",
                    url: 'ListaDeseos.aspx/EliminardeLista',
                    data: '{id_producto: "'+id+'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (response) {
                        //Mostrar un mensaje de error
                    }
                });
            });
        });
    </script>
</asp:Content>
