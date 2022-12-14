<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyForm.aspx.cs" Inherits="MuskanAssignment.MyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 62px;
        }

        .auto-style2 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }

        .auto-style3 {
            width: 246px;
        }

        .auto-style4 {
            width: 1334px;
        }
        .auto-style5 {
            margin-right: 0px;
        }
    </style>
</head>
<body style="height: 81px; width: 1009px;">
    <form id="form1" runat="server">
        <p class="auto-style1" style="font-family: 'Times New Roman', Times, serif; font-size: xx-large; background-color: #006699; font-weight: bold; text-decoration: blink; color: #FFFFFF;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shopping</p>
        <table align="center" class="auto-style2">
            <tr>
                <td class="auto-style3">OrderID</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox1" runat="server" Width="358px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">CustomerName</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="CustomerNAME" DataTextField="CustomerName" DataValueField="CustomerName" Width="134px" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CustomerNAME" runat="server" ConnectionString="<%$ ConnectionStrings:AssignmentConnectionString %>" SelectCommand="SELECT DISTINCT [CustomerName] FROM [Customeer]"></asp:SqlDataSource>
                    &nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GridView1" runat="server" CellPadding="3" Height="16px" Width="133px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" Width="147px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">OrderDate</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Payment Mode</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
        <p class="auto-style1" style="background-color: #FFFFFF">
            &nbsp;&nbsp;
&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="3" ShowFooter="True" ShowHeaderWhenEmpty="True" DataKeyNames="ProductName"
                OnRowCommand="GridView2_RowCommand" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="Gridview2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating"    OnRowDeleting="GridView2_RowDeleting"  Width="1152px" Visible="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" CssClass="auto-style5">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />

                <Columns>
                    <asp:TemplateField HeaderText="ProductName">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ProductName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProductName" Text='<%# Eval("ProductName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="txtProductNameFooter" runat="server" DataSourceID="SqlDataSource14" DataTextField="ProductName" DataValueField="ProductName" Height="23px" Width="182px" >
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:AssignmentConnectionString %>" SelectCommand="SELECT [ProductName] FROM [Product]"></asp:SqlDataSource>
                        </FooterTemplate>
                    </asp:TemplateField>
                            

                    <asp:TemplateField HeaderText="Rate">
                        <FooterTemplate>
                            <asp:TextBox ID="txtRateFooter" runat="server" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Rate") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Quantity") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQuantity" Text='<%# Eval("Quantity") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtQuantityFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TotalAmount">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("TotalAmount") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTotalAmount" Text='<%# Eval("TotalAmount") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtTotalAmountFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" Width="26px" />
            <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
        </p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>

