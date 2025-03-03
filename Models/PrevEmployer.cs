namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PrevEmployer
    {
        [Key]
        public int PrevEmpID { get; set; }

        public int? CompID { get; set; }

        public int? EmployeeID { get; set; }

        //[StringLength(50)]
        //public string HireDate { get; set; }
        public DateTime? HireDate { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? TerminationDate { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }
    
        // navigation
        public virtual Employee Employee { get; set; }
        public virtual Company Company { get; set; }
    }
}
