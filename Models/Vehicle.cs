namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Vehicle
    {
        [Key]
        public int VehicleID { get; set; }

        [StringLength(50)]
        public string UnitIdentifier { get; set; }

        [StringLength(50)]
        public string VehicleMake { get; set; }

        [StringLength(50)]
        public string VehicleModel { get; set; }

        public int? CompID { get; set; }

        [StringLength(50)]
        public string YearMade { get; set; }

        [StringLength(50)]
        public string Color { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? InspectionExpirationDate { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? RegistrationExpirationDate { get; set; }

        public int? TireSize { get; set; }

        [StringLength(50)]
        public string VIN { get; set; }

        [StringLength(50)]
        public string TagNumber { get; set; }
        
        //[Column(TypeName = "datetime2")]
        public DateTime? DateAddedtoFleet { get; set; }

        //[Column(TypeName = "datetime2")]
        public DateTime? DateDeletedfromFleet { get; set; }
    }
}
