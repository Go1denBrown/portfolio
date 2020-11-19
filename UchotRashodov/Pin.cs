using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Common;
using System.Data.SqlClient;

namespace UchotRashodov
{
    public partial class Pin : Form
    {
        public Pin()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=localhost;Initial Catalog=Учёт расходов;Integrated Security=True; User Instance=false");
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.Clear();
                cmd.Connection = con;
                cmd.CommandText = "UPDATE Pincode SET Pin = " + maskedTextBox1.Text + " WHERE ID = 1";
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
                con.Dispose();
                MessageBox.Show("Новый пин-код установлен.");
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
