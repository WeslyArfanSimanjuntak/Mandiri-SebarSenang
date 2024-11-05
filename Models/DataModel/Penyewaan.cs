using System.ComponentModel.DataAnnotations;

namespace SebarSenang.Models.DataModel
{
    public class Penyewaan
    {
        [Key]
        public Guid PenyewaanId { get; set; } = Guid.NewGuid();

        [Required]
        public Guid BarangId { get; set; }

        [Required]
        public Guid PenyewaId { get; set; }

        [Required]
        public DateTime TanggalMulai { get; set; }

        [Required]
        public DateTime TanggalSelesai { get; set; }

        public int DurasiHari => (TanggalSelesai - TanggalMulai).Days;

        public decimal TotalHarga { get; set; }
    }
}
