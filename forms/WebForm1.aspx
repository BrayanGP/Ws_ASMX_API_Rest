<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Ws_llamaASMX.forms.WebForm1" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

<div class="row mb-3">
  <label for="colFormLabel" class="col-sm-2 col-form-label">ID</label>
  <div class="col-sm-10">

          <asp:TextBox ID="idID" CssClass="form-control" runat="server" ></asp:TextBox>
  </div>
    </div>

<div class="row mb-3">
  <label for="colFormLabel" class="col-sm-2 col-form-label">Nombre</label>
  <div class="col-sm-10">
 
      <asp:TextBox ID="idNombre" CssClass="form-control" runat="server" ></asp:TextBox>
  </div>
    </div>

    <input type="button" class="btn btn-primary" onclick="eliminar()"  value="Eliminar"/>


    <%--      /*  ///Ventana Modal*/--%>
    <div class="modal fade" id="ventanaModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">

                <%--                    {/*///  Encabezado Modal*/}--%>
                <div class="modal-header">
                    <h4 class="modal-title">Encabezado</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <%--    {/*   <!-- Curepo de la Modal -->*/}--%>
                <div class="modal-body" id="mensaje">
                    Cuerpo
                </div>

                <%--     {/*<!-- Modal footer -->*/}--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="Celiminar()">Confirmar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>

            </div>
        </div>
    </div>

    <script>
        function eliminar() {
            var concatenarDatos = $("#<%= idID.ClientID%>").val() +
                " " + $("#<%= idNombre.ClientID%>").val()
            $("#mensaje").text("Estas seguro de eliminar a " + concatenarDatos);
            $("#ventanaModal").modal();
         

        }

        function Exito(data) {
            var json;
            json = JSON.parse(data.d);
            if (json != null) {
                alert(json.respuesta);
            }
        }
        function ErrorJson(jqXHR, exception) {
            var msg = '';
            if (jqXHR.status === 0) {
                msg = 'No está conectado, favor de verificar su conexión.';
            }
            else if (jqXHR.status === 404) {
                msg = 'Página no encontrada [404]';
            }
            else if (jqXHR.status === 500) {
                msg = 'Error no hay conexión al servidor [500]';
            }
            else if (jqXHR.status === 'parseerror') {
                msg = 'El parseo del JSON es erróneo.';
            }
            else if (jqXHR.status === 'timeout') {
                $('body').addClass('loaded');
            }
            else if (jqXHR.status === 'abort') {
                msg = 'La petición Ajax fue abortada.';
            }
            else {
                msg = 'Error no conocido. ';
                console.log(exception);
            }
            alert(msg);
        }


        function Celiminar() {
            var urlw = '<%=ResolveUrl("~/forms/WebForm1.aspx/eliminar") %>';

            var parametros = "{'id':'" + $('#<%=idID.ClientID %>').val() + "'}";
        
            $.ajax(
                {
                    type: 'POST',
                    url: urlw,
                    data: parametros,
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: Exito,
                    error: ErrorJson
                });

        }
    </script>

    </asp:Content>