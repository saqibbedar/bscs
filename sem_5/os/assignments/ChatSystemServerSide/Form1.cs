using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Windows.Forms;

namespace ChatSystemServerSide
{
    public partial class Form1 : Form
    {

        private TcpListener _listener;
        private TcpClient _client;
        private StreamReader _reader;
        private StreamWriter _writer;
        private const int PORT = 8888;

        public Form1()
        {
            InitializeComponent();
        }


        // input output field for IP Address
        private  void textBox1_TextChanged(object sender, EventArgs e)
        {
          
        }


        private void textBox2_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            textBox1.Text = GetLocalIPAddress(); // Your 'txtIp'
            ResetControls();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            // Ensure cleanup on form close
            CleanupConnection();
        }


        // for typing new messages
        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            
        }

        // Listen Button (Server)
        private async void button1_Click(object sender, EventArgs e)
        {
            try
            {
                _listener = new TcpListener(IPAddress.Any, PORT);
                _listener.Start();

                SetControlsForConnecting(isListening: true);
                Log("Server started. Waiting for connection...");

                // Asynchronously wait for a client
                _client = await _listener.AcceptTcpClientAsync();

                // If we're here, a client connected.
                HandleConnectionEstablished();
            }
            catch (Exception ex)
            {
                Log($"Error starting listener: {ex.Message}");
                CleanupConnection(); // Reset if it fails
            }
        }

        private void HandleConnectionEstablished()
        {
            Log("Connection established!");

            // Get streams
            NetworkStream stream = _client.GetStream();
            _reader = new StreamReader(stream);
            _writer = new StreamWriter(stream) { AutoFlush = true };

            // Enable chat controls (needs to be thread-safe)
            if (this.InvokeRequired)
            {
                this.Invoke(new Action(() =>
                {
                    button4.Enabled = true; // Send
                    textBox3.Enabled = true; // Message
                }));
            }
            else
            {
                button4.Enabled = true; // Send
                textBox3.Enabled = true; // Message
            }

            // Start a background task to listen for messages
            ListenForMessagesAsync();
        }

        private async void ListenForMessagesAsync()
        {
            try
            {
                while (_client?.Connected == true)
                {
                    string message = await _reader.ReadLineAsync();
                    if (message == null) break; // Other side disconnected
                    Log($"Peer: {message}");
                }
            }
            catch (Exception ex)
            {
                Log($"Connection error: {ex.Message}");
            }
            finally
            {
                Log("Peer has disconnected.");
                CleanupConnection();
            }
        }

        // ------------------------------------
        // HELPER/UTILITY METHODS
        // ------------------------------------

        private void CleanupConnection()
        {
            if (this.InvokeRequired)
            {
                this.Invoke(new Action(CleanupConnection));
                return;
            }

            _writer?.Close();
            _reader?.Close();
            _client?.Close();
            _listener?.Stop();
            ResetControls();
        }

        private void ResetControls()
        {
            // Set UI to the initial, idle state
            button1.Enabled = true;  // Listen
            button2.Enabled = true;  // Connect
            button3.Enabled = false; // Disconnect
            button4.Enabled = false; // Send
            textBox3.Enabled = false; // Message
            textBox1.ReadOnly = false; // IP
        }

        private void SetControlsForConnecting(bool isListening)
        {
            // Set UI to the "trying to connect" state
            button1.Enabled = false; // Listen
            button2.Enabled = false; // Connect
            button3.Enabled = true;  // Disconnect
            textBox1.ReadOnly = !isListening; // IP
        }

        private void Log(string message)
        {
            // Thread-safe method to update the chat box (textBox2)
            if (textBox2.InvokeRequired) // Your 'txtChat'
            {
                textBox2.Invoke(new Action(() => Log(message)));
            }
            else
            {
                textBox2.AppendText(message + Environment.NewLine); // Your 'txtChat'
            }
        }

        private string GetLocalIPAddress()
        {
            try
            {
                var host = Dns.GetHostEntry(Dns.GetHostName());
                foreach (var ip in host.AddressList)
                {
                    if (ip.AddressFamily == AddressFamily.InterNetwork)
                    {
                        return ip.ToString();
                    }
                }
            }
            catch (Exception) { /* Fallback */ }
            return "127.0.0.1";
        }

        // Connect (client)
        private async void button2_Click(object sender, EventArgs e)
        {
            string ipAddress = textBox1.Text; // Your 'txtIp'
            if (string.IsNullOrEmpty(ipAddress))
            {
                MessageBox.Show("Please enter an IP address to connect to.");
                return;
            }

            try
            {
                _client = new TcpClient();
                SetControlsForConnecting(isListening: false);
                Log($"Connecting to {ipAddress}:{PORT}...");

                // Asynchronously connect to the server
                await _client.ConnectAsync(ipAddress, PORT);

                // If we're here, we connected.
                HandleConnectionEstablished();
            }
            catch (Exception ex)
            {
                Log($"Error connecting: {ex.Message}");
                CleanupConnection(); // Reset if it fails
            }
        }


        // Disconnect
        private async void button3_Click(object sender, EventArgs e)
        {
            Log("Disconnecting...");
            CleanupConnection();
        }


        // send message button
        private async void button4_Click(object sender, EventArgs e)
        {
            string message = textBox3.Text; // Your 'txtMessage'
            if (string.IsNullOrEmpty(message) || _writer == null) return;

            try
            {
                // Send the message
                await _writer.WriteLineAsync(message);
                Log($"Me: {message}");
                textBox3.Clear(); // Your 'txtMessage'
            }
            catch (Exception ex)
            {
                Log($"Error sending message: {ex.Message}");
            }
        }
    }
}
