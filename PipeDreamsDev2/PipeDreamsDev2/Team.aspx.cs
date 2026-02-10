using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PipeDreamsDev2
{
    public partial class Team : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindEmployees();
            }

        }
        private void BindEmployees()
        {

            List<Employee> employees = EmployeeRepository.GetAll();
            rptEmployees.DataSource = employees;
            rptEmployees.DataBind();
        }

        public static List<Employee> GetAll()
        {

            return new List<Employee>();
        }
    }
}