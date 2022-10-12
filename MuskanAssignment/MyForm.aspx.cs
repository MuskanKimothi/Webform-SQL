using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MuskanAssignment
{
    public partial class MyForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=LPCL-PG033XXT;Initial Catalog=Assignment;User ID=sa;Password=espire123");
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }
        void PopulateGridview()
        {
            DataTable dtt = new DataTable();
            {
                con.Open();
                SqlDataAdapter Da = new SqlDataAdapter("SELECT * FROM dbo.OrderDetail", con);
                Da.Fill(dtt);
            }
            if (dtt.Rows.Count > 0)
            {
                GridView2.DataSource = dtt;
                GridView2.DataBind();
            }
            else
            {
                dtt.Rows.Add(dtt.NewRow());
                GridView2.DataSource = dtt;
                GridView2.DataBind();
                GridView2.Rows[0].Cells.Clear();
                GridView2.Rows[0].Cells.Add(new TableCell());
                GridView2.Rows[0].Cells[0].ColumnSpan = dtt.Columns.Count;
                GridView2.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }




        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    {
                        con.Open();
                        string query = "INSERT INTO dbo.OrderDetail (ProductName,Rate,Quantity,TotalAmount) VALUES (@ProductName,@Rate,@Quantity,@TotalAmount)";
                        SqlCommand sqlCmd = new SqlCommand(query, con);
                        sqlCmd.Parameters.AddWithValue("@ProductName", (GridView2.FooterRow.FindControl("txtProductNameFooter") as DropDownList).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Rate", (GridView2.FooterRow.FindControl("txtRateFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Quantity", (GridView2.FooterRow.FindControl("txtQuantityFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@TotalAmount", (GridView2.FooterRow.FindControl("txtTotalAmountFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        con.Close();
                        PopulateGridview();
                        lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }



        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }



        protected void Gridview2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            PopulateGridview();
        }
        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                {
                    con.Open();
                    string query = "UPDATE dbo.OrderDetail SET ProductName=@ProductName,Rate=@Rate,Quantity=@Quantity,TotalAmount=@TotalAmount WHERE ProductName = @ProductName";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@ProductName", (GridView2.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Rate", (GridView2.Rows[e.RowIndex].FindControl("txtRate") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Quantity", (GridView2.Rows[e.RowIndex].FindControl("txtQuantity") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@TotalAmount", (GridView2.Rows[e.RowIndex].FindControl("txtTotalQuantity") as TextBox).Text.Trim());
                    //sqlCmd.Parameters.AddWithValue("@Name", Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    con.Close();
                    GridView2.EditIndex = -1;
                    PopulateGridview();
                    lblSuccessMessage.Text = "Selected Record Updated";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                {
                    con.Open();
                    string query = "DELETE FROM dbo.OrderDetail WHERE ProductName = @Name";
                    SqlCommand sqlCmd = new SqlCommand(query, con);
                    sqlCmd.Parameters.AddWithValue("@Name", GridView2.DataKeys[e.RowIndex].Value.ToString());
                    sqlCmd.ExecuteNonQuery();
                    con.Close();
                    PopulateGridview();
                    lblSuccessMessage.Text = "Selected Record Deleted";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "-1")
            {
                Response.Write("Please Select an Customer..");
            }
            else
            {
                string query = "select * from dbo.Customeer where CustomerName = @name";
                SqlDataAdapter sd = new SqlDataAdapter(query, con);
                sd.SelectCommand.Parameters.AddWithValue("@name", DropDownList1.SelectedItem.Text);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                DropDownList1.ItemType.Insert(0, "Select Customer");




            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
        }



    }
}