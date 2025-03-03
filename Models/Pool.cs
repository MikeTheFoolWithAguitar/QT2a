using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;


namespace WingtipToys.Models
{
    public class Pool
    {
        [Key]
        public int PoolID { get; set; }
        [StringLength(50)]
        public string PoolName { get; set; }
    }
}