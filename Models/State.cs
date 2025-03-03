namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class State
    {
        [Key]
        [Column("State")]
        [StringLength(2)]
        public string State1 { get; set; }

    }
}
