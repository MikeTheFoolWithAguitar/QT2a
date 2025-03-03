namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DrugTestResult
    {
        [Key]
        public int DrugTestID { get; set; }

        public int? LabID { get; set; }

        public int? MROID { get; set; }

        public int? CollectionSiteID { get; set; }

        public int EmployeeID { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? RandomDate { get; set; }

        public bool? BlindSample { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? EmpInformed { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? CollectionDate { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? TestTime { get; set; }

        public bool? MROResults { get; set; }

        public bool? Refusal { get; set; }

        [StringLength(50)]
        public string Comments { get; set; }

        [StringLength(50)]
        public string Disposition { get; set; }

        public int? DrugTestTypeID { get; set; }

        public int? SpecimanIDNo { get; set; }

        public bool? Rejected { get; set; }

        [Column("PositiveDrugType1")]
        public int? DrugTypeID { get; set; }
        
        // HERE - not linked yet
        public int? PositiveDrugType2 { get; set; }

        public int? Billed { get; set; }

        public int? CompId { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        // navigation
        public virtual Employee Employee { get; set; }
        public virtual CollectionSite CollectionSite { get; set; }
        public virtual DrugTestType DrugTestType { get; set; }
        public virtual DrugType DrugType { get; set; }
        public virtual Laboratory Laboratory { get; set; }
        public virtual MedicalReviewOfficer MedicalReviewOfficer { get; set; }

    }
}
