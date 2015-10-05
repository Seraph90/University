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
        Double eps;
        Double[] curX;

        public Form1()
        {
            InitializeComponent();
            eps = Double.Parse(textBox1.Text);
            Variables.RowCount = (int)numericUpDown1.Value;
            Variables.ColumnCount = 2;
            for (int i = 0; i < Variables.RowCount; i++)
                Variables[i, 0].Value = "x" + (i + 1);
            Variables[1, 0].Value = 4;
            Variables[1, 1].Value = 5;
            TableResult.ColumnCount = 2 * (int)numericUpDown1.Value + 3;
            TableResult.RowCount = 1;
            TableResult[0, 0].Value = "Шаг";
            int j;
            for (j = 1; j < numericUpDown1.Value + 1; j++)
            {
                TableResult[j, 0].Value = "X" + j.ToString();
                TableResult[j + (int)numericUpDown1.Value, 0].Value = "dF/dX" + j.ToString();
            }
            TableResult[j + (int)numericUpDown1.Value, 0].Value = "F(X)";
            TableResult[j + (int)numericUpDown1.Value + 1, 0].Value = "h";
            for (j = 0; j < TableResult.ColumnCount; j++)
                TableResult.Columns[j].Width = 88;
        }

        private Double F(Double[] x)
        {
            //return Math.Pow((x[0] * x[0] + x[1] - 11), 2) + Math.Pow((x[0] + x[1] * x[1] - 7), 2);
            return x[0] * x[0] / 4 + x[1] * x[1] / 36;

        }

        //вычисляет производную
        private Double dF(Double[] mX, int i)
        {
            Double[] newX = new Double[mX.Length];
            mX.CopyTo(newX, 0);
            newX[i] = newX[i] + eps / 10000;
            return (F(newX) - F(mX)) / (eps / 10000);
        }

        private Double F_step(Double h)
        {
            Double[] newX = new Double[curX.Length];
            for (int i = 0; i < curX.Length; i++)
                newX[i] = curX[i] - h * dF(curX, i);
            return F(newX);
        }

        private Double Gold_Sech(Double a, Double b)
        {
            Double x1, x2;
            Double t = 0.618;
            x1 = b - (b - a) * t;
            x2 = a + (b - a) * t;
            while (true)
            {
                if (F_step(x1) <= F_step(x2))
                {
                    b = x2;
                    x2 = a + t * (b - a);
                }
                else
                {
                    a = x1;
                    x1 = b - t * (b - a);
                }
                if (b - a < eps) break;
            }
            return (a + b) / 2;
        }

        private Double minF(Double initA, Double initB)
        {
            Double x0, y0, y1, y2;
            Double h;
            Double Min, GMin;
            Double a = initA, b = initB;
            if (F_step(a) < F_step(b)) GMin = a;
            else GMin = b;
            h = eps * 10;
            x0 = a;
            y0 = F_step(a);
            y1 = F_step(a + h);
            while (true)
            {
                y2 = F_step(x0 + 2 * h);
                if (((y0 >= y1) & (y2 >= y1)))
                {
                    Min = Gold_Sech(x0, x0 + 2 * h);
                    if (Min < GMin) 
                        GMin = Min;
                }
                x0 += 2 * h;
                y0 = y1;
                y1 = y2;
                if (x0 > b) 
                    break;
            }
            return GMin;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            TableResult.RowCount = 1;
            Double h;
            Int32 i = 1, j;
            int n = (int)numericUpDown1.Value;
            curX = new Double[n];
            Double[] X1 = new Double[n];
            Double a = Double.Parse(textBox3.Text);
            Double b = Double.Parse(textBox4.Text);
            X1 = masX();
            curX = masX();
            TableResult.Rows.Add();
            for (int k = 0; k < n; k++)
            {
                TableResult[k + 1, i].Value = Math.Round(Math.Abs(X1[k]), 4);
                TableResult[k + n + 1, i].Value = Math.Round(dF(X1, k), 4);
            }
            TableResult[2 * n + 1, i].Value = Math.Round(F(X1), 4);
            h = eps / 10;
            while (true)
            {
                TableResult.Rows.Add();
                Array.Copy(X1, curX, n);
                h = minF(a, b);
                TableResult[0, i].Value = i;
                TableResult[2 * n + 2, i].Value = Math.Round(h, 4);
                i++;
                for (j = 0; j < n; j++)
                {
                    X1[j] = curX[j] - h * dF(curX, j);
                    TableResult[j + 1, i].Value = Math.Round(Math.Abs(X1[j]), 4);
                    TableResult[j + n + 1, i].Value = Math.Round(Math.Abs(dF(X1, j)), 4);
                }
                TableResult[j + n + 1, i].Value = Math.Round(F(X1), 4);
                j = 0;
                if (Proverka(X1) < eps) 
                    break; 
                if (i == 40) 
                    break;
            }
            label7.Text = "  " + Math.Round(F(X1), 4).ToString();
        }

        private Double Proverka(Double[] masX)
        {
            Double sumPr = 0;
            for (int i = 0; i < masX.Length; i++)
                sumPr += Math.Pow(dF(masX, i), 2);
            sumPr = Math.Abs(Math.Pow(sumPr, 0.5));
            return sumPr;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            eps = Double.Parse(textBox1.Text);
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            Variables.RowCount = (int)numericUpDown1.Value;
            TableResult.ColumnCount = 2 * (int)numericUpDown1.Value + 3;
            TableResult.RowCount = 1;
            TableResult[0, 0].Value = "Шаг";
            int j;
            for (j = 1; j < numericUpDown1.Value + 1; j++)
            {
                TableResult[j, 0].Value = "X" + j.ToString();
                TableResult[j + (int)numericUpDown1.Value, 0].Value = "dF/dX" + j.ToString();
            }
            TableResult[j + (int)numericUpDown1.Value, 0].Value = "F(X)";
            TableResult[j + (int)numericUpDown1.Value + 1, 0].Value = "h";
            for (j = 0; j < TableResult.ColumnCount; j++)
                TableResult.Columns[j].Width = 88;

        }

        private Double[] masX()
        {
            Double[] x = new Double[(int)numericUpDown1.Value];
            for (int i = 0; i < numericUpDown1.Value; i++)
                x[i] = Double.Parse(Variables[1, i].Value.ToString());
            return x;
        }

        private void Variables_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            Variables.Columns[0].Width = 88;
            Variables.Columns[1].Width = 88;
            for (int i = 0; i < Variables.RowCount; i++)
            {
                Variables[0, i].Value = "x" + (i + 1).ToString();
                Variables[1, i].Value = Convert.ToString(i + 4);
            }
        }

        private void TableResult_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
