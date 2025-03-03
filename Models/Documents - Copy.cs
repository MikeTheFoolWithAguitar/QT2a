using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WingtipToys.Models
{
    public class DocumentsCopy
    {
        [ScaffoldColumn(false)]
        [Key]
        public int DID { get; set; }
        public int DocID { get; set; }
        public int EmployeeID { get; set; }
        public int CompanyID { get; set; }
        public int Doc_Type { get; set; }
        [Display(Name = "ExpirationDate")]
        public System.DateTime ExpirationDate { get; set; }
        [Display(Name = "DateCreated")]
        public System.DateTime DateCreated { get; set; }
        [StringLength(50), Display(Name = "FileName")]
        public string FileName { get; set; }
        [StringLength(50), Display(Name = "Notes")]
        public string Notes { get; set; }
        [Display(Name = "DateReviewed")]
        public System.DateTime DateReviewed { get; set; }
        [StringLength(100), Display(Name = "Location")]
        public string Location { get; set; }
        [StringLength(5), Display(Name = "Status")]
        public string Status { get; set; }
        [StringLength(5), Display(Name = "Doc_Format")]
        public string Doc_Format { get; set; }
        [StringLength(50), Display(Name = "Reviewer")]
        public string Reviewer { get; set; }
        [Display(Name = "Completed")]
        public bool Completed { get; set; }
        public int Doc_Order { get; set; }
        [StringLength(50), Display(Name = "UpdatedBy")]
        public string UpdatedBy { get; set; }
        [Display(Name = "LastUpdated")]
        public System.DateTime LastUpdated { get; set; }

        // Navigation Property / Foreign Key
        public virtual EmployeeCopy EmployeeCopy { get; set; }
    }
}