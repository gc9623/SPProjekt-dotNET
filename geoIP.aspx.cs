using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP_faza4_take03
{
    public partial class geoIP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetLocation()
        {
            var location = "";
            string ajPI = HttpContext.Current.Request.UserHostAddress;
            List<string> HTML_code = new List<string>();
            //WebRequest request = WebRequest.Create("www.webservicex.net/geoipservice.asmx/GetGeoIP?IPAddress=" + ajPI);
            //WebRequest request = WebRequest.Create("http://www.maxmind.com/app/locate_demo_ip?ips=" + ajPI);
            WebRequest request = WebRequest.Create("http://api.hostip.info/get_html.php?ip=" + ajPI);
            using (WebResponse response = request.GetResponse())
            using (StreamReader stream = new StreamReader(response.GetResponseStream()))
            {
                string line;
                while ((line = stream.ReadLine()) != null)
                {
                    HTML_code.Add(line);
                    location += line;
                }
            }

            location = HTML_code[0];
            string[] locations = location.Split('(');
            location = locations[1];
            location = location.Replace(")", "");
            return location;
        }

        public void gumbPridobiLokacijo_Click(object sender, EventArgs e)
        {
            drzava.Text = "Nahajate se na naslovi ki pripada območju: " + GetLocation();
        }
    }
}