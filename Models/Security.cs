namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Security
    {
        [Key]
        [StringLength(50)]
        public string UserName { get; set; }

        public int CompID { get; set; }
        
        public int? ProgID { get; set; }

        [StringLength(50)]
        public string FName { get; set; }

        [StringLength(50)]
        public string LName { get; set; }

        //[StringLength(50)]
        //public string Password { get; set; }

       // public int? AccessLevel { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        // navigation
        public virtual Company Company { get; set; }
        public virtual Program Program { get; set; }
    }
}
