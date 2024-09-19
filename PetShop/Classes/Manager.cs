using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace PetShop.Classes
{
    public static class Manager
    {
        public static Frame MainFrame { get; set; }
        public static Data.Users CurrentUser { get; set; }
        public static void GetImageData()
        {
            var list = Data.PetShopEntities.GetContext().Product.ToList();
            foreach (var item in list)
            {
                string path = Directory.GetCurrentDirectory() + @"\img\" + item.PhotoName;
                if (File.Exists(path))
                {
                    item.ProductImage = File.ReadAllBytes(path);
                }
                Data.PetShopEntities.GetContext().SaveChanges();
            }
        }
    }
}
