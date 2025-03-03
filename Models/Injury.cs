namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Injury
    {
        [Key]
        public int InjuryID { get; set; }

        public int? EmployeeID { get; set; }

        public int? AccidentID { get; set; }

        public bool? Premises { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? Date { get; set; }

        [Column("Injury")]
        public bool? Injury1 { get; set; }

        public bool? Illness { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? DateKnew { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? DateDisab { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? DatePaid { get; set; }

        [StringLength(50)]
        public string Description { get; set; }

        [StringLength(50)]
        public string WhatDoing { get; set; }

        [StringLength(50)]
        public string Object { get; set; }

        public bool? Back2Work { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? DateBack { get; set; }

        public bool? SameRate { get; set; }

        public bool? FatalityInj { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? FatalDate { get; set; }

        public bool? RestrictedInj { get; set; }

        public double? DaysRestrIlnj { get; set; }

        public bool? LostInj { get; set; }

        public double? DaysLostIlnj { get; set; }

        public bool? InjjuryWO { get; set; }

        public bool? Skin { get; set; }

        public bool? Lungs { get; set; }

        public bool? Respiratory { get; set; }

        public bool? Poison { get; set; }

        public bool? Agents { get; set; }

        public bool? Trauma { get; set; }

        public bool? OtherIll { get; set; }

        public bool? FatalityIll { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? FatalDateIll { get; set; }

        public bool? RestrictedIll { get; set; }

        public double? DaysRestrIll { get; set; }

        public bool? LostIll { get; set; }

        public double? DaysLostIll { get; set; }

        public bool? IllnessWO { get; set; }

        public bool? Amputation { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        public virtual Accident Accident { get; set; }
    }
}
