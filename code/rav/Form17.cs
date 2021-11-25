﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using MySql.Data.MySqlClient;

namespace rav
{
    public partial class Form17 : Form
    {
        public Form17()
        {
            InitializeComponent();
        }
        WebBrowser webBrowser1 = new WebBrowser();
        private void Form17_Load(object sender, EventArgs e)
        {
            webBrowser1.Left = 12;
            webBrowser1.Top = 90;
            webBrowser1.Width = 754;
            webBrowser1.Height = 440;
            webBrowser1.ScrollBarsEnabled = true;
            webBrowser1.Visible = true;
            webBrowser1.ScriptErrorsSuppressed = true;
            this.webBrowser1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top 
                | System.Windows.Forms.AnchorStyles.Bottom)
                | System.Windows.Forms.AnchorStyles.Left)
                | System.Windows.Forms.AnchorStyles.Right)));
            this.Controls.Add(this.webBrowser1);
            textBox1.Text = DateTime.Now.AddDays(-7).ToString();
            textBox2.Text = DateTime.Now.ToString();
        }
        string archivo = Directory.GetCurrentDirectory() + "\\ReportePruebasPorPeriodo.htm";
        private void button1_Click(object sender, EventArgs e)
        {//Generar
            int total = 0;
            StreamWriter arch = new StreamWriter(archivo);
            arch.WriteLine("<html>REPORTE DE PRUEBAS<br>Fecha: " + System.DateTime.Now.ToString() + "<br><br>");
            arch.WriteLine("<table border=1 cellspacing=0>");
            arch.WriteLine("<tr><td>ID_PRUEBA</td><td>PRUEBA</td><td>DESCRIPCION</td><td>TIPODEPRUEBA</td>" +
                "<td>MODULO</td><td>ELABORA</td><td>AUTORIZA</td><td>AUROTIZADA</td><td>REQUISITOS</td></tr>");
            string connectionString = "datasource=localhost;port=3306;username=root;password=123456;database=repositorio;";
            string desde = textBox1.Text.Substring(6, 4) + textBox1.Text.Substring(3, 2) + textBox1.Text.Substring(0, 2)
                + textBox1.Text.Substring(11, 2) + textBox1.Text.Substring(14, 2) + textBox1.Text.Substring(17, 2);
            string hasta = textBox2.Text.Substring(6, 4) + textBox2.Text.Substring(3, 2) + textBox2.Text.Substring(0, 2)
                + textBox2.Text.Substring(11, 2) + textBox2.Text.Substring(14, 2) + textBox2.Text.Substring(17, 2);
            string query = "Select * from pruebas where AUROTIZADA>=" + desde + " and AUROTIZADA<=" + hasta;
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query, databaseConnection);
            MySqlDataReader reader;
            try
            {
                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arch.WriteLine("<tr><td>" + reader.GetString(0) + "</td><td>" + reader.GetString(1)
                                    + "</td><td>" + reader.GetString(2) + "</td><td>" + reader.GetString(3)
                                    + "</td><td>" + reader.GetString(4) + "</td><td>" + reader.GetString(5)
                                    + "</td><td>" + reader.GetString(6) + "</td><td>" + reader.GetString(7)
                                    + "</td><td>" + reader.GetString(8) + "</td></tr>");
                        total++;
                    }
                }
                else
                {
                    MessageBox.Show("No se encontraron datos.");
                }
                databaseConnection.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            arch.WriteLine("</table></html>");
            arch.WriteLine("Total de registros: " + total.ToString());
            arch.Close();
            Uri dir = new Uri(archivo);
            webBrowser1.Url = dir;
        }
    }
}
