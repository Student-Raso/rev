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
    public partial class Form22 : Form
    {
        public Form22()
        {
            InitializeComponent();
        }
        WebBrowser webBrowser1 = new WebBrowser();
        private void Form22_Load(object sender, EventArgs e)
        {
            webBrowser1.Left = 12;
            webBrowser1.Top = 53;
            webBrowser1.Width = 754;
            webBrowser1.Height = 480;
            webBrowser1.ScrollBarsEnabled = true;
            webBrowser1.Visible = true;
            webBrowser1.ScriptErrorsSuppressed = true;
            this.webBrowser1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top
                | System.Windows.Forms.AnchorStyles.Bottom)
                | System.Windows.Forms.AnchorStyles.Left)
                | System.Windows.Forms.AnchorStyles.Right)));
            this.Controls.Add(this.webBrowser1);
            button1_Click(sender, e);
        }
        string archivo = Directory.GetCurrentDirectory() + "\\SumarioDeResultadosPorUsuario.htm";
        private void button1_Click(object sender, EventArgs e)
        {//Generar
            int total = 0;
            StreamWriter arch = new StreamWriter(archivo);
            arch.WriteLine("<html><meta charset=\"UTF-8\">SUMARIO DE RESULTADOS POR USUARIO<br>Fecha: " + System.DateTime.Now.ToString() + "<br><br>");
            arch.WriteLine("<table border=1 cellspacing=0>");
            arch.WriteLine("<tr><td>ID_RESULTADO</td><td>RESULTADO</td><td>ID_APLICACION</td><td>DATO</td><td>ESPERANDO</td>" +
                "<td>ENTREGADA</td><td>RECIBIDO</td><td>ESTADO</td><td>ID_USUARIO</td><td>USUARIO</td><td>CUENTA</td>" +
                "<td>CLAVE</td><td>ROL</td></tr>");
            string connectionString = "datasource=localhost;port=3306;username=root;password=123456;database=repositorio;";
            string query = "select*from resultados, usuarios WHERE resultados.id_resultado=usuarios.id_usuario" +
                " ORDER BY resultados.id_resultado, usuarios.id_usuario";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query, databaseConnection);
            MySqlDataReader reader;
            try
            {
                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                if (reader.HasRows)
                {
                    string anterior = ""; 
                    while (reader.Read())//13
                    {
                        arch.WriteLine("<tr><td>" + ((anterior == reader.GetString(0)) ? " " : reader.GetString(0))
                                    + "</td><td>" + ((anterior == reader.GetString(0)) ? " " : reader.GetString(1))
                                    + "</td><td>" + ((anterior == reader.GetString(0)) ? " " : reader.GetString(2))
                                    + "</td><td>" + ((anterior == reader.GetString(0)) ? " " : reader.GetString(3))
                                    + "</td><td>" + ((anterior == reader.GetString(0)) ? " " : reader.GetString(4))
                                    + "</td><td>" + ((anterior == reader.GetString(0)) ? " " : reader.GetString(5))
                                    + "</td><td>" + ((anterior == reader.GetString(0)) ? " " : reader.GetString(6))
                                    + "</td><td>" + reader.GetString(7)
                                    + "</td><td>" + reader.GetString(8) 
                                    + "</td><td>" + reader.GetString(9)
                                    + "</td><td>" + reader.GetString(10) 
                                    + "</td><td>" + reader.GetString(11)
                                    + "</td><td>" + reader.GetString(12) 
                                    + "</td></tr>");
                        anterior = reader.GetString(0); 
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

        private void button2_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\Program Files\Microsoft Office\root\Office16\excel",
                "\"" + archivo + "\"");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\Program Files\Google\Chrome\Application\chrome",
                "\"" + archivo + "\"");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
