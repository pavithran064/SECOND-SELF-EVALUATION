<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SECOND_SELF_EVALUATION.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <style>
        div {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 150px;
            text-align: right;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <label for="fname">First name:</label>
            <input type="text" id="fname" name="fname" /><br /><br />

            <label for="lname">Last name:</label>
            <input type="text" id="lname" name="lname" /><br /><br />

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" /><br /><br />

            <label for="schooldropdown">School:</label>
            <select id="schooldropdown" name="schooldropdown"></select><br /><br />
            
            <label for="classdropdown"> Class :</label>
            <select id="classdropdown" name="classdropdown"></select><br /><br />   
            
             <label for="section">section:</label>
            <select id="section" name="section"></select><br /><br />

            <button type="button" id ="submit" onclick ="submitclick()">Submit</button><br /><br />
            <button type="button" id ="reset" onclick ="resetclick()">Reset</button>

        </div>
        </center>
<table id="example" class="display" style="width:100%">
             <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
    
        </table>
    </form>
    <script>
        $(document).ready(function () {
            $('#example').DataTable();
            datatablesdata();
            schooldropdown();
            table = $('#example').DataTable(
                {
                    data: data,
                    columns: [
                        { data: fname },
                        { data: lname },
                        { data: dob },
                        { data: schooldropdown }
                    ]
                });
            //  classdata();
        });
        function datatablesdata() {
            $.ajax({
                type: "POST",
                url: 'WebForm1.aspx/getdata',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    debugger
                    var data = JSON.parse(data.d);
                    table.rows.add(data);
                /*
                    if ($.fn.dataTable.isDataTable('#example')) {
                        table = $('#example').DataTable();
                    }
                    else {
                        table = $('#example').DataTable(
                            {
                                data:data,
                                columns: [
                                    { data: fname },
                                    { data: lname },
                                    { data: dob },
                                    { data: schooldropdown }
                                ]
                            });
                    }
                   */
                },
                error: function (error) {
                    alert("Failed to retrieve school dropdown.");
                }
            });
        }
        function schooldropdown() {

            $.ajax({
                type: "POST",
                url: 'WebForm1.aspx/schooldropdown',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    var schooldropdown = $('#schooldropdown');
                    for (var i = 0; i < data.d.length; i++) {
                        var option = $('<option></option>');
                        option.text(data.d[i].schoolname);
                        schooldropdown.append(option);
                    }
                },
                error: function (error) {
                    alert("Failed to retrieve school dropdown.");
                }
            });
        }
        function classdata() {
            $.ajax({
                type: "POST",
                url: 'WebForm1.aspx/classsectiondata',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    debugger
                    var classdropdown = $('#classdropdown');
                    for (var i = 0; i < data.d.length; i++) {
                        var option = $('<option></option>');
                        option.text(data.d[i].classname);
                        classdropdown.append(option);
                    }
                },
                error: function (error) {
                    alert("Failed to retrieve class dropdown.");
                }
            });
        
            $.ajax({
                type: "POST",
                url: 'WebForm1.aspx/classsectiondata',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    var section = $('#section');
                    for (var i = 0; i < data.d.length; i++) {
                        var option = $('<option></option>');
                        option.text(data.d[i].section);
                        section.append(option);
                    }
                },
                error: function (error) {
                    alert("Failed to retrieve section dropdown.");
                }
            });
        }
        function submitclick() {
            debugger
            var fname = $("#fname").val();
            var lname = $("#lname").val();
            var dob = $("#dob").val();
            var schooldropdown = $("#schooldropdown").val();
          //  var classdropdown = $("#classdropdown").val();
            //var section = $("#section").val();
            $.ajax({
                type: "POST",
                url: 'WebForm1.aspx/inserttable', 
                data: { fname: fname, lname: lname, dob: dob, schooldropdown: schooldropdown},
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    debugger
                    alert("successfuly inserted");
                },
                error: function (error) {
                    alert("Failed to retrieve data.");
                }
            });
        }
        function resetclick() {
            document.getElementById("form1").reset();
        }
    </script>
</body>
</html>



<%--
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


        public static void insertdata(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;uid=root;pwd=pavithran@123;database=myschool";
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            string sql = "insert into finaltable(fname, lname, dob, schooldropdown)values('"+ fname + "','"+ lname + "','"+ dob + "','"+ schooldropdown + "')";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable(); 
            dt.Load(dr);    
            dr.Close(); 
            con.Close();   
    
     /*  [WebMethod]
        public static string inserttable(string fname, string lname, string dob, string schooldropdown,string classdropdown, string section)
        {
            string connectionString = "server=localhost;uid=root;pwd=pavithran@123;database=myschool";
            MySqlConnection con = new MySqlConnection(connectionString);
            con.Open();
            string sql = "insert into finaltable(fname, lname, dob, schooldropdown)values('" + fname + "','" + lname + "','" + dob + "','" + schooldropdown + "','"+ classdropdown + "','+)";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dr.Close();
            con.Close();
            return "success";
        }*/


        }--%>