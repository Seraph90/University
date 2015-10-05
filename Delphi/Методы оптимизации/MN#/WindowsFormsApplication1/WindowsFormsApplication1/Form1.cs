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
        Double e;
        public Form1()
        {
            InitializeComponent();
            e = Double.Parse(tB_e.Text);
        }

        private Double F(Double x, Double y)
        {
            return (x * x / 4 + y * y / 36);
        }

        private Double dF(Double x, Double y, int i)
        {
            Double dd = e / 100;
            Double newX = x, newY = y;
            if (i == 1)
                newX = x + dd;
            else
                newY = y + dd;
            return (F(newX, newY) - F(x, y)) / dd;
        }

        private Double dF2(Double x, Double y, int i)
        {
            Double dx, dy;
            if (i == 1)
            {
                dx = e / 100;
                dy = 0;
            }
            else
            {
                dx = 0;
                dy = e / 100;
            }
            return (F(x + dx, y + dy) - 2 * F(x, y) + F(x - dx, y - dy)) / ((dx + dy) * (dx + dy));
        }

        public Double d2F(Double x, Double y, int i)
        {
            Double dx = e / 100;
            Double dy = e / 100;
            Double b = x;
            if (i == 2)
            {
                x = y;
                y = b;
            }
            return (F(x + dx, y + dy) - F(x + dx, y - dy) - F(x - dx, y + dy) + F(x - dx, y - dy)) / (4 * dx * dy);
        }

        private void b_Solve_Click(object sender, EventArgs e)
        {
            Double[] prF = new Double[2];
            Double x = Double.Parse(tB_x.Text), y = Double.Parse(tB_y.Text);
            Double nx = 0, ny = 0;
            Double h11, h12, h21, h22, h11_, h12_, h21_, h22_;
            String log = "";
            int j = 0;
            while (true)
            {
                j++;
                log += "Итерация:" + j.ToString() + Environment.NewLine;
                log += "X=(" + Math.Round(x, 3) + "," + Math.Round(y, 3) + ")" + Environment.NewLine;
                log += "Значение функции: " + Math.Round(F(x, y), 5) + Environment.NewLine;

                h11 = Math.Round(dF2(x, y, 1), 5);
                h12 = Math.Round(d2F(x, y, 1), 5);
                h21 = Math.Round(d2F(x, y, 2), 5);
                h22 = Math.Round(dF2(x, y, 2), 5);

                log += "H:" + Environment.NewLine;
                log += "| " + h11 + "     " + h12 + " |" + Environment.NewLine;
                log += "| " + h21 + "     " + h22 + " |" + Environment.NewLine + Environment.NewLine;

                if ((h11 * h22 - h12 * h21) == 0)
                {
                    MessageBox.Show("Определитель равен нулю");
                }

                h11_ = Math.Round(h22 / (h11 * h22 - h12 * h21), 5);
                h12_ = Math.Round(-h12 / (h11 * h22 - h12 * h21), 5);
                h21_ = Math.Round(-h21 / (h11 * h22 - h12 * h21), 5);
                h22_ = Math.Round(h11 / (h11 * h22 - h12 * h21), 5);
                log += "H^(-1)" + Environment.NewLine;
                log += "| " + h11_ + "     " + h12_ + " |" + Environment.NewLine;
                log += "| " + h21_ + "     " + h22_ + " |" + Environment.NewLine + Environment.NewLine;
                log += "Grad:" + Environment.NewLine;
                /*
                for (int i = 0; i < X0.Length; i++)
                {

                    prF[i] = dF(X0, i);
                    log += Math.Round(prF[i], 3);
                    if (i != X0.Length - 1) { log += Environment.NewLine; }
                }
                */
                prF[0] = dF(x, y, 1);
                log += Math.Round(prF[0], 3);
                log += Environment.NewLine;
                prF[1] = dF(x, y, 2);
                log += Math.Round(prF[1], 3);
                
                log += Environment.NewLine + Environment.NewLine;
                log += "X1:" + Environment.NewLine;
                nx = x - (h11_ * prF[0] + h12_ * prF[1]);
                ny = y - (h21_ * prF[0] + h22_ * prF[1]);
                log += Math.Round(nx, 5) + Environment.NewLine;
                log += Math.Round(ny, 5) + Environment.NewLine;
                log += "т. X=(" + Math.Round(nx, 3) + "," + Math.Round(ny, 3) + ")" + Environment.NewLine;
                log += "Значение функции: " + Math.Round(F(nx, ny), 5) + Environment.NewLine;

                if (Math.Abs(F(x, y) - F(nx, ny)) < Convert.ToDouble(tB_e.Text))
                {
                    break;
                }
                x = nx;
                y = ny;
            }
            richTextBox1.Text = log;
        }
    }
}
