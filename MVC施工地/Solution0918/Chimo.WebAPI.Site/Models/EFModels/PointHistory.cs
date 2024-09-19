namespace Chimo.WebAPI.Site.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PointHistory
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public int Cash { get; set; }

        public int Amount { get; set; }

        public int Point { get; set; }

        public int GetPointType { get; set; }

        public DateTime GetPointDate { get; set; }

        public int? OrderId { get; set; }

        public virtual Member Member { get; set; }

        public virtual Order Order { get; set; }
    }
}
