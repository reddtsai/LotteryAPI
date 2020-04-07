using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using lotteryapi.Repositories.Entities;

namespace lotteryapi.Repositories
{
    public partial class LotteryContext : DbContext
    {
        public LotteryContext()
        {
        }

        public LotteryContext(DbContextOptions<LotteryContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Lotto649> Lotto649 { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Lotto649>(entity =>
            {
                entity.HasKey(e => e.Term)
                    .HasName("PRIMARY");

                entity.Property(e => e.Term)
                    .HasColumnType("int(11)")
                    .HasComment("期別");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.Creater)
                    .IsRequired()
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.No1)
                    .HasColumnType("tinyint(4)")
                    .HasComment("奬號一");

                entity.Property(e => e.No2)
                    .HasColumnType("tinyint(4)")
                    .HasComment("奬號二");

                entity.Property(e => e.No3)
                    .HasColumnType("tinyint(4)")
                    .HasComment("奬號三");

                entity.Property(e => e.No4)
                    .HasColumnType("tinyint(4)")
                    .HasComment("奬號四");

                entity.Property(e => e.No5)
                    .HasColumnType("tinyint(4)")
                    .HasComment("奬號五");

                entity.Property(e => e.No6)
                    .HasColumnType("tinyint(4)")
                    .HasComment("奬號六");

                entity.Property(e => e.NoS)
                    .HasColumnType("tinyint(4)")
                    .HasComment("特別號");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
