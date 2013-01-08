using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP_faza4_take03
{
    
    public partial class dodajVir : System.Web.UI.Page
    {
        const string bazaConnString = "server=mysql.lrk.si;User Id=gc9623;password=gc9623;Persist Security Info=True;database=gc9623";
        //const string bazaConnString = "server=localhost;User=test;password=test;database=gc9623";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GumbDodaj_Click(object sender, EventArgs e)
        {
            obvestilo.Visible = true;
            obvestilo.BackColor = Color.Green;
            obvestilo.Text = "Dodajam vsebino v bazo...";

            MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);
            try
            {
                bazaPovezava.Open();
                //string SQLcommand = "INSERT INTO viri(naziv, vsebina, avtor_id, `timestamp`) VALUES ('" + TextBoxNaziv.Text + "', '" + TextBoxVsebina.Text + "', " + Request.Cookies["UserID"]!= null ? Request.Cookies["UserID"].Value : 0 + ", '"+DateTime.Now.ToString()+"');";
                string SQLcommand = "INSERT INTO viri(naziv, vsebina, avtor_id, `timestamp`) VALUES ('" + TextBoxNaziv.Text + "', '" + TextBoxVsebina.Text + "', 0, '" + DateTime.Now.ToString() + "');";
                Console.Write(SQLcommand);
                Console.WriteLine("neki");
                MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                int reader = bazaUkaz.ExecuteNonQuery();
                
                if(reader != 0) obvestilo.Text = "Vsebina dodana!";

            }
            catch (Exception ex)
            {
                obvestilo.Text = "Prišlo je do napake pri branju baze." + ex.Message;
                obvestilo.BackColor = Color.Red;
            }
            finally
            {
                bazaPovezava.Close();
            }
        }
    }
}