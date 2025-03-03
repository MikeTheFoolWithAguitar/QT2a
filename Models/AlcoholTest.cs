namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AlcoholTest
    {
        [Key]
        public int AlcoholTestID { get; set; }

        public int EmployeeID { get; set; }

        [StringLength(50)]
        public string TestType { get; set; }

        public bool? Refusal { get; set; }

        [StringLength(50)]
        public string ScreenConfirm { get; set; }

        public bool Results { get; set; }

        public double? Level { get; set; }

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
