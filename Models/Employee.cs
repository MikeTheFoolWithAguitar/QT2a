namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Employee
    {
        //public Employee()
        //{
        //    PrevEmployer = new HashSet<PrevEmployer>();
        //}

        public int EmployeeID { get; set; }

        // This is meaningless now. It was originally a company had many
        // employees and employees was a part of one company. Now it is a
        // many to many relationship with the PrevEmployers join table.
        // Just keep it for historial purposes.
        public int? CompID { get; set; }
        
        [Required]
        [StringLength(50)]
        public string LName { get; set; }

        [Required]
        [StringLength(50)]
        public string FName { get; set; }

        [StringLength(2)]
        public string MInitial { get; set; }

        [Required]
        [StringLength(11)]
        public string SSNo { get; set; }

        [StringLength(20)]
        public string Title { get; set; }

        public bool? CDLdriver { get; set; }

        public bool? CMVdriver { get; set; }

        [StringLength(50)]
        public string LicSt { get; set; }

        [StringLength(50)]
        public string LicenseNo { get; set; }

        [StringLength(50)]
        public string LicenseClass { get; set; }

        public bool? Sex { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? BirthDate { get; set; }

        public bool? AirBrakeRestr { get; set; }

        [StringLength(10000)]
        public string Notes { get; set; }

        // Address
        [StringLength(50)]
        public string Address1 { get; set; }

        [StringLength(50)]
        public string City1 { get; set; }

        [StringLength(2)]
        public string State1 { get; set; }

        [StringLength(20)]
        public string ZipCode1 { get; set; }

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

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        // navigation
        public virtual ICollection<Accident> Accident { get; set; }
        public virtual ICollection<AlcoholTest> AlcoholTest { get; set; }
        public virtual ICollection<AlcoholViolation> AlcoholViolation { get; set; }
        public virtual ICollection<Document> Document { get; set; }
        public virtual ICollection<DrugTestResult> DrugTestResult { get; set; }
        public virtual ICollection<PrevEmployer> PrevEmployer { get; set; }

    }
}
