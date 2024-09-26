//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PetShop.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.OrderProduct = new HashSet<OrderProduct>();
        }
    
        public int ID { get; set; }
        public string ProductArticle { get; set; }
        public Nullable<int> ProductNameID { get; set; }
        public Nullable<decimal> ProductCost { get; set; }
        public Nullable<int> ProductDiscountAvailable { get; set; }
        public Nullable<int> ProductManufactureID { get; set; }
        public Nullable<int> ProductTraderID { get; set; }
        public Nullable<int> ProductCategoryID { get; set; }
        public Nullable<int> ProductDiscount { get; set; }
        public Nullable<int> ProductQuantityInStock { get; set; }
        public Nullable<int> UnitID { get; set; }
        public string ProductDescription { get; set; }
        public string PhotoName { get; set; }
        public byte[] ProductImage { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderProduct> OrderProduct { get; set; }
        public virtual ProductCategory ProductCategory { get; set; }
        public virtual ProductManufacturer ProductManufacturer { get; set; }
        public virtual ProductName ProductName { get; set; }
        public virtual ProductTrader ProductTrader { get; set; }
        public virtual Units Units { get; set; }
    }
}
