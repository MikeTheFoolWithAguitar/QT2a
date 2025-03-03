namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Document
    {
        [Key]
        public int DocID { get; set; }

        public int? EmployeeID { get; set; }

        public int? CompanyID { get; set; }

        [Required]
        public int DocTypeID { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? ExpirationDate { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? DateCreated { get; set; }

        [StringLength(50)]
        public string FileName { get; set; }

        [StringLength(50)]
        public string Notes { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? DateReviewed { get; set; }

        [StringLength(100)]
        public string Location { get; set; }

        [Required,StringLength(5)]
        public string Status { get; set; }

        [StringLength(5)]
        public string DocFormat { get; set; }

        [StringLength(50)]
        public string Reviewer { get; set; }

        public bool? Completed { get; set; }

        public int? DocOrder { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        // navigation
        public virtual Employee Employee { get; set; }
        public virtual DocType DocType { get; set; }
        public virtual DocStatus DocStatus { get; set; }
    }
}
