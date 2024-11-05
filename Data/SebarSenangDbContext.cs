using SebarSenang.Models.DataModel;
using System.Collections.Generic;
using System.Reflection.Emit;
using Microsoft.EntityFrameworkCore;

namespace SebarSenang.Data
{
    public class SebarSenangDbContext : DbContext
    {
        public SebarSenangDbContext(DbContextOptions<SebarSenangDbContext> options) : base(options) { }

        public DbSet<Penyedia> Penyedia { get; set; }
        public DbSet<Penyewa> Penyewa { get; set; }
        public DbSet<Barang> Barang { get; set; }
        public DbSet<Penyewaan> Penyewaan { get; set; }
        public DbSet<Transaksi> Transaksi { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Here you can configure your entity properties, relationships, etc.

            // Example: Setting up relationships if needed
            modelBuilder.Entity<Penyewaan>()
                .HasOne<Penyewa>()
                .WithMany()
                .HasForeignKey(p => p.PenyewaId);

            modelBuilder.Entity<Penyewaan>()
                .HasOne<Barang>()
                .WithMany()
                .HasForeignKey(p => p.BarangId);

            // Add more configurations as needed
        }
    }
}