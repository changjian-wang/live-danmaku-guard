using Microsoft.EntityFrameworkCore;

namespace LiveDanmakuGuard.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    // DbSets will be added here as entities are created
    // public DbSet<User> Users { get; set; }
    // public DbSet<LiveRoom> LiveRooms { get; set; }
    // public DbSet<DanmakuMessage> DanmakuMessages { get; set; }
    // etc.

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Entity configurations will be added here
    }
}
