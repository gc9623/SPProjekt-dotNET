using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SP_faza4_take03
{
    public partial class template : System.Web.UI.Page
    {
        const string bazaConnString = "server=mysql.lrk.si;User Id=gc9623;password=gc9623;Persist Security Info=True;database=gc9623";
        //const string bazaConnString = "server=localhost;User=test;password=test;database=gc9623";

        protected void Page_Load(object sender, EventArgs e)
        {
            napaka.Visible = false;
            
            MySqlConnection bazaPovezava = new MySqlConnection(bazaConnString);
            try
            {
                bazaPovezava.Open();
                string SQLcommand = "SELECT virID, naziv FROM viri;";
                MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                MySqlDataReader reader = bazaUkaz.ExecuteReader();
                mrezaVsebine.DataSource = reader;
                mrezaVsebine.AutoGenerateColumns = false;
                mrezaVsebine.ShowHeader = false;
                mrezaVsebine.ShowHeaderWhenEmpty = false;
                mrezaVsebine.GridLines = GridLines.None;

                mrezaVsebine.DataBind();

            }
            catch (Exception ex)
            {
                napaka.Text = "Prišlo je do napake pri branju baze." + ex.Message;
                napaka.Visible = true;
            }
            finally
            {
                bazaPovezava.Close();
            }
            if (IsPostBack)
            {
                string target = Request.Params.Get("__EVENTTARGET");
                string argument = Request.Params.Get("__EVENTARGUMENT");
                int ajdi = int.Parse(argument);
                //napaka.Text = target + " " + argument;
                //napaka.Visible = true;

                //mrezaVsebine.Rows[ajdi].Attributes["style"] = "color:green;";

                bazaPovezava = new MySqlConnection(bazaConnString);
                try
                {
                    bazaPovezava.Open();
                    string SQLcommand = "SELECT viri.naziv, viri.vsebina, uporabnik.ime, uporabnik.priimek, timestamp "+
                        "FROM viri INNER JOIN uporabnik ON uporabnik.uporabnik_id = viri.avtor_id "+
                        "WHERE viri.virID = " + ajdi + ";";
                    MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                    MySqlDataReader reader = bazaUkaz.ExecuteReader();
                    reader.Read();
                    podrobnostiNaziv.Text = reader.GetString(0);
                    podrobnostiVsebina.Text = reader.GetString(1);
                    podorobnostiAvtor.Text = "Avtor: " + reader.GetString(2) + " " + reader.GetString(3) + " - " ;
                    podrobnostiTimestamp.Text = reader.GetString(4);
                }
                catch (Exception ex)
                {
                    napaka.Text = "Prišlo je do napake pri branju baze." + ex.Message;
                    napaka.Visible = true;
                }
                finally
                {
                    bazaPovezava.Close();
                }
            }
        }

        protected void ViriGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                int row = e.Row.RowIndex;
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.podrobnostiVsebina, " " + mrezaVsebine.DataKeys[row].Value.ToString()); //e.Row.Cells[0].Text);
            }
        }
    }
}