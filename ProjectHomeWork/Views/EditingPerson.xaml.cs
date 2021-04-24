using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для EditingPerson.xaml
    /// </summary>
    public partial class EditingPerson : Window
    {
        private Model.PersonSet person = null;
        string emailPattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
        
        public EditingPerson()
        {
            InitializeComponent();
            CbRole.ItemsSource = new List<String>() {"Клиент", "Риэлтор"};
            CbRole.SelectedIndex = 0;
        }

        public EditingPerson(Model.PersonSet person)
        {
            InitializeComponent();
            this.person = person;
            CbRole.ItemsSource = new List<String>() { "Клиент", "Риэлтор" };
            CbRole.SelectedIndex = 0;
            TbFirstName.Text = person.FirstName;
            TbLastName.Text = person.LastName;
            TbMiddleName.Text = person.MiddleName;
            NumberPhone.Text = person.Phone;
            TbEmail.Text = person.Email;
            TbDeal.Text = person.DealShare.ToString();
            if (person.Type.Equals("Риэлтор")) CbRole.SelectedIndex = 1;
            BtnAdd.Content = "Редактировать";
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (CbRole.SelectedIndex == 0)
            {
                if(NumberPhone.Text.Contains('_') && !Regex.IsMatch(TbEmail.Text, emailPattern))
                {
                    MessageBox.Show("Заполните номер телефона или email");
                    return;
                }
                if (person == null)
                {
                    Model.PersonSet person = new Model.PersonSet()
                    {
                        FirstName = TbFirstName.Text,
                        MiddleName = TbMiddleName.Text,
                        LastName = TbLastName.Text,
                        Type = CbRole.Text,
                        Phone = NumberPhone.Text,
                        Email = TbEmail.Text
                    };
                    Manager.Model.GetEntities().PersonSet.Add(person);
                }
                else
                {
                    Model.PersonSet person = Manager.Model.GetEntities().PersonSet.FirstOrDefault(n => n.Id == this.person.Id);
                    person.FirstName = TbFirstName.Text;
                    person.MiddleName = TbMiddleName.Text;
                    person.LastName = TbLastName.Text;
                    person.Type = CbRole.Text;
                    person.Phone = NumberPhone.Text;
                    person.Email = TbEmail.Text;
                    person.DealShare = 0;
                }
                Manager.Model.GetEntities().SaveChanges();
            }
            else
            {
                if (TbFirstName.Text.Length==0 || TbLastName.Text.Length==0|| TbMiddleName.Text.Length==0||TbDeal.Text.Length==0)
                {
                    MessageBox.Show("Заполните ФИО и долю");
                    return;
                }
                try { int.Parse(TbDeal.Text); } catch { MessageBox.Show("Доля должна быть числом"); return; }
                if (int.Parse(TbDeal.Text) < 0 || int.Parse(TbDeal.Text) > 100) MessageBox.Show("Доля должна от 0 до 100");
                if (person == null)
                {
                    Model.PersonSet person = new Model.PersonSet()
                    {
                        FirstName = TbFirstName.Text,
                        MiddleName = TbMiddleName.Text,
                        LastName = TbLastName.Text,
                        Type = CbRole.Text,
                        DealShare = int.Parse(TbDeal.Text)
                    };
                    Manager.Model.GetEntities().PersonSet.Add(person);
                }
                else
                {
                    Model.PersonSet person = Manager.Model.GetEntities().PersonSet.FirstOrDefault(n => n.Id == this.person.Id);
                    person.FirstName = TbFirstName.Text;
                    person.MiddleName = TbMiddleName.Text;
                    person.LastName = TbLastName.Text;
                    person.Type = CbRole.Text;
                    person.DealShare = int.Parse(TbDeal.Text);
                    person.Email = "";
                    person.Phone = "";
                }
                Manager.Model.GetEntities().SaveChanges();
            }
            if (person == null)  MessageBox.Show("Успешное добавление"); else MessageBox.Show("Успешное изменение");
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void CbRole_DropDownClosed(object sender, EventArgs e)
        {
            if(CbRole.SelectedIndex == 1)
            {         
                TbDeal.IsEnabled = true;
                NumberPhone.IsEnabled = false;
                TbEmail.IsEnabled = false;
            }
            else
            {
                TbDeal.IsEnabled = false;
                NumberPhone.IsEnabled = true;
                TbEmail.IsEnabled = true;
            }
        }
    }
}
