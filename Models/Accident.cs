namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Accident
    {
        //public Accident()
        //{
        //    Injuries = new HashSet<Injury>();
        //}

        public int AccidentID { get; set; }

        [StringLength(50)]
        public string AccidentType { get; set; }

        public int? EmployeeID { get; set; }

        [StringLength(30)]
        public string Status { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime Date { get; set; }

        public bool? Location { get; set; }

        [StringLength(50)]
        public string Address1 { get; set; }

        [StringLength(50)]
        public string City1 { get; set; }

        [StringLength(2)]
        public string State1 { get; set; }

        [StringLength(20)]
        public string ZipCode1 { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? Time { get; set; }

        public bool? Confirmed { get; set; }

        public string Description { get; set; }

        public bool? MechDefect { get; set; }

        public bool? UnsafeAct { get; set; }
//        public bool? DELETEME { get; set; }
       
        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        // navigation
        public virtual Employee Employee { get; set; }
        public virtual ICollection<Injury> Injuries { get; set; }
    }
}
