namespace sb_admin2_Test.Models.EFmodels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CartItem
    {
        public int Id { get; set; }

        public int CartId { get; set; }

        public int CourseId { get; set; }

        public int Price { get; set; }

        public DateTime CreatedDate { get; set; }

        public virtual Cart Cart { get; set; }

        public virtual Cours Cours { get; set; }
    }
}
