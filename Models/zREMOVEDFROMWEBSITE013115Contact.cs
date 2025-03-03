// This was removed 1/31/15 by Mike. We are not going to track these.
// We are just keeping this info in the individual tables
//namespace WingtipToys.Models
//{
//    using System;
//    using System.Collections.Generic;
//    using System.ComponentModel.DataAnnotations;
//    using System.ComponentModel.DataAnnotations.Schema;
//    using System.Data.Entity.Spatial;

//    public partial class Contact
//    {
//        [Key]
//        public int ContactID { get; set; }

//        public int ContactType { get; set; }

//        // These are the foreign keys. One for each of the contact types
//        public int? CompanyID { get; set; }
//        public int? LocationID { get; set; }
//        public int? MROID { get; set; }
//        public int? ProgramID { get; set; }
//        public int? ProspectID { get; set; }
//        public int? LaboratoryID { get; set; }
//        public int? EmployeeID { get; set; }
//        public int? AccidentID { get; set; }
//        [ForeignKey("CollectionSite")]
//        public int? CollectionSiteID { get; set; }
//        // Navigation Properties / Foreign Keys
//        public virtual Company Company { get; set; }
//        public virtual Location Location { get; set; }
//        public virtual MedicalReviewOfficer MedicalReviewOfficer { get; set; }
//        public virtual Program Program { get; set; }
//        public virtual zREMOVEDFROMWEBSITE013115Prospect Prospect { get; set; }
//        public virtual Laboratory Laboratory { get; set; }
//        public virtual Employee Employee { get; set; }
//        public virtual Accident Accident { get; set; }
//        public virtual CollectionSite CollectionSite { get; set; }

//        public bool? Primary { get; set; }

//        [StringLength(50)]
//        public string F_Name { get; set; }

//        [StringLength(50)]
//        public string L_Name { get; set; }

//        [StringLength(50)]
//        public string Title { get; set; }

//        [StringLength(20)]
//        public string Phone_No1 { get; set; }

//        [StringLength(20)]
//        public string Phone_No2 { get; set; }

//        [StringLength(20)]
//        public string Phone_No3 { get; set; }

//        [StringLength(20)]
//        public string Fax { get; set; }

//        [Column("E-Mail")]
//        [StringLength(50)]
//        public string E_Mail { get; set; }

//        [Column(TypeName = "datetime2")]
//        public DateTime? LastUpdated { get; set; }

//        [StringLength(255)]
//        public string UpdatedBy { get; set; }
//    }
//}
