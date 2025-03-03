namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Location
    {
        [Key]
        public int LocationID { get; set; }

        [StringLength(75)]
        public string LocationName { get; set; }

        public int CompanyID { get; set; }

        [StringLength(50)]
        public string SICCode { get; set; }

        [StringLength(50)]
        public string InsPolicyNo { get; set; }

        [StringLength(50)]
        public string UCReportingNo { get; set; }

        [StringLength(50)]
        public string LicReviewPerson { get; set; }

        [StringLength(50)]
        public string LicReviewTitle { get; set; }

        [StringLength(10000)]
        public string Notes { get; set; }

        // Address
        // Default this to "Company Address"
        [StringLength(50)]
        public string Address1Note { get; set; }

        [StringLength(50)]
        public string Address1 { get; set; }

        [StringLength(50)]
        public string City1 { get; set; }

        [StringLength(2)]
        public string State1 { get; set; }

        [StringLength(20)]
        public string ZipCode1 { get; set; }

        // Default this to "Mailing Address"
        [StringLength(50)]
        public string Address2Note { get; set; }

        [StringLength(50)]
        public string Address2 { get; set; }

        [StringLength(50)]
        public string City2 { get; set; }

        [StringLength(2)]
        public string State2 { get; set; }

        [StringLength(20)]
        public string ZipCode2 { get; set; }

        // Contact
        [StringLength(50)]
        public string Contact1FName { get; set; }

        [StringLength(50)]
        public string Contact1LName { get; set; }

        [StringLength(50)]
        public string Contact1Title { get; set; }

        [StringLength(20)]
        public string Contact1PhoneNo1 { get; set; }

        [StringLength(20)]
        public string Contact1PhoneNo2 { get; set; }

        [StringLength(20)]
        public string Contact1PhoneNo3 { get; set; }

        [StringLength(20)]
        public string Contact1Fax { get; set; }

        [StringLength(50)]
        public string Contact1EMail { get; set; }

        // Contact 2
        [StringLength(50)]
        public string Contact2FName { get; set; }

        [StringLength(50)]
        public string Contact2LName { get; set; }

        [StringLength(50)]
        public string Contact2Title { get; set; }

        [StringLength(20)]
        public string Contact2PhoneNo1 { get; set; }

        [StringLength(20)]
        public string Contact2PhoneNo2 { get; set; }

        [StringLength(20)]
        public string Contact2PhoneNo3 { get; set; }

        [StringLength(20)]
        public string Contact2Fax { get; set; }

        [StringLength(50)]
        public string Contact2EMail { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? LastUpdated { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }
    }
}
