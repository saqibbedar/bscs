using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace dashboard
{
    public partial class KidsDashboard : Form
    {
        // Process
        private Process chromeProcess = null;
        public KidsDashboard()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // show help
        }

        private void exitToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                // If Chrome is not running or was closed externally
                if (chromeProcess == null || chromeProcess.HasExited)
                {
                    // Start Chrome process
                    chromeProcess = new Process();
                    chromeProcess.StartInfo.FileName = "chrome.exe";
                    chromeProcess.StartInfo.UseShellExecute = true;
                    chromeProcess.Start();
                }
                else
                {
                    // Kill Chrome process started by this app
                    chromeProcess.Kill();
                    chromeProcess.Dispose();
                    chromeProcess = null;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error handling Chrome: " + ex.Message,
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void helpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // Help window
            MessageBox.Show("This is the Kids Dashboard. Click a button to open an application!");
        }

        private void turnOnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // start voice when user hover anything and it reads aloud
        }

        private void turnOffToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // turnoff audio
        }

        private void bannerImg_Click(object sender, EventArgs e)
        {
            // banner image
        }

        private void label1_Click(object sender, EventArgs e)
        {
            // welcome title
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // open paint
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            // Panel
        }

        private void button13_Click(object sender, EventArgs e)
        {
            // 1. Ask the user for confirmation.
            DialogResult result = MessageBox.Show(
                "Are you sure you want to shut down the computer?", // The message
                "Confirm Shutdown", // The window title
                MessageBoxButtons.YesNo, // Adds "Yes" and "No" buttons
                MessageBoxIcon.Warning // Adds a warning icon
            );

            // 2. Check if the user clicked "Yes".
            if (result == DialogResult.Yes)
            {
                // If they confirmed, then run the shutdown command.
                System.Diagnostics.Process.Start("shutdown", "/s /t 0");
            }
            // If they click "No", nothing happens.
        }

        private void button6_Click(object sender, EventArgs e)
        {
            // 1. Ask the user to confirm the action.
            DialogResult result = MessageBox.Show(
                "Are you sure you want to restart the computer?", // Message text
                "Confirm Restart", // Window title
                MessageBoxButtons.YesNo, // "Yes" and "No" buttons
                MessageBoxIcon.Warning // Warning icon
            );

            // 2. Check if the user clicked the "Yes" button.
            if (result == DialogResult.Yes)
            {
                // If confirmed, execute the restart command.
                System.Diagnostics.Process.Start("shutdown", "/r /t 0");
            }
            // If they click "No", the code does nothing.
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            // change colors
            // 1. Show the color dialog.
            DialogResult result = colorDialog1.ShowDialog();

            // 2. Check if the user clicked "OK".
            if (result == DialogResult.OK)
            {
                // 3. Set the panel's background color to the color they selected.
                panel1.BackColor = colorDialog1.Color;
            }
        }
    }
}
