using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SECOND_SELF_EVALUATION
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class schoolDropDownList
        {
            public int schoolid { get; set; }
            public string schoolname { get; set; }

        }
/*
        [WebMethod]
        public static List<schoolDropDownList> schooldropdown()
        {
            string connectionString = "server=localhost;uid=root;pwd=pavithran@123;database=myschool";
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM schooltable";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            List<schoolDropDownList> schoollist = new List<schoolDropDownList>();
            while (dr.Read())
            {
                schoolDropDownList schooldropdowndata = new schoolDropDownList
                {
                    schoolid = dr.GetInt32("schoolid"),
                    schoolname = dr.GetString("schoolname"),

                };
                schoollist.Add(schooldropdowndata);
            }
            con.Close();
            dr.Close();
            return schoollist;
        }
        public class classDropDownList
        {
            public int classid { get; set; }
            public string classname { get; set; }
            public string section { get; set; }
        }
        [WebMethod]
        public static List<classDropDownList> classsectiondata()
        {
            string connectionString = "server=localhost;uid=root;pwd=pavithran@123;database=myschool";
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            string sql = "SELECT * FROM classtable";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            List<classDropDownList> classlist = new List<classDropDownList>();
            while (dr.Read())
            {
                classDropDownList classdropdown = new classDropDownList
                {
                    classid = dr.GetInt32("classid"),
                    classname = dr.GetString("classname"),
                    section = dr.GetString("section")
                };
                classlist.Add(classdropdown);
            }
            con.Close();
            dr.Close();
            return classlist;
        }
        [WebMethod]
        public static string inserttable(string fname, string lname, string dob, string schooldropdown)
        {
            string connectionString = "server=localhost;uid=root;pwd=pavithran@123;database=myschool";
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            string sql = "insert into finaltable(fname, lname, dob, schooldropdown)values('" + fname + "','" + lname + "','" + dob + "','" + schooldropdown + "')";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dr.Close();
            con.Close();
            return "success";
        }*/
        [WebMethod]
        public static string getdata()
        {
            string connectionString = "server=localhost;uid=root;pwd=pavithran@123;database=myschool";
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            string sql = "select * from finaldatatable";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dr.Close();
            con.Close();
            return JsonConvert.SerializeObject(dt);
        }
    }
}

/*   
   public class classDropDownList
   {
       public int classid { get; set; }
       public string classname { get; set; }
       public string section { get; set; }
   }
   [WebMethod]
   public static List<classDropDownList> classdropdown()
   {
       string connectionString = "server=localhost;uid=root;pwd=pavithran@123;database=myschool";
       MySqlConnection con = new MySqlConnection(connectionString);
       con.Open();
       string sql = "SELECT * FROM classtable";
       MySqlCommand cmd = new MySqlCommand(sql, con);
       MySqlDataReader dr = cmd.ExecuteReader();
       List<classDropDownList> classlist = new List<classDropDownList>();
       while (dr.Read())
       {
           classDropDownList classdropdown = new classDropDownList
           {
               classid = dr.GetInt32("classid"),
               classname = dr.GetString("classname"),
               section = dr.GetString("section")
           };
           classlist.Add(classdropdown);
       }
       con.Close();
       dr.Close();
       return classlist;
   }

}*/





