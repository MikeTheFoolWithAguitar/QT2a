// This was removed 1/31/15 by Mike. We are not going to track these.
// This was used years ago by Jake to keep track of possible clients.
// It was just an extra table he created in Access not related to any others.
//namespace WingtipToys.Models
//{
//    using System;
//    using System.Collections.Generic;
//    using System.ComponentModel.DataAnnotations;
//    using System.ComponentModel.DataAnnotations.Schema;
//    using System.Data.Entity.Spatial;

//    public partial class zREMOVEDFROMWEBSITE013115Prospect
//    {
//        [Key]
//        [DatabaseGenerated(DatabaseGeneratedOption.None)]
//        public int CompID { get; set; }

//        [Column("MiscYes/No")]
//        public bool? MiscYes_No { get; set; }

//        [StringLength(75)]
//        public string CompanyName { get; set; }

//        [StringLength(255)]
//        public string CoAddress { get; set; }

//        [StringLength(50)]
//        public string CoCity { get; set; }

//        [StringLength(50)]
//        public string CoCounty { get; set; }

//        [StringLength(50)]
//        public string CoState { get; set; }

//        [StringLength(20)]
//        public string CoZipCode { get; set; }

//        [StringLength(50)]
//        public string ContactFName { get; set; }

//        [StringLength(50)]
//        public string ContactTitle { get; set; }

//        [StringLength(30)]
//        public string Phone { get; set; }

//        [StringLength(30)]
//        public string Fax { get; set; }

//        public string Note { get; set; }

//        [Column(TypeName = "datetime2")]
//        public DateTime? MktContact1Date { get; set; }

//        [StringLength(50)]
//        public string MktContact1Result { get; set; }

//        [Column(TypeName = "datetime2")]
//        public DateTime? MktContact2Date { get; set; }

//        [StringLength(50)]
//        public string MktContact2Result { get; set; }

//        [Column("Appointment Date", TypeName = "datetime2")]
//        public DateTime? Appointment_Date { get; set; }
//    }
//}
