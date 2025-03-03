namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RestrictionLetter
    {
        [Key]
        public int RestrictionLetterID { get; set; }

        [StringLength(20)]
        public string Restriction { get; set; }

        [StringLength(50)]
        public string Description { get; set; }
    }
}
