namespace sb_admin2_Test.Models.EFmodels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderItem
    {
        public int Id { get; set; }

        public int OrderId { get; set; }

        public int CourseId { get; set; }

        public int Status { get; set; }

        public int Price { get; set; }

        public virtual Cours Cours { get; set; }

        public virtual Order Order { get; set; }
    }
}
