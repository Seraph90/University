namespace WindowsFormsApplication1
{
    partial class Form1
    {
        /// <summary>
        /// Требуется переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Обязательный метод для поддержки конструктора - не изменяйте
        /// содержимое данного метода при помощи редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.tB_e = new System.Windows.Forms.TextBox();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tB_x = new System.Windows.Forms.TextBox();
            this.tB_y = new System.Windows.Forms.TextBox();
            this.b_Solve = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // tB_e
            // 
            this.tB_e.Location = new System.Drawing.Point(12, 64);
            this.tB_e.Name = "tB_e";
            this.tB_e.Size = new System.Drawing.Size(100, 20);
            this.tB_e.TabIndex = 1;
            this.tB_e.Text = "0,01";
            // 
            // richTextBox1
            // 
            this.richTextBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.richTextBox1.Location = new System.Drawing.Point(118, 9);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(301, 312);
            this.richTextBox1.TabIndex = 7;
            this.richTextBox1.Text = "";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 9);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(13, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "f:";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(12, 25);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 20);
            this.textBox2.TabIndex = 9;
            this.textBox2.Text = "x*x/4 + y*y/36";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(16, 13);
            this.label2.TabIndex = 11;
            this.label2.Text = "e:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 217);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(15, 13);
            this.label3.TabIndex = 12;
            this.label3.Text = "x:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 256);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(15, 13);
            this.label1.TabIndex = 13;
            this.label1.Text = "y:";
            // 
            // tB_x
            // 
            this.tB_x.Location = new System.Drawing.Point(12, 233);
            this.tB_x.Name = "tB_x";
            this.tB_x.Size = new System.Drawing.Size(100, 20);
            this.tB_x.TabIndex = 14;
            this.tB_x.Text = "1";
            // 
            // tB_y
            // 
            this.tB_y.Location = new System.Drawing.Point(12, 272);
            this.tB_y.Name = "tB_y";
            this.tB_y.Size = new System.Drawing.Size(100, 20);
            this.tB_y.TabIndex = 15;
            this.tB_y.Text = "1";
            // 
            // b_Solve
            // 
            this.b_Solve.Location = new System.Drawing.Point(12, 298);
            this.b_Solve.Name = "b_Solve";
            this.b_Solve.Size = new System.Drawing.Size(100, 23);
            this.b_Solve.TabIndex = 16;
            this.b_Solve.Text = "Выполнить";
            this.b_Solve.UseVisualStyleBackColor = true;
            this.b_Solve.Click += new System.EventHandler(this.b_Solve_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(429, 331);
            this.Controls.Add(this.b_Solve);
            this.Controls.Add(this.tB_y);
            this.Controls.Add(this.tB_x);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tB_e);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.richTextBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tB_e;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tB_x;
        private System.Windows.Forms.TextBox tB_y;
        private System.Windows.Forms.Button b_Solve;
    }
}

