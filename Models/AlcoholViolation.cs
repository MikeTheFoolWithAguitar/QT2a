namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AlcoholViolation
    {
        [Key]
        public int AlcoholViolationID { get; set; }

        [StringLength(50)]
        public string ViolationType { get; set; }

        public int EmployeeID { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? TestDate { get; set; }

        [StringLength(255)]
        public string TestLocation { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? TestTime { get; set; }

        [StringLength(50)]
        public string Disposition { get; set; }

        public bool? StatusReinst { get; set; }
    
        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        // navigation
        public virtual Employee Employee { get; set; }
    }
}
