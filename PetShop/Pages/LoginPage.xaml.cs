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
        public int FailedAttempts = 0;

        public async void BlockButton(object sender)
        {
            Button button = sender as Button;
            if (button != null)
                button.IsEnabled = false;
            for (int i = 10; i >= 0; i--)
            {
                button.Content = $"{i}";
                await Task.Delay(1000);
                
            }
            button.Content = "ВОЙТИ";
            button.IsEnabled = true;
        }



        private Dictionary<string, string> captchaCodes = new Dictionary<string, string>
        {
            {"/Checks/captcha1.png", "b16i9"},
            {"/Checks/captcha2.png", "f456pt"},
            {"/Checks/captcha3.png", "wq987z"}
        };
        private string CurrentCaptchaCode;
        private void LoadRandomCaptcha()
        {
            Random random = new Random();
            int index = random.Next(captchaCodes.Count);
            string selectedCaptcha = new List<string>(captchaCodes.Keys)[index];
            CaptchaImage.Source = new BitmapImage(new Uri(selectedCaptcha, UriKind.Relative));
            CurrentCaptchaCode = captchaCodes[selectedCaptcha];
        }
        private void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (FailedAttempts < 2)
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
                        Classes.Manager.CurrentUser = user;
                        MessageBox.Show("Успех!", "Вы вошли в учетную запись", MessageBoxButton.OK, MessageBoxImage.Information);
                        switch (user.Role.RoleName)
                        {
                            case "Администратор":
                                Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                                break;
                            case "Клиент":
                                Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                                break;
                            case "Менеджер":
                                Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                                break;

                        }
                    }
                    else
                    {
                        FailedAttempts++;
                        MessageBox.Show("Неверный логин или пароль ", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        if (FailedAttempts > 1)
                        {
                            LoadRandomCaptcha();
                            CaptchaImage.Visibility = Visibility.Visible;
                            CaptchaInput.Visibility = Visibility.Visible;
                        }
                    }
                }
                else
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
                        d.UserPassword == PasswordBox.Password && CaptchaInput.Text == CurrentCaptchaCode))
                    {
                        var user = Data.PetShopEntities.GetContext().Users
                            .Where(d => d.UserLogin == LoginTextBox.Text
                            && d.UserPassword == PasswordBox.Password).FirstOrDefault();
                        Classes.Manager.CurrentUser = user;
                        MessageBox.Show("Успех!", "Вы вошли в учетную запись", MessageBoxButton.OK, MessageBoxImage.Information);
                        FailedAttempts = 0;
                        CaptchaImage.Visibility = Visibility.Collapsed;
                        CaptchaInput.Visibility = Visibility.Collapsed;
                        switch (user.Role.RoleName)
                        {
                            case "Администратор":
                                Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                                break;
                            case "Клиент":
                                Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                                break;
                            case "Менеджер":
                                Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                                break;

                        }
                    }
                    else
                    {
                        if (CaptchaInput.Text != CurrentCaptchaCode || !string.IsNullOrEmpty(CaptchaInput.Text))
                        {
                            MessageBox.Show("Проверка на робота провалена", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                            FailedAttempts++;
                            if (FailedAttempts > 1)
                            {
                                LoadRandomCaptcha();
                                BlockButton(LoginButton);
                            }
                        }
                        else
                        {
                            FailedAttempts++;
                            MessageBox.Show("Неверный логин или пароль ", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                            if (FailedAttempts > 1)
                            {
                                LoadRandomCaptcha();
                                BlockButton(LoginButton);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
        }
    }
}
