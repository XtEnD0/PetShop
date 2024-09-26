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
    /// Логика взаимодействия для EditProductPage.xaml
    /// </summary>
    public partial class EditProductPage : Page
    {

        public string FlagAddOrEdit = "default";

        public Data.Product _currentProduct = new Data.Product();

        public EditProductPage(Data.Product product)
        {
            InitializeComponent();

            if (product != null)
            {
                _currentProduct = product;
                FlagAddOrEdit = "edit";
            } else
            {
                FlagAddOrEdit = "add";
            }

            DataContext = _currentProduct;
            Init();

        }

        public void Init()
        {
            try
            {
                CategoryComboBox.ItemsSource = Data.PetShopEntities.GetContext().ProductCategory.ToList();

                if (FlagAddOrEdit == "add")
                {
                    IdTextBox.Visibility = Visibility.Hidden;
                    IdLabel.Visibility = Visibility.Hidden;

                    CategoryComboBox.SelectedItem = null;
                    CountTextBox.Text = String.Empty;
                    UnitTextBox.Text = String.Empty;
                    NameTextBox.Text = String.Empty;
                    CostTextBox.Text = String.Empty;
                    SupplierTextBox.Text = String.Empty;
                    DescriptionTextBox.Text = String.Empty;
                    ProductImage = null;


                } else if (FlagAddOrEdit == "edit")
                {
                    IdTextBox.Visibility = Visibility.Visible;
                    IdLabel.Visibility = Visibility.Visible;
                    CategoryComboBox.SelectedItem = null;
                    CountTextBox.Text = _currentProduct.ProductQuantityInStock.ToString();
                    UnitTextBox.Text = _currentProduct.Units.UnitName;
                    NameTextBox.Text = _currentProduct.ProductName.Name;
                    CostTextBox.Text = _currentProduct.ProductCost.ToString();
                    SupplierTextBox.Text = _currentProduct.ProductTrader.Trader;
                    DescriptionTextBox.Text = _currentProduct.ProductDescription;

                    IdTextBox.Text = Data.PetShopEntities.GetContext().Product.Max(d => d.ID + 1).ToString();
                    CategoryComboBox.SelectedItem = Data.PetShopEntities.GetContext().ProductCategory
                        .Where(d => d.ID == _currentProduct.ProductCategoryID).FirstOrDefault();

                }




            }
            catch (Exception)
            {

            }
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
