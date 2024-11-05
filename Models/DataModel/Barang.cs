using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OpenApi;
using Microsoft.EntityFrameworkCore;
using SebarSenang.Data;

namespace SebarSenang.Models.DataModel
{
    public class Barang
    {
        [Key]
        public Guid BarangId { get; set; } = Guid.NewGuid();

        [Required]
        public string NamaBarang { get; set; }

        [Required]
        public decimal HargaPerHari { get; set; }

        public string Deskripsi { get; set; }
    }


public static class BarangEndpoints
{
	public static void MapBarangEndpoints (this IEndpointRouteBuilder routes)
    {
        var group = routes.MapGroup("/api/Barang").WithTags(nameof(Barang));

        group.MapGet("/", async (SebarSenangDbContext db) =>
        {
            return await db.Barang.ToListAsync();
        })
        .WithName("GetAllBarangs")
        .WithOpenApi();

        group.MapGet("/{id}", async Task<Results<Ok<Barang>, NotFound>> (Guid barangid, SebarSenangDbContext db) =>
        {
            return await db.Barang.AsNoTracking()
                .FirstOrDefaultAsync(model => model.BarangId == barangid)
                is Barang model
                    ? TypedResults.Ok(model)
                    : TypedResults.NotFound();
        })
        .WithName("GetBarangById")
        .WithOpenApi();

        group.MapPut("/{id}", async Task<Results<Ok, NotFound>> (Guid barangid, Barang barang, SebarSenangDbContext db) =>
        {
            var affected = await db.Barang
                .Where(model => model.BarangId == barangid)
                .ExecuteUpdateAsync(setters => setters
                  .SetProperty(m => m.BarangId, barang.BarangId)
                  .SetProperty(m => m.NamaBarang, barang.NamaBarang)
                  .SetProperty(m => m.HargaPerHari, barang.HargaPerHari)
                  .SetProperty(m => m.Deskripsi, barang.Deskripsi)
                  );
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("UpdateBarang")
        .WithOpenApi();

        group.MapPost("/", async (Barang barang, SebarSenangDbContext db) =>
        {
            db.Barang.Add(barang);
            await db.SaveChangesAsync();
            return TypedResults.Created($"/api/Barang/{barang.BarangId}",barang);
        })
        .WithName("CreateBarang")
        .WithOpenApi();

        group.MapDelete("/{id}", async Task<Results<Ok, NotFound>> (Guid barangid, SebarSenangDbContext db) =>
        {
            var affected = await db.Barang
                .Where(model => model.BarangId == barangid)
                .ExecuteDeleteAsync();
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("DeleteBarang")
        .WithOpenApi();
    }
}
}
