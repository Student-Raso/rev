using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace rav
{
    public partial class Form4 : Form
    {
        string aplicSelec = "";
        public Form4(string aplic)
        {
            InitializeComponent();
            aplicSelec = aplic;
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            this.Text = "Resultados de la Aplicación: " + aplicSelec;
        }
    }
}
