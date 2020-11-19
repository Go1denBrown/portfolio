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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.Комуналка". При необходимости она может быть перемещена или удалена.
            this.комуналкаTableAdapter.Fill(this.учёт_расходовDataSet.Комуналка);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.СводкаНал". При необходимости она может быть перемещена или удалена.
            this.сводкаНалTableAdapter.Fill(this.учёт_расходовDataSet.СводкаНал);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.СводкаКом". При необходимости она может быть перемещена или удалена.
            this.сводкаКомTableAdapter.Fill(this.учёт_расходовDataSet.СводкаКом);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.СводкаЗарп". При необходимости она может быть перемещена или удалена.
            this.сводкаЗарпTableAdapter.Fill(this.учёт_расходовDataSet.СводкаЗарп);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.Электроэнергия". При необходимости она может быть перемещена или удалена.
            this.электроэнергияTableAdapter.Fill(this.учёт_расходовDataSet.Электроэнергия);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.Газ". При необходимости она может быть перемещена или удалена.
            this.газTableAdapter.Fill(this.учёт_расходовDataSet.Газ);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.Вода". При необходимости она может быть перемещена или удалена.
            this.водаTableAdapter.Fill(this.учёт_расходовDataSet.Вода);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.Комплектующие". При необходимости она может быть перемещена или удалена.
            this.комплектующиеTableAdapter.Fill(this.учёт_расходовDataSet.Комплектующие);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.Налоги". При необходимости она может быть перемещена или удалена.
            this.налогиTableAdapter.Fill(this.учёт_расходовDataSet.Налоги);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "учёт_расходовDataSet.Зарплата". При необходимости она может быть перемещена или удалена.
            this.зарплатаTableAdapter.Fill(this.учёт_расходовDataSet.Зарплата);
           
        }

        private void зарплатаBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.зарплатаBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.учёт_расходовDataSet);

        }


       //Проверка пин-кода
        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=localhost;Initial Catalog=Учёт расходов;Integrated Security=True; User Instance=false");
            
            string str = "select * from Pincode where ID = 1 and Pin ='" + maskedTextBox1.Text + "' ";

            con.Open();
            SqlCommand cmd = new SqlCommand(str, con);

            object obj = cmd.ExecuteScalar();

            if (obj == null)
            {
                MessageBox.Show("Пин-код не верный");
            }
            else
            {
                this.tabControl1.SelectedIndex = 1;
            }
            
        }


 //Переходы
        private void button2_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 2;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 3;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 4;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 5;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 6;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 7;
        }

        private void button13_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button30_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button24_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button36_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button42_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button48_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }


        //Закрытие
        private void button10_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            Close();
        }


        //Добавление, удаление, сохранение
        private void button16_Click(object sender, EventArgs e)
        {
            зарплатаBindingSource.AddNew();
        }

        private void button17_Click(object sender, EventArgs e)
        {
            зарплатаBindingSource.RemoveCurrent();
        }

        private void button18_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.зарплатаBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.учёт_расходовDataSet);
        }

        private void button27_Click(object sender, EventArgs e)
        {
            налогиBindingSource.AddNew();
        }

        private void button26_Click(object sender, EventArgs e)
        {
            налогиBindingSource.RemoveCurrent();
        }

        private void button25_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.налогиBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.учёт_расходовDataSet);
        }

        private void button21_Click(object sender, EventArgs e)
        {
            комплектующиеBindingSource.AddNew();
        }

        private void button20_Click(object sender, EventArgs e)
        {
            комплектующиеBindingSource.RemoveCurrent();
        }

        private void button19_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.комплектующиеBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.учёт_расходовDataSet);
        }

        private void button33_Click(object sender, EventArgs e)
        {
            водаBindingSource.AddNew();
        }

        private void button32_Click(object sender, EventArgs e)
        {
            водаBindingSource.RemoveCurrent();
        }

        private void button31_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.водаBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.учёт_расходовDataSet);
        }

        private void button39_Click(object sender, EventArgs e)
        {
            газBindingSource.AddNew();
        }

        private void button38_Click(object sender, EventArgs e)
        {
            газBindingSource.RemoveCurrent();
        }

        private void button37_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.газBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.учёт_расходовDataSet);
        }

        private void button45_Click(object sender, EventArgs e)
        {
            электроэнергияBindingSource.AddNew();
        }

        private void button44_Click(object sender, EventArgs e)
        {
            электроэнергияBindingSource.RemoveCurrent();
        }

        private void button43_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.электроэнергияBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.учёт_расходовDataSet);
        }


        //Поиск
        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            for (int i = 0; i <= зарплатаDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= зарплатаDataGridView.RowCount - 2; j++)
                {
                    зарплатаDataGridView[i, j].Style.BackColor = Color.White;
                    зарплатаDataGridView[i, j].Style.ForeColor = Color.Black;
                }
            }
            for (int i = 0; i <= зарплатаDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= зарплатаDataGridView.RowCount - 2; j++)
                    if (зарплатаDataGridView[i, j].Value.ToString().IndexOf(textBox2.Text) != -1)

                    {
                        зарплатаDataGridView[i, j].Style.BackColor = Color.AliceBlue;
                        зарплатаDataGridView[i, j].Style.ForeColor = Color.Blue;
                    }
            }
        }

        private void textBox5_KeyPress(object sender, KeyPressEventArgs e)
        {
            for (int i = 0; i <= налогиDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= налогиDataGridView.RowCount - 2; j++)
                {
                    налогиDataGridView[i, j].Style.BackColor = Color.White;
                    налогиDataGridView[i, j].Style.ForeColor = Color.Black;
                }
            }
            for (int i = 0; i <= налогиDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= налогиDataGridView.RowCount - 2; j++)
                    if (налогиDataGridView[i, j].Value.ToString().IndexOf(textBox5.Text) != -1)

                    {
                        налогиDataGridView[i, j].Style.BackColor = Color.AliceBlue;
                        налогиDataGridView[i, j].Style.ForeColor = Color.Blue;
                    }
            }
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            for (int i = 0; i <= комплектующиеDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= комплектующиеDataGridView.RowCount - 2; j++)
                {
                    комплектующиеDataGridView[i, j].Style.BackColor = Color.White;
                    комплектующиеDataGridView[i, j].Style.ForeColor = Color.Black;
                }
            }
            for (int i = 0; i <= комплектующиеDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= комплектующиеDataGridView.RowCount - 2; j++)
                    if (комплектующиеDataGridView[i, j].Value.ToString().IndexOf(textBox3.Text) != -1)

                    {
                        комплектующиеDataGridView[i, j].Style.BackColor = Color.AliceBlue;
                        комплектующиеDataGridView[i, j].Style.ForeColor = Color.Blue;
                    }
            }
        }

        private void textBox7_KeyPress(object sender, KeyPressEventArgs e)
        {
            for (int i = 0; i <= водаDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= водаDataGridView.RowCount - 2; j++)
                {
                    водаDataGridView[i, j].Style.BackColor = Color.White;
                    водаDataGridView[i, j].Style.ForeColor = Color.Black;
                }
            }
            for (int i = 0; i <= водаDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= водаDataGridView.RowCount - 2; j++)
                    if (водаDataGridView[i, j].Value.ToString().IndexOf(textBox7.Text) != -1)

                    {
                        водаDataGridView[i, j].Style.BackColor = Color.AliceBlue;
                        водаDataGridView[i, j].Style.ForeColor = Color.Blue;
                    }
            }
        }

        private void textBox9_KeyPress(object sender, KeyPressEventArgs e)
        {
            for (int i = 0; i <= газDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= газDataGridView.RowCount - 2; j++)
                {
                    газDataGridView[i, j].Style.BackColor = Color.White;
                    газDataGridView[i, j].Style.ForeColor = Color.Black;
                }
            }
            for (int i = 0; i <= газDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= газDataGridView.RowCount - 2; j++)
                    if (газDataGridView[i, j].Value.ToString().IndexOf(textBox9.Text) != -1)

                    {
                        газDataGridView[i, j].Style.BackColor = Color.AliceBlue;
                        газDataGridView[i, j].Style.ForeColor = Color.Blue;
                    }
            }
        }

        private void textBox11_KeyPress(object sender, KeyPressEventArgs e)
        {
            for (int i = 0; i <= электроэнергияDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= электроэнергияDataGridView.RowCount - 2; j++)
                {
                    электроэнергияDataGridView[i, j].Style.BackColor = Color.White;
                    электроэнергияDataGridView[i, j].Style.ForeColor = Color.Black;
                }
            }
            for (int i = 0; i <= электроэнергияDataGridView.ColumnCount - 1; i++)
            {
                for (int j = 0; j <= электроэнергияDataGridView.RowCount - 2; j++)
                    if (электроэнергияDataGridView[i, j].Value.ToString().IndexOf(textBox11.Text) != -1)

                    {
                        электроэнергияDataGridView[i, j].Style.BackColor = Color.AliceBlue;
                        электроэнергияDataGridView[i, j].Style.ForeColor = Color.Blue;
                    }
            }
        }


        //Фильтрации
        private void button14_Click(object sender, EventArgs e)
        {
            if (comboBox1.Text == "id_выплаты")
            {
                if (String.IsNullOrEmpty(textBox1.Text))
                    зарплатаBindingSource.Filter = "";
                else зарплатаBindingSource.Filter = String.Format("Convert([id_выплаты], System.String) LIKE '%{0}%'", textBox1.Text);
            }
            if (comboBox1.Text == "ФИО")
            {
                if (String.IsNullOrEmpty(textBox1.Text))
                    зарплатаBindingSource.Filter = "";
                else зарплатаBindingSource.Filter = String.Format("Convert([ФИО], System.String) LIKE '%{0}%'", textBox1.Text);
            }
            if (comboBox1.Text == "Оклад")
            {
                if (String.IsNullOrEmpty(textBox1.Text))
                    зарплатаBindingSource.Filter = "";
                else зарплатаBindingSource.Filter = String.Format("Convert([Оклад], System.String) LIKE '%{0}%'", textBox1.Text);
            }
            if (comboBox1.Text == "Номер_банк_карты")
            {
                if (String.IsNullOrEmpty(textBox1.Text))
                    зарплатаBindingSource.Filter = "";
                else зарплатаBindingSource.Filter = String.Format("Convert([Номер_банк_карты], System.String) LIKE '%{0}%'", textBox1.Text);
            }
            if (comboBox1.Text == "ДатаЗП")
            {
                if (String.IsNullOrEmpty(textBox1.Text))
                    зарплатаBindingSource.Filter = "";
                else зарплатаBindingSource.Filter = String.Format("Convert([ДатаЗП], System.String) LIKE '%{0}%'", textBox1.Text);
            }
            
        }

        private void button29_Click(object sender, EventArgs e)
        {
            if (comboBox3.Text == "id_записиН")
            {
                if (String.IsNullOrEmpty(textBox6.Text))
                    налогиBindingSource.Filter = "";
                else налогиBindingSource.Filter = String.Format("Convert([id_записиН], System.String) LIKE '%{0}%'", textBox6.Text);
            }
            if (comboBox3.Text == "НДС")
            {
                if (String.IsNullOrEmpty(textBox6.Text))
                    налогиBindingSource.Filter = "";
                else налогиBindingSource.Filter = String.Format("Convert([НДС], System.String) LIKE '%{0}%'", textBox6.Text);
            }
            if (comboBox3.Text == "НДФЛ")
            {
                if (String.IsNullOrEmpty(textBox6.Text))
                    налогиBindingSource.Filter = "";
                else налогиBindingSource.Filter = String.Format("Convert([НДФЛ], System.String) LIKE '%{0}%'", textBox6.Text);
            }
            if (comboBox3.Text == "ПФР")
            {
                if (String.IsNullOrEmpty(textBox6.Text))
                    налогиBindingSource.Filter = "";
                else налогиBindingSource.Filter = String.Format("Convert([ПФР], System.String) LIKE '%{0}%'", textBox6.Text);
            }
            if (comboBox3.Text == "ФМС")
            {
                if (String.IsNullOrEmpty(textBox6.Text))
                    налогиBindingSource.Filter = "";
                else налогиBindingSource.Filter = String.Format("Convert([ФМС], System.String) LIKE '%{0}%'", textBox6.Text);
            }
            if (comboBox3.Text == "ФСС")
            {
                if (String.IsNullOrEmpty(textBox6.Text))
                    налогиBindingSource.Filter = "";
                else налогиBindingSource.Filter = String.Format("Convert([ФСС], System.String) LIKE '%{0}%'", textBox6.Text);
            }
            if (comboBox3.Text == "Дата")
            {
                if (String.IsNullOrEmpty(textBox6.Text))
                    налогиBindingSource.Filter = "";
                else налогиBindingSource.Filter = String.Format("Convert([Дата], System.String) LIKE '%{0}%'", textBox6.Text);
            }
        }

        private void button23_Click(object sender, EventArgs e)
        {
            if (comboBox2.Text == "id_Комплект")
            {
                if (String.IsNullOrEmpty(textBox4.Text))
                    комплектующиеBindingSource.Filter = "";
                else комплектующиеBindingSource.Filter = String.Format("Convert([id_Комплект], System.String) LIKE '%{0}%'", textBox4.Text);
            }
            if (comboBox2.Text == "Наименование")
            {
                if (String.IsNullOrEmpty(textBox4.Text))
                    комплектующиеBindingSource.Filter = "";
                else комплектующиеBindingSource.Filter = String.Format("Convert([Наименование], System.String) LIKE '%{0}%'", textBox4.Text);
            }
            if (comboBox2.Text == "Дата_закупки")
            {
                if (String.IsNullOrEmpty(textBox4.Text))
                    комплектующиеBindingSource.Filter = "";
                else комплектующиеBindingSource.Filter = String.Format("Convert([Дата_закупки], System.String) LIKE '%{0}%'", textBox4.Text);
            }
            if (comboBox2.Text == "Количество")
            {
                if (String.IsNullOrEmpty(textBox4.Text))
                    комплектующиеBindingSource.Filter = "";
                else комплектующиеBindingSource.Filter = String.Format("Convert([Количество], System.String) LIKE '%{0}%'", textBox4.Text);
            }
            if (comboBox2.Text == "Стоимость_за_Шт")
            {
                if (String.IsNullOrEmpty(textBox4.Text))
                    комплектующиеBindingSource.Filter = "";
                else комплектующиеBindingSource.Filter = String.Format("Convert([Стоимость_за_Шт], System.String) LIKE '%{0}%'", textBox4.Text);
            }
        }

        private void button35_Click(object sender, EventArgs e)
        {
            if (comboBox4.Text == "id_счётаВ")
            {
                if (String.IsNullOrEmpty(textBox8.Text))
                    водаBindingSource.Filter = "";
                else водаBindingSource.Filter = String.Format("Convert([id_счётаВ], System.String) LIKE '%{0}%'", textBox8.Text);
            }
            if (comboBox4.Text == "Вода_кол_м3")
            {
                if (String.IsNullOrEmpty(textBox8.Text))
                    водаBindingSource.Filter = "";
                else водаBindingSource.Filter = String.Format("Convert([Вода_кол_м3], System.String) LIKE '%{0}%'", textBox8.Text);
            }
            if (comboBox4.Text == "Сумма_В")
            {
                if (String.IsNullOrEmpty(textBox8.Text))
                    водаBindingSource.Filter = "";
                else водаBindingSource.Filter = String.Format("Convert([Сумма_В], System.String) LIKE '%{0}%'", textBox8.Text);
            }
            if (comboBox4.Text == "ДатаВ")
            {
                if (String.IsNullOrEmpty(textBox8.Text))
                    водаBindingSource.Filter = "";
                else водаBindingSource.Filter = String.Format("Convert([ДатаВ], System.String) LIKE '%{0}%'", textBox8.Text);
            }
        }

        private void button41_Click(object sender, EventArgs e)
        {
            if (comboBox5.Text == "id_счётаГ")
            {
                if (String.IsNullOrEmpty(textBox10.Text))
                    газBindingSource.Filter = "";
                else газBindingSource.Filter = String.Format("Convert([id_счётаГ], System.String) LIKE '%{0}%'", textBox10.Text);
            }
            if (comboBox5.Text == "Газ_кол_м3")
            {
                if (String.IsNullOrEmpty(textBox10.Text))
                    газBindingSource.Filter = "";
                else газBindingSource.Filter = String.Format("Convert([Газ_кол_м3], System.String) LIKE '%{0}%'", textBox10.Text);
            }
            if (comboBox5.Text == "Сумма_Г")
            {
                if (String.IsNullOrEmpty(textBox10.Text))
                    газBindingSource.Filter = "";
                else газBindingSource.Filter = String.Format("Convert([Сумма_Г], System.String) LIKE '%{0}%'", textBox10.Text);
            }
            if (comboBox5.Text == "Дата")
            {
                if (String.IsNullOrEmpty(textBox10.Text))
                    газBindingSource.Filter = "";
                else газBindingSource.Filter = String.Format("Convert([Дата], System.String) LIKE '%{0}%'", textBox10.Text);
            }
        }

        private void button47_Click(object sender, EventArgs e)
        {
            if (comboBox6.Text == "id_счётаЭ")
            {
                if (String.IsNullOrEmpty(textBox12.Text))
                    электроэнергияBindingSource.Filter = "";
                else электроэнергияBindingSource.Filter = String.Format("Convert([id_счётаЭ], System.String) LIKE '%{0}%'", textBox12.Text);
            }
            if (comboBox6.Text == "Количество_КВ")
            {
                if (String.IsNullOrEmpty(textBox12.Text))
                    электроэнергияBindingSource.Filter = "";
                else электроэнергияBindingSource.Filter = String.Format("Convert([Количество_КВ], System.String) LIKE '%{0}%'", textBox12.Text);
            }
            if (comboBox6.Text == "Сумма_Э")
            {
                if (String.IsNullOrEmpty(textBox12.Text))
                    электроэнергияBindingSource.Filter = "";
                else электроэнергияBindingSource.Filter = String.Format("Convert([Сумма_Э], System.String) LIKE '%{0}%'", textBox12.Text);
            }
            if (comboBox6.Text == "ДатаЭ")
            {
                if (String.IsNullOrEmpty(textBox12.Text))
                    электроэнергияBindingSource.Filter = "";
                else электроэнергияBindingSource.Filter = String.Format("Convert([ДатаЭ], System.String) LIKE '%{0}%'", textBox12.Text);
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Pin f1 = new Pin();
            f1.Show();

        }

        private void button15_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 9;
        }

        private void button40_Click(object sender, EventArgs e)
        {

            сводкаЗарпBindingSource.Filter = String.Format("[ДатаЗП] >= '"+dateTimePicker1.Value.Date+ "' AND [ДатаЗП] <= '" + dateTimePicker2.Value.Date + "'");

            double balans = 0;
            foreach (DataGridViewRow row in сводкаЗарпDataGridView.Rows)
            {
                double incom;
                double.TryParse((row.Cells[2].Value ?? "0").ToString().Replace(".", ","), out incom);
                balans += incom;
            }

            сводкаЗарпDataGridView.Visible = true;
            label29.Text = "Расходы на выплату зарплат за заданный период составляют: " + balans.ToString()+" р";
            label29.Visible = true;

        }

        private void button34_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button22_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 10;
        }

        private void button46_Click(object sender, EventArgs e)
        {
            сводкаКомBindingSource.Filter = String.Format("[Дата_закупки] >= '" + dateTimePicker4.Value.Date + "' AND [Дата_закупки] <= '" + dateTimePicker3.Value.Date + "'");

            double balans = 0;
            foreach (DataGridViewRow row in сводкаКомDataGridView.Rows)
            {
                double incom;
                double kol;
                double sum;
                double.TryParse((row.Cells[3].Value ?? "0").ToString().Replace(".", ","), out kol);
                double.TryParse((row.Cells[4].Value ?? "0").ToString().Replace(".", ","), out incom);
                sum = kol * incom;
                balans += sum;
            }

            сводкаКомDataGridView.Visible = true;
            label30.Text = "Расходы на комплектующие за заданный период составляют: " + balans.ToString() + " р";
            label30.Visible = true;
        }

        private void button49_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button51_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button28_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 11;
        }

        private void button50_Click(object sender, EventArgs e)
        {
            сводкаНалBindingSource.Filter = String.Format("[Дата] >= '" + dateTimePicker6.Value.Date + "' AND [Дата] <= '" + dateTimePicker5.Value.Date + "'");

            double balans = 0;
            foreach (DataGridViewRow row in сводкаНалDataGridView.Rows)
            {
                double nds;
                double ndfl;
                double pfr;
                double fms;
                double fss;

                double.TryParse((row.Cells[1].Value ?? "0").ToString().Replace(".", ","), out nds);
                double.TryParse((row.Cells[2].Value ?? "0").ToString().Replace(".", ","), out ndfl);
                double.TryParse((row.Cells[3].Value ?? "0").ToString().Replace(".", ","), out pfr);
                double.TryParse((row.Cells[4].Value ?? "0").ToString().Replace(".", ","), out fms);
                double.TryParse((row.Cells[5].Value ?? "0").ToString().Replace(".", ","), out fss);

                balans += nds+ndfl+pfr+fms+fss;
            }

            сводкаНалDataGridView.Visible = true;
            label31.Text = "Расходы на налоги за заданный период составляют: " + balans.ToString() + " р";
            label31.Visible = true;
        }

        private void button9_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 8;
        }

        private void button53_Click(object sender, EventArgs e)
        {
            this.tabControl1.SelectedIndex = 1;
        }

        private void button52_Click(object sender, EventArgs e)
        {
            комуналкаBindingSource.Filter = String.Format("[Дата] >= '" + dateTimePicker8.Value.Date + "' AND [Дата] <= '" + dateTimePicker7.Value.Date + "'");

            double balans = 0;
            foreach (DataGridViewRow row in комуналкаDataGridView.Rows)
            {
                double vod;
                double gaz;
                double el;

                double.TryParse((row.Cells[3].Value ?? "0").ToString().Replace(".", ","), out vod);
                double.TryParse((row.Cells[4].Value ?? "0").ToString().Replace(".", ","), out gaz);
                double.TryParse((row.Cells[5].Value ?? "0").ToString().Replace(".", ","), out el);

                balans += vod + gaz + el;
            }

            комуналкаDataGridView.Visible = true;
            label28.Text = "Расходы на коммунальные услуги за заданный период составляют: " + balans.ToString() + " р";
            label28.Visible = true;
        }

        private void button12_Click(object sender, EventArgs e)
        {
            Sprav f2 = new Sprav();
            f2.Show();
        }
    }
}
