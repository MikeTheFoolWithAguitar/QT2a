// 1/31/15 Removed from website by Mike. We never did this. If we need it then we will do it.
//
//namespace WingtipToys.Models
//{
//    using System;
//    using System.Collections.Generic;
//    using System.ComponentModel.DataAnnotations;
//    using System.ComponentModel.DataAnnotations.Schema;
//    using System.Data.Entity.Spatial;

//    public partial class ResultsContact
//    {
//        [Key]
//        public int ResultCopntactID { get; set; }

//        public int? DrugTestID { get; set; }

//        public int? EmployeeID { get; set; }

//        [Column(TypeName = "datetime2")]
//        public DateTime? ContactDate { get; set; }

//        [Column(TypeName = "datetime2")]
//        public DateTime? ContactTime { get; set; }

//        [StringLength(50)]
//        public string Description { get; set; }

//        [StringLength(50)]
//        public string Results { get; set; }

//        [Column(TypeName = "timestamp")]
//        [MaxLength(8)]
//        [Timestamp]
//        public byte[] SSMA_TimeStamp { get; set; }
//    }
//}
