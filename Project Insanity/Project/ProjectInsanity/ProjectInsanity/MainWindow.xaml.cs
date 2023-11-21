using System.Windows;

namespace ProjectInsanity
{
    public partial class MainWindow : Window
    {
        bool running = false;

        public MainWindow()
        {
            InitializeComponent();

        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            if (running)
            {
                tbHello.Text = "Stopped";
                btnRun.Content = "Run";
            }
            else
            {
                tbHello.Text = "Running";
                btnRun.Content = "Stop";
            }

            running = !running;

        }
    }
}
