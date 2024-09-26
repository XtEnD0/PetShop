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
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public ProductPage()
        {
            InitializeComponent();

            Init();
        }

        public void Init()
        {
            try
            {
                ProductsListView.ItemsSource = Data.PetShopEntities.GetContext().Product.ToList();

                var manufacturerList = Data.PetShopEntities.GetContext().ProductManufacturer.ToList();
                manufacturerList.Insert(0, new Data.ProductManufacturer { Manufacturer = "Все производители" });
                ManufacturerComboBox.ItemsSource = manufacturerList;
                ManufacturerComboBox.SelectedIndex = 0;

                if (Classes.Manager.CurrentUser != null)
                {
                    FIOLabel.Visibility = Visibility.Visible;
                    FIOLabel.Content = $"{Classes.Manager.CurrentUser.UserSurname} " +
                        $"{Classes.Manager.CurrentUser.UserName} " +
                        $"{Classes.Manager.CurrentUser.UserPatronymic}";
                }
                else
                {
                    FIOLabel.Visibility = Visibility.Hidden;
                }
                CountOfLabel.Content = $"{Data.PetShopEntities.GetContext().Product.Count()}/" +
                    $"{Data.PetShopEntities.GetContext().Product.Count()}";

            }
            catch(Exception)
            {

            }
        }

        public List<Data.Product> _products = Data.PetShopEntities.GetContext().Product.ToList();
        public void Update()
        {
            try
            {
                _products = Data.PetShopEntities.GetContext().Product.ToList();

                if (!string.IsNullOrEmpty(SearchTextBox.Text))
                {
                    _products = (from item in Data.PetShopEntities.GetContext().Product
                                 where item.ProductName.Name.ToLower().Contains(SearchTextBox.Text.ToLower()) ||
                                 item.ProductDescription.ToLower().Contains(SearchTextBox.Text.ToLower()) ||
                                 item.ProductManufacturer.Manufacturer.ToLower().Contains(SearchTextBox.Text.ToLower()) ||
                                 item.ProductCost.ToString().ToLower().Contains(SearchTextBox.Text.ToLower()) ||
                                 item.ProductQuantityInStock.ToString().ToLower().Contains(SearchTextBox.Text.ToLower())
                                 select item).ToList();
                }
                if (SortUpRadioButton.IsChecked == true)
                {
                    _products = _products.OrderBy(d => d.ProductCost).ToList();
                }
                if (SortDownRadioButton.IsChecked == true)
                {
                    _products = _products.OrderByDescending(d => d.ProductCost).ToList();
                }
                var selected = ManufacturerComboBox.SelectedItem as Data.ProductManufacturer;
                if (selected != null && selected.Manufacturer != "Все производители")
                {
                    _products = _products.Where(d => d.ProductManufactureID == selected.ID).ToList();
                }
                CountOfLabel.Content = $"{_products.Count}/" +
                    $"{Data.PetShopEntities.GetContext().Product.Count()}";

                ProductsListView.ItemsSource = _products;
            }
            catch (Exception)
            {

            }
        }
        private void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void SortDownRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
        }

        private void SortUpRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            Update();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                if(Classes.Manager.CurrentUser != null)
                {
                    Classes.Manager.CurrentUser = null;
                }
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.EditProductPage((sender as Button).DataContext as Data.Product));
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.EditProductPage(null));
        }
    }
}
