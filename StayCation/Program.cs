using Hotel.Repository.Property_repo;
using Hotel.Repository.User_repo;
using Microsoft.EntityFrameworkCore;
using Hotel.Models;

var builder = WebApplication.CreateBuilder(args);


var connectionString = "Data Source=.;database=HotelDB;Integrated Security=True;Persist Security Info=False;Pooling=False;Multiple Active Result Sets=False;Connect Timeout=60;Encrypt=False;Trust Server Certificate=False;";

//DbContext Registration
builder.Services.AddDbContext<VictorDbContext>(options => { options.UseSqlServer(connectionString); });




//Repository Registration
builder.Services.AddScoped<IUserRepository>(provider => { var dbContext = provider.GetRequiredService<VictorDbContext>(); return new UserRepository(dbContext); });
builder.Services.AddScoped<IPropertyRepository>(provider => { var dbContext = provider.GetRequiredService<VictorDbContext>(); return new PropertyRepository(dbContext); });
/*Data Source=LAPTOP-LPLOFKEO;Integrated Security=True;Persist Security Info=False;Pooling=False;Multiple Active Result Sets=False;Connect Timeout=60;Encrypt=False;Trust Server Certificate=False*/
// Add services to the container.
builder.Services.AddControllersWithViews();
 
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
//Data Source=LAPTOP-LPLOFKEO;Integrated Security=True;Persist Security Info=False;Pooling=False;Multiple Active Result Sets=False;
//Connect Timeout=60;Encrypt=False;Trust Server Certificate=False;





