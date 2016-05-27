<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="CarritoDeCompras.Compra" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9">
        <div class="form-group">
            <asp:Panel ID="panel_grid" runat="server">
                <asp:GridView ID="gridFactura" runat="server" AutoGenerateColumns="false" CssClass="table table-hover">
                    <Columns>
                        <asp:BoundField HeaderText="Nombre Producto" DataField="Nombre_Producto"></asp:BoundField>
                        <asp:BoundField HeaderText="Cantidad" DataField="Cantidad"></asp:BoundField>
                        <asp:BoundField HeaderText="Precio Unitario" DataField="Precio_Unitario"></asp:BoundField>
                        <asp:TemplateField HeaderText="Comentar">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="glyphicon glyphicon-remove-sign" CommandArgument='<%# Eval("Id_Producto")+ ";" +Eval("Nombre_Producto") %>' OnCommand="LinkButton2_Command"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="panel_comentarios" runat="server" Visible="false">
                <div class="form-group">
                    <span><strong>ID del Producto: </strong></span>
                    <asp:Label ID="lblId_Producto" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="form-group">
                    <span><strong>Nombre del Producto: </strong></span>
                    <asp:Label ID="lblNombre_Producto" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="form-group">
                    <%-- <asp:TextBox ID="txtCalificacion" CssClass="form-control" runat="server" Type="Number"></asp:TextBox>--%>
                    <select class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>

                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtComentario" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:LinkButton ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-success" OnClick="btnEnviar_Click"></asp:LinkButton>
                    <asp:LinkButton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click"></asp:LinkButton>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
