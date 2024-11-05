using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OpenApi;
using Microsoft.EntityFrameworkCore;
using SebarSenang.Data;

namespace SebarSenang.Models.DataModel
{
    public class Penyewa
    {
        [Key]
        public Guid PenyewaId { get; set; } = Guid.NewGuid();

        [Required]
        public string Nama { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        public string Telepon { get; set; }
    }


public static class PenyewaEndpoints
{
	public static void MapPenyewaEndpoints (this IEndpointRouteBuilder routes)
    {
        var group = routes.MapGroup("/api/Penyewa").WithTags(nameof(Penyewa));

        group.MapGet("/", async (SebarSenangDbContext db) =>
        {
            return await db.Penyewa.ToListAsync();
        })
        .WithName("GetAllPenyewas")
        .WithOpenApi();

        group.MapGet("/{id}", async Task<Results<Ok<Penyewa>, NotFound>> (Guid penyewaid, SebarSenangDbContext db) =>
        {
            return await db.Penyewa.AsNoTracking()
                .FirstOrDefaultAsync(model => model.PenyewaId == penyewaid)
                is Penyewa model
                    ? TypedResults.Ok(model)
                    : TypedResults.NotFound();
        })
        .WithName("GetPenyewaById")
        .WithOpenApi();

        group.MapPut("/{id}", async Task<Results<Ok, NotFound>> (Guid penyewaid, Penyewa penyewa, SebarSenangDbContext db) =>
        {
            var affected = await db.Penyewa
                .Where(model => model.PenyewaId == penyewaid)
                .ExecuteUpdateAsync(setters => setters
                  .SetProperty(m => m.PenyewaId, penyewa.PenyewaId)
                  .SetProperty(m => m.Nama, penyewa.Nama)
                  .SetProperty(m => m.Email, penyewa.Email)
                  .SetProperty(m => m.Telepon, penyewa.Telepon)
                  );
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("UpdatePenyewa")
        .WithOpenApi();

        group.MapPost("/", async (Penyewa penyewa, SebarSenangDbContext db) =>
        {
            db.Penyewa.Add(penyewa);
            await db.SaveChangesAsync();
            return TypedResults.Created($"/api/Penyewa/{penyewa.PenyewaId}",penyewa);
        })
        .WithName("CreatePenyewa")
        .WithOpenApi();

        group.MapDelete("/{id}", async Task<Results<Ok, NotFound>> (Guid penyewaid, SebarSenangDbContext db) =>
        {
            var affected = await db.Penyewa
                .Where(model => model.PenyewaId == penyewaid)
                .ExecuteDeleteAsync();
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("DeletePenyewa")
        .WithOpenApi();
    }
}
}
