using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace sb_admin2_Test.Models.EFmodels
{
	public partial class AppDbcontext : DbContext
	{
		public AppDbcontext()
			: base("name=AppDbcontext")
		{
		}

		public virtual DbSet<CartItem> CartItems { get; set; }
		public virtual DbSet<Cart> Carts { get; set; }
		public virtual DbSet<CourseCatalog> CourseCatalogs { get; set; }
		public virtual DbSet<CourseCategory> CourseCategories { get; set; }
		public virtual DbSet<CourseChapter> CourseChapters { get; set; }
		public virtual DbSet<CourseComment> CourseComments { get; set; }
		public virtual DbSet<Cours> Courses { get; set; }
		public virtual DbSet<MemberCollection> MemberCollections { get; set; }
		public virtual DbSet<Member> Members { get; set; }
		public virtual DbSet<OrderItem> OrderItems { get; set; }
		public virtual DbSet<Order> Orders { get; set; }
		public virtual DbSet<PointHistory> PointHistories { get; set; }
		public virtual DbSet<Teacher> Teachers { get; set; }
		public virtual DbSet<User> Users { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Cart>()
				.HasMany(e => e.CartItems)
				.WithRequired(e => e.Cart)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<CourseCatalog>()
				.HasMany(e => e.CourseChapters)
				.WithRequired(e => e.CourseCatalog)
				.HasForeignKey(e => e.CatalogId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<CourseCategory>()
				.HasMany(e => e.Courses)
				.WithRequired(e => e.CourseCategory)
				.HasForeignKey(e => e.CategoryId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<CourseChapter>()
				.HasMany(e => e.CourseComments)
				.WithRequired(e => e.CourseChapter)
				.HasForeignKey(e => e.ChapterId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cours>()
				.HasMany(e => e.CartItems)
				.WithRequired(e => e.Cours)
				.HasForeignKey(e => e.CourseId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cours>()
				.HasMany(e => e.CourseCatalogs)
				.WithRequired(e => e.Cours)
				.HasForeignKey(e => e.CourseId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cours>()
				.HasMany(e => e.CourseComments)
				.WithRequired(e => e.Cours)
				.HasForeignKey(e => e.CourseId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cours>()
				.HasMany(e => e.MemberCollections)
				.WithRequired(e => e.Cours)
				.HasForeignKey(e => e.CourseId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Cours>()
				.HasMany(e => e.OrderItems)
				.WithRequired(e => e.Cours)
				.HasForeignKey(e => e.CourseId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Password)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Phone)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Carts)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.CourseComments)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.MemberCollections)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Orders)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.PointHistories)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Order>()
				.HasMany(e => e.OrderItems)
				.WithRequired(e => e.Order)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Teacher>()
				.Property(e => e.Email)
				.IsUnicode(false);

			modelBuilder.Entity<Teacher>()
				.HasMany(e => e.Courses)
				.WithRequired(e => e.Teacher)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<User>()
				.Property(e => e.Password)
				.IsUnicode(false);
		}
	}
}
