using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OpenApi;
using Microsoft.EntityFrameworkCore;
using SebarSenang.Data;

namespace SebarSenang.Models.DataModel
{
    public class Penyedia
    {
        [Key]
        public Guid PenyediaId { get; set; } = Guid.NewGuid();

        [Required]
        public string Nama { get; set; }

        [Required]
        public string Alamat { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        public string Telepon { get; set; }
    }


public static class PenyediaEndpoints
{
	public static void MapPenyediaEndpoints (this IEndpointRouteBuilder routes)
    {
        var group = routes.MapGroup("/api/Penyedia").WithTags(nameof(Penyedia)).RequireAuthorization();

        group.MapGet("/", async (SebarSenangDbContext db) =>
        {
            return await db.Penyedia.ToListAsync();
        })
        .WithName("GetAllPenyedia")
        .WithOpenApi();

        group.MapGet("/{id}", async Task<Results<Ok<Penyedia>, NotFound>> (Guid penyediaid, SebarSenangDbContext db) =>
        {
            return await db.Penyedia.AsNoTracking()
                .FirstOrDefaultAsync(model => model.PenyediaId == penyediaid)
                is Penyedia model
                    ? TypedResults.Ok(model)
                    : TypedResults.NotFound();
        })
        .WithName("GetPenyediaById")
        .WithOpenApi();

        group.MapPut("/{id}", async Task<Results<Ok, NotFound>> (Guid penyediaid, Penyedia penyedia, SebarSenangDbContext db) =>
        {
            var affected = await db.Penyedia
                .Where(model => model.PenyediaId == penyediaid)
                .ExecuteUpdateAsync(setters => setters
                  .SetProperty(m => m.PenyediaId, penyedia.PenyediaId)
                  .SetProperty(m => m.Nama, penyedia.Nama)
                  .SetProperty(m => m.Alamat, penyedia.Alamat)
                  .SetProperty(m => m.Email, penyedia.Email)
                  .SetProperty(m => m.Telepon, penyedia.Telepon)
                  );
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("UpdatePenyedia")
        .WithOpenApi();

        group.MapPost("/", async (Penyedia penyedia, SebarSenangDbContext db) =>
        {
            db.Penyedia.Add(penyedia);
            await db.SaveChangesAsync();
            return TypedResults.Created($"/api/Penyedia/{penyedia.PenyediaId}",penyedia);
        })
        .WithName("CreatePenyedia")
        .WithOpenApi();

        group.MapDelete("/{id}", async Task<Results<Ok, NotFound>> (Guid penyediaid, SebarSenangDbContext db) =>
        {
            var affected = await db.Penyedia
                .Where(model => model.PenyediaId == penyediaid)
                .ExecuteDeleteAsync();
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("DeletePenyedia")
        .WithOpenApi();
    }
}
}
