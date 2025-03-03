namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CollectionSite
    {
        //public CollectionSite()
        //{
        //    DrugTestResults = new HashSet<DrugTestResult>();
        //}

        [Key]
        public int CollectionSiteID { get; set; }

        [StringLength(50)]
        public string CollName { get; set; }

        // Address
        [StringLength(50)]
        public string Address1 { get; set; }

        [StringLength(50)]
        public string City1 { get; set; }

        [StringLength(2)]
        public string State1 { get; set; }

        [StringLength(20)]
        public string ZipCode1 { get; set; }

        // Contact
        [StringLength(50)]
        public string ContactFName { get; set; }

        [StringLength(50)]
        public string ContactLName { get; set; }

        [StringLength(50)]
        public string ContactTitle { get; set; }

        [StringLength(20)]
        public string PhoneNo1 { get; set; }

        [StringLength(20)]
        public string PhoneNo2 { get; set; }

        [StringLength(20)]
        public string PhoneNo3 { get; set; }

        [StringLength(20)]
        public string Fax { get; set; }

        [StringLength(50)]
        public string EMail { get; set; }

        [StringLength(255)]
        public string Terms { get; set; }

        public bool? Misc { get; set; }

        public DateTime? DateInput { get; set; }

        [StringLength(50)]
        public string MedicalExaminerFName { get; set; }

        [StringLength(50)]
        public string MedicalExaminerLName { get; set; }

        [StringLength(50)]
        public string MedicalExaminerTitle { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        // navigation / foreign key
        public virtual ICollection<DrugTestResult> DrugTestResults { get; set; }
    }
}
