using System;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab7
{

    public class YCombinatorVisualizer : Form
    {

        public static int Factorial(int n)
        {
            if (n == 0)
                return 1;
            else
                return n * Factorial(n - 1);
        }

        private PictureBox pictureBox;
        private Button visualizeButton;
        private Button reduceButton;
        private bool shouldVisualize = false;

        public YCombinatorVisualizer()
        {
            this.Text = "Y Combinator Visualizer";
            this.Size = new Size(800, 600);

            pictureBox = new PictureBox();
            pictureBox.Dock = DockStyle.Fill;

            visualizeButton = new Button();
            visualizeButton.Text = "Візуалізація графа";
            visualizeButton.Click += new EventHandler(this.OnVisualizeButtonClick);
            visualizeButton.Dock = DockStyle.Bottom;

            reduceButton = new Button();
            reduceButton.Text = "Редукція графа";
            reduceButton.Click += new EventHandler(this.OnReduceButtonClick);
            reduceButton.Dock = DockStyle.Bottom;

            this.Controls.Add(pictureBox);
            this.Controls.Add(visualizeButton);
            this.Controls.Add(reduceButton);

            this.Load += new EventHandler(this.OnLoad);
        }

        private void OnLoad(object sender, EventArgs e)
        {
            Application.Idle += new EventHandler(this.OnApplicationIdle);
        }

        private void OnApplicationIdle(object sender, EventArgs e)
        {
            if (shouldVisualize)
            {
                pictureBox.Invalidate();
                shouldVisualize = false;
            }
        }

        private void OnVisualizeButtonClick(object sender, EventArgs e)
        {
            shouldVisualize = true;
        }

        private void OnReduceButtonClick(object sender, EventArgs e)
        {
            Graphics g = pictureBox.CreateGraphics();
            g.Clear(Color.White);
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            base.OnPaint(e);

            if (shouldVisualize)
            {
                Graphics g = e.Graphics;

                // Визуалізація Y-комбінатора Каррі
                g.FillEllipse(Brushes.Black, 100, 100, 40, 40);
                g.FillEllipse(Brushes.Black, 300, 100, 40, 40);
                g.FillEllipse(Brushes.Black, 200, 200, 40, 40);
                g.FillEllipse(Brushes.Black, 200, 350, 40, 40);
                g.DrawLine(Pens.Black, 120, 120, 200, 200);
                g.DrawLine(Pens.Black, 340, 120, 200, 200);
                g.DrawLine(Pens.Black, 240, 240, 200, 350);

                shouldVisualize = false;
            }
        }

    }

    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.Run(new YCombinatorVisualizer());
        }
    }
}
