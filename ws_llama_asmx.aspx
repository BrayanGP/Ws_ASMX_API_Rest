<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ws_llama_asmx.aspx.cs" Inherits="Ws_llamaASMX.ws_llama_asmx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:Label ID="LblMensajes" runat="server" Text="Mensajes"></asp:Label> 
    <asp:Button ID="btnHolaMundo" runat="server" Text="Hola Mundo" OnClick="btnHolaMundo_Click" />
    
     <button type="button" id="btnHolaMundo2">HolaMundo2</button>
    <button id="btn">mandar un Json al servidor</button>

     <button id="bt2n">recuperar un Json al servidor</button>
    <button id="btnVariosParametros">btnVariosParametros</button>
    <button id="btnUnParametros">btnUnParametrosComopObjeto</button>
    <script>

        $("#btnHolaMundo2").click(function () {     
            
            var urwl = 'https://localhost:44374/WebService1.asmx/HelloWorld';
                    $.ajax(
                        {

                            type: 'POST',
                            url: urwl,
                            data: null,
                            contentType: "application/json; charset=utf-8",
                            dataType: "JSON",
                            success: Exito2,
                            error: ErrorJson2

                        });
              
        });

        $("#bt2n").click(function () {


            var urwl = 'https://localhost:44374/WebService1.asmx/mostrarLista';
            $.ajax(
                {
                    type: 'POST',
                    url: urwl,
                    data: null,
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: Exito2,
                    error: ErrorJson2
                });



        });
        function Exito2(data) {
            alert('si recuperamos el JSON');
            var json;
            json = JSON.parse(data.d);
          /*  alert(json);*/
            alert(json.mensajeEnviado);
       /*     alert(json.mensajeEnviado['id'][5]);*/
            
            
        }
        function Exito3(data) {
            alert('si recuperamos el JSON');
            var json;
            json = JSON.parse(data.d);
            /*  alert(json);*/
            alert(json.estatus);
            /*     alert(json.mensajeEnviado['id'][5]);*/


        }
        function Exito4(data) {
            alert('si recuperamos el JSON');
            var json;
            json = data.d;
            /*  alert(json);*/
            alert(json.id +" "+ json.nombre +" "+ json.ciudad);
            /*     alert(json.mensajeEnviado['id'][5]);*/


        }
        function ErrorJson2() {
            alert('no recuperamos el JSON');
        }
        //$("btn2").click(function recuperarJson() {

        //    var client = new RestClient("https://localhost:44374/WebService1.asmx/mostrarLista");
        //    client.Timeout = -1;
        //    var request = new RestRequest(Method.GET);
        //    IRestResponse response = client.Execute(request);
        //    Console.WriteLine(response.Content);
        //});
        $("#btnVariosParametros").click(function enDuro() {
            var urls = 'https://localhost:44374/WebService1.asmx/JSONParametros'
            var id = 1;
            var idF = JSON.stringify(id);
            var nombre = 'Brayan';
            var ciudad = 'Mexico';

            var parametreos = "{'id':'" + idF + "','nombre':'" + nombre + "','ciudad':'" + ciudad + "'}";
            $.ajax
                ({
                    type: 'POST',
                    url: urls,
                    data: parametreos,
                    contentType: "application/json; charset=utf-8",
                    dat: "JSON",
                    success: Exito3,
                    error: ErrorJson2
                });
        });

        // quitale las comillas simple que estan dentro del string para que este se convierta en un objeto
        $("#btnUnParametros").click(function () {
            var urls = 'https://localhost:44374/WebService1.asmx/JSONUnParametros'
            var alumno = { id: 1, nombre: "Brayan", ciudad: "Hidalgo" };
            var alumnosJson = JSON.stringify(alumno);

            

            var parametreos = "{'nombre':" + alumnosJson + "}";
            $.ajax
                ({
                    type: 'POST',
                    url: urls,
                    data: parametreos,
                    contentType: "application/json; charset=utf-8",
                    dat: "JSON",
                    success: Exito4,
                    error: ErrorJson2
                });
        });

        $("#btn").click(function convertirCadenas() {
            var urlws = 'https://localhost:44374/WebService1.asmx/retornoJSON'
                     
            //var n = $("#nombre").val();

            var alumno = { id: 1, nombre: "Brayan", ciudad: "Hidalgo" };
            var alumnosJson = JSON.stringify(alumno);

            var parametros = "{'alumno':'" + alumnosJson + "'}";
            $.ajax(
                {

                    type: 'POST',
                    url: urlws,
                    data: parametros,
                    contentType: "application/json; charset=utf-8",
                    dataType: "JSON",
                    success: Exito,
                    error: ErrorJson2

                });
        });
        function Exito(data) {
            var json;
            try {
                json = JSON.parse(data.d);
                if (json != null) {
                    if (json.mensajeEnviado == "Jalo") {
                        alert('Jalo perfectamente');
                        window.location.href="Default.aspx"
                    }
                    else
                    {
                        alert(json.mensajeEnviado);

                    }


                }
                else {
                    alert('la respuesta es incorrecta' + data.d);
                }


            } catch (ex) {
                json = [];
                alert('Error al ingresar los datos');
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
    </script>
 


</asp:Content>
