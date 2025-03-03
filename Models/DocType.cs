namespace WingtipToys.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DocType
    {
        [Key]
        public int DocTypeID { get; set; }

        [StringLength(50)]
        public string DocumentType { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        // navigation
        public virtual ICollection<Document> Document { get; set; }

    }
}
