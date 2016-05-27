<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FacturaCompra.aspx.cs" Inherits="CarritoDeCompras.Compra" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Factura de Compra</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9">
        <h3>Factura de Compra</h3>

        <hr />
        <div class="form-group">
            <asp:Panel ID="panel_grid" runat="server">
                <asp:GridView ID="gridFactura" runat="server" AutoGenerateColumns="false" CssClass="table table-hover">
                    <Columns>
                        <asp:BoundField HeaderText="Nombre Producto" DataField="Nombre_Producto"></asp:BoundField>
                        <asp:BoundField HeaderText="Cantidad" DataField="Cantidad"></asp:BoundField>
                        <asp:BoundField HeaderText="Precio Unitario" DataField="Precio_Unitario"></asp:BoundField>
                        <asp:TemplateField HeaderText="Comentar">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="glyphicon glyphicon-pencil" CommandArgument='<%# Eval("Id_Producto")+ ";" +Eval("Nombre_Producto") %>' OnCommand="LinkButton2_Command"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <span><strong>Total Neto: </strong></span>
                <asp:Label ID="LblTotalNeto" runat="server"></asp:Label>
                <br />
                <span><strong>Descuento Aplicado: </strong></span>
                <asp:Label ID="lblDescuento" runat="server"></asp:Label>
                <br />
                <span><strong>Total Pagado: </strong></span>
                <asp:Label ID="lblTotal" runat="server"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="panel_comentarios" runat="server" Visible="false" CssClass="col-xs-5">
                <div class="form-group">
                    <span><strong>ID del Producto: </strong></span>
                    <asp:Label ID="lblId_Producto" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="form-group">
                    <span><strong>Nombre del Producto: </strong></span>
                    <asp:Label ID="lblNombre_Producto" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="form-group">
                    <select id="puntuacion" class="form-control">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtComentario" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <button id="btnEnviar" class="btn btn-success">Enviar</button>
                    <asp:LinkButton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click"></asp:LinkButton>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $("#btnEnviar").click(function () {
            var id_producto = $("#ContentPlaceHolder1_lblId_Producto").text();
            var puntuacion = $("#puntuacion").val();
            var comentario = $("#ContentPlaceHolder1_txtComentario").val();

            console.log(id_producto + " " + puntuacion + " " + comentario);
            $.ajax({
                type: "POST",
                url: 'FacturaCompra.aspx/btnEnviar_Click',
                data: '{id_producto: "' + id_producto + '",comentario: "' + comentario + '",puntuacion: "' + puntuacion + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("Calificacion Ingresada");
                    window.location.href = "ComprasRealizadas.aspx";
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        });
    </script>
</asp:Content>
