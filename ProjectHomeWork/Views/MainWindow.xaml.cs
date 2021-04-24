using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ProjectHomeWork.Views
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public string Type = "Клиент";
        public MainWindow()
        {
            InitializeComponent();
            this.WindowState = WindowState.Maximized;
            Dg.ItemsSource = Manager.Model.GetEntities().PersonSet.Where(n=> n.Type== "Клиент").ToList();
        }

        private void Deleted_Click(object sender, RoutedEventArgs e)
        {
            Model.PersonSet person = ((Model.PersonSet)Dg.SelectedItem);
            int supply = Manager.Model.GetEntities().SupplySet.Where(n => n.PersonSet.Id == person.Id || n.PersonSet1.Id == person.Id).ToList().Count;
            int demmand = Manager.Model.GetEntities().DemandSet.Where(n => n.PersonSet.Id == person.Id || n.PersonSet1.Id == person.Id).ToList().Count;
            if(supply == 0 && demmand == 0)
            {
                Manager.Model.GetEntities().PersonSet.Remove(person);
                Manager.Model.GetEntities().SaveChanges();
                MessageBox.Show("Удаление прошло успешно");
            }
            else
            {
                MessageBox.Show("Удаление не удалось");
            }
            Dg.ItemsSource = Manager.Model.GetEntities().PersonSet.Where(n => n.Type == Type).ToList();
        }

        private void Editing_Click(object sender, RoutedEventArgs e)
        {
            if (Dg.SelectedItem != null)
            {
                try
                {
                    new Views.EditingPerson((Model.PersonSet)Dg.SelectedItem).ShowDialog();
                    Dg.ItemsSource = Manager.Model.GetEntities().PersonSet.Where(n => n.Type == Type).ToList();
                }
                catch (System.InvalidCastException ex)
                {
                    MessageBox.Show("Ошибка");
                }
            }
        }

        private void Adding_Click(object sender, RoutedEventArgs e)
        {
            new Views.EditingPerson().ShowDialog();
            Dg.ItemsSource = Manager.Model.GetEntities().PersonSet.Where(n => n.Type == Type).ToList();
        }
        private void Rieltor_Checked(object sender, RoutedEventArgs e)
        {
            Type = "Риэлтор";
            Dg.ItemsSource = Manager.Model.GetEntities().PersonSet.Where(n => n.Type == Type).ToList();
            Dale.Visibility = Visibility.Visible;
            Mail.Visibility = Visibility.Hidden;
            Phone.Visibility = Visibility.Hidden;
        }

        private void Client_Checked(object sender, RoutedEventArgs e)
        {        
            Type = "Клиент";
            Dg.ItemsSource = Manager.Model.GetEntities().PersonSet.Where(n => n.Type == Type).ToList();
            Dale.Visibility = Visibility.Hidden;
            Mail.Visibility = Visibility.Visible;
            Phone.Visibility = Visibility.Visible;
        }
    }
}
