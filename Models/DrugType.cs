namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DrugType
    {
        [Key]
        public int DrugTypeID { get; set; }

        [StringLength(50)]
        public string Description { get; set; }

        // navigation
        public virtual ICollection<DrugTestResult> DrugTestResult { get; set; }
    }
}
