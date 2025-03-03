namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class EndorsementsAndRestrictions
    {
        [Key]
        public int EndorsementsAndRestrictionsID { get; set; }

        public int? Restriction { get; set; }

        [StringLength(50)]
        public string Endorsement { get; set; }

    }
}
