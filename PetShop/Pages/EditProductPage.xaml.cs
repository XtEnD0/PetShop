using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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

                    BitmapImage img = new BitmapImage();
                    img.BeginInit();
                    img.UriSource = new Uri("pack://application:,,,/Resources/picrure.png");
                    img.EndInit();

                    ProductImage.Source = img;

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
            catch (Exception ex)
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
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(NameTextBox.Text))
                {
                    errors.AppendLine("Заполните Наименование");
                }
                if (CategoryComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите категорию");
                }
                if (string.IsNullOrEmpty(CountTextBox.Text))
                {
                    errors.AppendLine("Заполните количество");
                }else
                {
                    var tryQuantity = Int32.TryParse(CountTextBox.Text, out var resultQuantity);
                    if (!tryQuantity)
                    {
                        errors.AppendLine("Количество - Целое число");
                    }
                }
                if (string.IsNullOrEmpty(UnitTextBox.Text))
                {
                    errors.AppendLine("Заполните ед.измерения");
                }
                if (string.IsNullOrEmpty(SupplierTextBox.Text))
                {
                    errors.AppendLine("Заполните Поставщика");
                }
                if (string.IsNullOrEmpty(CostTextBox.Text))
                {
                    errors.AppendLine("Заполните стоимость");

                }
                else
                {
                    var tryCost = Decimal.TryParse(CostTextBox.Text, out var resultCost);
                    if (!tryCost)
                    {
                        errors.AppendLine("Стоимость - дробное число");

                    }
                    else
                    {
                        string[] coststr = CostTextBox.Text.Split(',');
                        if (coststr.Length !=2 || coststr[1].Length != 2)
                        {
                            errors.AppendLine("должно быть два символа после запятой");
                        }
                       
                        //2 знака после запятой
                    }
                    if (tryCost && resultCost < 0)
                    {
                        errors.AppendLine("Стоимость не может быть отрицательной");
                    }
                }
                if (string.IsNullOrEmpty(DescriptionTextBox.Text))
                {
                    errors.AppendLine("Заполните описание");
                }
                //обработка фото + ограничение 300х200 пикселей
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            try
            {
                var selectedCategory = CategoryComboBox.SelectedItem as Data.ProductCategory;
                _currentProduct.ProductCategoryID = Data.PetShopEntities.GetContext().ProductCategory.Where(d => d.ID == selectedCategory.ID).FirstOrDefault().ID;
                _currentProduct.ProductQuantityInStock = Convert.ToInt32(CountTextBox.Text);
                _currentProduct.ProductCost = Convert.ToDecimal(CostTextBox.Text);
                _currentProduct.ProductDescription = DescriptionTextBox.Text;
                //image
                var list = Data.PetShopEntities.GetContext().Product.ToList();
                foreach (var item in list)
                {
                    string path = Directory.GetCurrentDirectory() + @"\img\" + item.PhotoName;
                    if (File.Exists(path))
                    {
                        item.ProductImage = File.ReadAllBytes(path);
                    }
                }
                //unit
                var searchUnit = (from item in Data.PetShopEntities.GetContext().Units
                                  where item.UnitName == UnitTextBox.Text
                                  select item).FirstOrDefault();
                if (searchUnit != null)
                {
                    _currentProduct.UnitID = searchUnit.ID;

                }
                else
                {
                    Data.Units units = new Data.Units()
                    {
                        UnitName = UnitTextBox.Text
                    };
                    Data.PetShopEntities.GetContext().Units.Add(units);
                    Data.PetShopEntities.GetContext().SaveChanges();
                    _currentProduct.UnitID = units.ID;
                }
                //наименование
                _currentProduct.ProductName.Name = NameTextBox.Text;
                //поставщик
                _currentProduct.ProductTrader.Trader = SupplierTextBox.Text;


                if (FlagAddOrEdit == "add")
                {
                    Data.PetShopEntities.GetContext().Product.Add(_currentProduct);
                    Data.PetShopEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно добавлено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

                }
                else if (FlagAddOrEdit == "edit")
                {
                    Data.PetShopEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно сохранено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        
        private void ProductImage_MouseDown(object sender, MouseButtonEventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Filter = "Image Files(*.PNG;*.JPG)|*.PNG;*.JPG";
            if (dlg.ShowDialog() == true)
            {
                if (File.Exists(dlg.FileName))
                {
                    BitmapImage img = new BitmapImage();
                    img.BeginInit();
                    img.UriSource = new Uri(dlg.FileName);
                    img.EndInit();
                    if (img.Width > 301 || img.Height > 201)
                    {
                        MessageBox.Show("Размер изображения не должен превышать 300x200 пикселей", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }

                    ProductImage.Source = img;
                }
            }

        }


    }
}
