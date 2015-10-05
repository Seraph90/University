using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            dGV.RowCount = (int)UD_n.Value;
            dGV[0, 0].Value = "x1";
            dGV[0, 1].Value = "x2";
            dGV[1, 0].Value = 5;
            dGV[1, 1].Value = 6;
            /*
            dGV[0, 2].Value = "x3";
            dGV[0, 3].Value = "x4";
            dGV[0, 4].Value = "x5";
            dGV[0, 5].Value = "x6";
            dGV[1, 2].Value = 13;
            dGV[1, 3].Value = 4;
            dGV[1, 4].Value = 3;
            dGV[1, 5].Value = 3;
            */
        }

        private Double F(Double[] x)
        {
            Double funct = 0;
            /*
            for (int i = 0; i < x.Length; i++)
                funct += (x[i] * x[i]);*/
            funct = Math.Pow(x[0] * x[0] + x[1] - 11, 2) + Math.Pow(x[0] + x[1] * x[1] - 7, 2);
            return funct;
        }

        private Double MB(Double[] x, int i, Double eps)
        {
            Double y1, y2, y, a, b;
            a = x[i] - 100;
            b = x[i] + 100;
            x[i] = (b + a) / 2;
            y = F(x);
            x[i] = (x[i] + a) / 2;
            y1 = F(x);
            x[i] = b - (b - a) / 4;
            y2 = F(x);
            while (true)
            {
                if ((y1 > y) && (y2 > y))
                {
                    a = a + 0.25 * (b - a);
                    b = a + 0.75 * (b - a);
                }
                else
                    if ((y2 > y) && (y > y1))
                        b = (a + b) / 2;
                    else
                        if ((y1 > y) && (y > y2))
                            a = (a + b) / 2;
                        else
                            if ((y > y1) && (y > y2))
                            {
                                MessageBox.Show("Функция не унимодальная!", "Ограничение");
                                break;
                            }
                            else
                                break;
                x[i] = (a + b) / 2;
                y = F(x);
                x[i] = a + 0.25 * (b - a);
                y1 = F(x);
                x[i] = a + 0.75 * (b - a);
                y2 = F(x);
                if (((b - a) < 0.0001))
                    break;
            }
            return (a + b) / 2;
        }

        private void b_Solve_Click(object sender, EventArgs e)
        {
            double x_old, path, eps;
            int stp_count = 0;
            int n;
            eps = Convert.ToDouble(tB_e.Text);
            n = Convert.ToInt32(UD_n.Value);
            double[] x = new double[n];
            for (int i = 0; i < n; i++)
                x[i] = Convert.ToDouble(dGV[1, i].Value);
            dGV_S.RowCount = 2;
            dGV_S.ColumnCount = n + 2;
            dGV_S[0, 0].Value = 0;
            for (int k = 0; k < x.Length; k++)
            {
                dGV_S[k + 1, 0].Value = Math.Round(x[k], 2);
            }
            dGV_S[n + 1, 0].Value = Math.Round(F(x), 6);
            do
            {
                path = 0;
                for (int i = 0; i < n; i++)
                {
                    dGV_S.RowCount++;
                    dGV_S[0, stp_count].Value = stp_count;
                    x_old = x[i];
                    MB(x, i, eps);
                    path += Math.Pow(x_old - x[i], 2);
                    for (int ii = 0; ii < n; ii++)
                    {
                        if (ii == i)
                            dGV_S[ii + 1, stp_count].Value = Math.Round(x_old, 10); //x[i], 10);
                        else
                            dGV_S[ii + 1, stp_count].Value = Math.Round(x[ii], 10);
                    }
                    dGV_S[n + 1, stp_count].Value = Math.Round(F(x), 10);
                    stp_count++;
                }
                path = Math.Sqrt(path);
            }
            while (path > eps && stp_count < 50);
            if (stp_count >= 50)
                MessageBox.Show("Минимум не найден за 50 шагов, процесс остановлен!", "Ограничение");
            dGV_S.RowCount--;
        }

        private void dGV_S_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            for (int i = 0; i < dGV.RowCount; i++)
                dGV[0, i].Value = "x" + (i + 1).ToString();
        }

        private void UD_n_ValueChanged(object sender, EventArgs e)
        {
            int n = (int)UD_n.Value;
            dGV.RowCount = n;
            for (int i = 0; i < n; i++)
            {
                dGV[0, i].Value = "x" + Convert.ToString(i + 1);
                dGV[1, i].Value = Convert.ToString(i + 1);
            }
            dGV_S.ColumnCount = n + 2;
            for (int i = 1; i < n + 2; i++)
                dGV_S.Columns[i].Width = 70;
            for (int i = 1; i < n + 1; i++)
                dGV_S.Columns[i].HeaderText = "x" + (i);
            dGV_S.Columns[n + 1].HeaderText = "F(x...)";
        }
    }
}
