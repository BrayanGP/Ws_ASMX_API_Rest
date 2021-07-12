using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ws_llamaASMX;
using Ws_llamaASMX.service;

namespace Ws_llamaASMX
{
    public partial class ws_llama_asmx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHolaMundo_Click(object sender, EventArgs e)
        {
            WebService1 s = new WebService1();
           LblMensajes.Text= s.HelloWorld();
            


        }

        protected void btnHolaMundo2_Click(object sender, EventArgs e)
        {

        }
    }
}