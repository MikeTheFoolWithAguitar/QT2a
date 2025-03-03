namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Training")]
    public partial class Training
    {

        [Key]
        public int TrainingID { get; set; }

        [StringLength(50)]
        public string TrainingType { get; set; }

        public int? EmployeeID { get; set; }

        [StringLength(30)]
        public string Status { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime Date { get; set; }

        [StringLength(50)]
        public string Location { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime Time { get; set; }

        public bool? Confirmed { get; set; }

        [StringLength(50)]
        public string Description { get; set; }

        [StringLength(50)]
        public string Notes { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }
    }
}
