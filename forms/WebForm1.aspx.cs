using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ws_llamaASMX.forms
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string eliminar(string id)
        {
            string mensaje;
            try
            {
                if (id!=null) {
                    mensaje = "Exito, Usted elimino a el ID: " + id;
                }
                else
                {
                    mensaje = "no envio ningun ID";
                }
                
            }
            catch
            {
                mensaje = "Error";
            }
            string respuesta;
            respuesta = JsonConvert.SerializeObject
                (new{
                respuesta = mensaje
            });
            return respuesta;
        }
    }
   
}