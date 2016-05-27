<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ComprasRealizadas.aspx.cs" Inherits="CarritoDeCompras.ComprasRealizadas" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Compras Realizadas</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-9">
        <h3>Compras Realizadas</h3>
        <hr />
        <div class="form-group">
            <asp:GridView ID="gridFacturas" runat="server" AutoGenerateColumns="false" CssClass="table table-hover">
                <Columns>
                    <asp:BoundField HeaderText="Id Factura" DataField="Id_Factura"></asp:BoundField>
                    <asp:BoundField HeaderText="Fecha" DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                    <asp:BoundField HeaderText="Total" DataField="Total"></asp:BoundField>
                    <asp:TemplateField HeaderText="Ver detalles">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="glyphicon glyphicon-search" CommandArgument='<%# Eval("Id_Factura") %>' OnCommand="LinkButton2_Command"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
