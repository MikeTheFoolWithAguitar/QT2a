using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
// Add primary key EID, make EmployeeID a regular column, generate the model,
// populate the new db from the old db, swap out the new db, delete the EID
// column, make the EmployeeID the Primary Key in the swapped out DB. Delete
// the EID in the model, make the EmployeeID the Primary Key in the model.
// regenerate the DB. Swap in the DB with the newly populate data from the old
// DB. What EmployeeID does it add new employees in with? 

namespace WingtipToys.Models
{
    public class EmployeeCopy
    {
        [ScaffoldColumn(false)]
        [Key]
        public int EID { get; set; }
        public int EmployeeID { get; set; }

        [Required, StringLength(50), Display(Name = "FirstName")]
        public string FName { get; set; }
        [Required, StringLength(50), Display(Name = "LastName")]
        public string LName { get; set; }
        [Required, StringLength(9), Display(Name = "SSN")]
        public string SSNo { get; set; }
        [Display(Name="BirthDate")]
        public System.DateTime? BirthDate { get; set; }
        [StringLength(30), Display(Name = "HomePhone")]
        public string HomePhone { get; set; }
        [StringLength(50), Display(Name = "LicenseNumber")]
        public string LicenseNo { get; set; }
        [StringLength(50), Display(Name = "LicenseClass")]
        public string LicenseClass { get; set; }
        [StringLength(50), Display(Name = "LicenseState")]
        public string LicSt { get; set; }
        [Display(Name = "Male/Female")]
        public bool Sex { get; set; }
        [Display(Name = "CDLDriver")]
        public bool CDLdriver { get; set; }
        [Display(Name = "CMVDriver")]
        public bool CMVdriver { get; set; }
        [Display(Name = "AirBrakeRestriction")]
        public bool AirBrakeRestr { get; set; }
        [StringLength(10000), Display(Name = "Notes"), DataType(DataType.MultilineText)]
        public string Notes { get; set; }

        // Address
        [StringLength(50), Display(Name = "Address")]
        public string Address { get; set; }
        [StringLength(50), Display(Name = "City")]
        public string City { get; set; }
        [StringLength(2), Display(Name = "State")]
        public string State { get; set; }
        [StringLength(50), Display(Name = "ZipCode")]
        public string ZipCode { get; set; }

        // Contact Info
        [StringLength(50), Display(Name = "Title")]
        public string Title { get; set; }
        [StringLength(50), Display(Name = "Phone1")]
        public string Phone1 { get; set; }
        [StringLength(50), Display(Name = "Phone2")]
        public string Phone2 { get; set; }
        [StringLength(50), Display(Name = "CellPhone")]
        public string CellPhone { get; set; }
        [StringLength(50), Display(Name = "Fax")]
        public string Fax { get; set; }
        [StringLength(50), Display(Name = "EMail")]
        public string EMail { get; set; }

        [StringLength(50), Display(Name = "UpdatedBy")]
        public string UpdatedBy { get; set; }
        [Display(Name = "LastUpdated")]
        public System.DateTime? LastUpdated { get; set; }
        
        // Navigation Property / Foriegn Key
        public virtual ICollection<DocumentsCopy> DocumentsCopy { get; set; }

        
        //
        //
        // extra just to regenerate the model
        //[StringLength(50), Display(Name = "ExtraNotNeeded")]
        //public string ExtraNotNeeded { get; set; }

    }
}