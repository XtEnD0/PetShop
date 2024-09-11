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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PetShop.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    errors.AppendLine("Введите Логин");
                }

                if (string.IsNullOrEmpty(PasswordBox.Password))
                {
                    errors.AppendLine("Введите Пароль");
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }   
                if (Data.PetShopEntities.GetContext().Users
                    .Any(d => d.UserLogin == LoginTextBox.Text &&
                    d.UserPassword == PasswordBox.Password))
                {
                    var user = Data.PetShopEntities.GetContext().Users
                        .Where(d => d.UserLogin == LoginTextBox.Text 
                        && d.UserPassword == PasswordBox.Password).FirstOrDefault();
                    MessageBox.Show("Успех!", "Вы вошли в учетную запись", MessageBoxButton.OK, MessageBoxImage.Information);
                    switch (user.Role.RoleName)
                    {
                        case "Администратор":
                            Classes.Manager.MainFrame.Navigate(new Pages.Page1());
                            break;
                        case "Клиент":
                            Classes.Manager.MainFrame.Navigate(new Pages.Page1());
                            break;
                        case "Менеджер":
                            Classes.Manager.MainFrame.Navigate(new Pages.Page1());
                            break;

                    }
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
