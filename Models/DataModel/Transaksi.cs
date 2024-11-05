using System.ComponentModel.DataAnnotations;

namespace SebarSenang.Models.DataModel
{
    public class Transaksi
    {
        [Key]
        public Guid TransaksiId { get; set; } = Guid.NewGuid();

        [Required]
        public Guid PenyewaanId { get; set; }

        [Required]
        public DateTime TanggalTransaksi { get; set; }

        public decimal TotalBiaya { get; set; }
    }
}
