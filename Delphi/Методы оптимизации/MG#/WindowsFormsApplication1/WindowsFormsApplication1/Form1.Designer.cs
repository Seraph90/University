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
            this.dGV_S = new System.Windows.Forms.DataGridView();
            this.UD_n = new System.Windows.Forms.NumericUpDown();
            this.dGV = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.b_Solve = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.tB_e = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dGV_S)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.UD_n)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dGV)).BeginInit();
            this.SuspendLayout();
            // 
            // dGV_S
            // 
            this.dGV_S.CausesValidation = false;
            this.dGV_S.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dGV_S.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column3,
            this.Column4,
            this.Column5,
            this.Column6});
            this.dGV_S.Location = new System.Drawing.Point(185, 12);
            this.dGV_S.Name = "dGV_S";
            this.dGV_S.RowHeadersVisible = false;
            this.dGV_S.Size = new System.Drawing.Size(314, 391);
            this.dGV_S.TabIndex = 22;
            this.dGV_S.RowsAdded += new System.Windows.Forms.DataGridViewRowsAddedEventHandler(this.dGV_S_RowsAdded);
            // 
            // UD_n
            // 
            this.UD_n.Location = new System.Drawing.Point(13, 81);
            this.UD_n.Margin = new System.Windows.Forms.Padding(4);
            this.UD_n.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.UD_n.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.UD_n.Name = "UD_n";
            this.UD_n.Size = new System.Drawing.Size(165, 20);
            this.UD_n.TabIndex = 20;
            this.UD_n.Value = new decimal(new int[] {
            2,
            0,
            0,
            0});
            this.UD_n.ValueChanged += new System.EventHandler(this.UD_n_ValueChanged);
            // 
            // dGV
            // 
            this.dGV.AllowUserToAddRows = false;
            this.dGV.AllowUserToDeleteRows = false;
            this.dGV.AllowUserToResizeColumns = false;
            this.dGV.AllowUserToResizeRows = false;
            this.dGV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dGV.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2});
            this.dGV.Location = new System.Drawing.Point(13, 109);
            this.dGV.Margin = new System.Windows.Forms.Padding(4);
            this.dGV.Name = "dGV";
            this.dGV.RowHeadersVisible = false;
            this.dGV.Size = new System.Drawing.Size(165, 261);
            this.dGV.TabIndex = 18;
            // 
            // Column1
            // 
            this.Column1.HeaderText = "X";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Width = 64;
            // 
            // Column2
            // 
            this.Column2.HeaderText = "=";
            this.Column2.Name = "Column2";
            this.Column2.Width = 64;
            // 
            // b_Solve
            // 
            this.b_Solve.Location = new System.Drawing.Point(12, 377);
            this.b_Solve.Name = "b_Solve";
            this.b_Solve.Size = new System.Drawing.Size(166, 26);
            this.b_Solve.TabIndex = 21;
            this.b_Solve.Text = "Решить";
            this.b_Solve.UseVisualStyleBackColor = true;
            this.b_Solve.Click += new System.EventHandler(this.b_Solve_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label6.Location = new System.Drawing.Point(13, 57);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(22, 20);
            this.label6.TabIndex = 19;
            this.label6.Text = "n:";
            // 
            // tB_e
            // 
            this.tB_e.Location = new System.Drawing.Point(13, 33);
            this.tB_e.Margin = new System.Windows.Forms.Padding(4);
            this.tB_e.Name = "tB_e";
            this.tB_e.Size = new System.Drawing.Size(165, 20);
            this.tB_e.TabIndex = 17;
            this.tB_e.Text = "0,001";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(13, 9);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(22, 20);
            this.label2.TabIndex = 16;
            this.label2.Text = "e:";
            // 
            // Column3
            // 
            this.Column3.HeaderText = "i";
            this.Column3.Name = "Column3";
            this.Column3.Width = 23;
            // 
            // Column4
            // 
            this.Column4.HeaderText = "x1";
            this.Column4.Name = "Column4";
            this.Column4.Width = 70;
            // 
            // Column5
            // 
            this.Column5.HeaderText = "x2";
            this.Column5.Name = "Column5";
            this.Column5.Width = 70;
            // 
            // Column6
            // 
            this.Column6.HeaderText = "F(x...)";
            this.Column6.Name = "Column6";
            this.Column6.Width = 70;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(505, 409);
            this.Controls.Add(this.dGV_S);
            this.Controls.Add(this.UD_n);
            this.Controls.Add(this.dGV);
            this.Controls.Add(this.b_Solve);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.tB_e);
            this.Controls.Add(this.label2);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dGV_S)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.UD_n)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dGV)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dGV_S;
        private System.Windows.Forms.NumericUpDown UD_n;
        private System.Windows.Forms.DataGridView dGV;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.Button b_Solve;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox tB_e;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column6;
    }
}

