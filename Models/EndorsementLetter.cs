namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class EndorsementLetter
    {
        [Key]
        [StringLength(50)]
        public string Endorsement { get; set; }

        [StringLength(255)]
        public string Description { get; set; }
    }
}
