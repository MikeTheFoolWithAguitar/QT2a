// This was removed 1/31/15 by Mike. We are not going to track these.
// We are just keeping this info in the individual tables
//namespace WingtipToys.Models
//{
//    using System;
//    using System.Collections.Generic;
//    using System.ComponentModel.DataAnnotations;
//    using System.ComponentModel.DataAnnotations.Schema;
//    using System.Data.Entity.Spatial;

//    [Table("Address")]
//    public partial class Address
//    {
//        [Key]
//        public int AddressID { get; set; }

//        public int AddressType { get; set; }

//        // These are the foreign keys. One for each of the address types
//        public int CompanyID { get; set; }
//        public int LocationID { get; set; }
//        public int MROID { get; set; }
//        public int ProgramID { get; set; }
//        public int ProspectID { get; set; }
//        public int LaboratoryID { get; set; }
//        public int EmployeeID { get; set; }
//        public int AccidentID { get; set; }
//        [ForeignKey("CollectionSite")]
//        public int CollectionSiteID { get; set; }
//        // Navigation Properties / Foreign Keys
//        public virtual Company Company { get; set; }
//        public virtual Location Location { get; set; }
//        public virtual MedicalReviewOfficer MedicalReviewOfficer { get; set; }
//        public virtual Program Program { get; set; }
//        public virtual zREMOVEDFROMWEBSITE013115Prospect Prosepect { get; set; }
//        public virtual Laboratory Laboratory { get; set; }
//        public virtual Employee Employee { get; set; }
//        public virtual Accident Accident { get; set; }
//        public virtual CollectionSite CollectionSite { get; set; }

//        // the rest of the columns
//        [StringLength(50)]
//        public string Address1 { get; set; }

//        [StringLength(50)]
//        public string City1 { get; set; }

//        [StringLength(2)]
//        public string State1 { get; set; }

//        [StringLength(20)]
//        public string ZipCode1 { get; set; }

//        [StringLength(50)]
//        public string Address2 { get; set; }

//        [StringLength(50)]
//        public string City2 { get; set; }

//        [StringLength(2)]
//        public string State2 { get; set; }

//        [StringLength(20)]
//        public string ZipCode2 { get; set; }

//        [Column(TypeName = "datetime2")]
//        public DateTime? LastUpdated { get; set; }

//        [StringLength(255)]
//        public string UpdatedBy { get; set; }
//    }
//}
