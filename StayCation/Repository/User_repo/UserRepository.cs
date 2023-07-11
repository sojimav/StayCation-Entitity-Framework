using System.Text;
using Hotel.Models;
using System.Security.Cryptography;

namespace Hotel.Repository.User_repo
{
	public class UserRepository : IUserRepository
	{
		private readonly VictorDbContext _userDbContext;
		public UserRepository(VictorDbContext dbContext)
		{
			_userDbContext = dbContext;
		}



		public User GetUserByEmail(string email)
		{
			return _userDbContext.Users.FirstOrDefault(user => user.Email == email);
		}



		public User GetUserByEmailAndPassword(string email, string password)
		{
			string hashedPassword = HashPassword(password);
			return _userDbContext.Users.FirstOrDefault(user => user.Email == email && user.Password == hashedPassword);
		}



		public void AddUser(User user)
		{
			user.Password = HashPassword(user.Password);
			_userDbContext.Users.Add(user);
			_userDbContext.SaveChanges();
		}



		public List<User> GetUsers()
		{
			return _userDbContext.Users.ToList();
		}



		public string HashPassword(string password)
		{
			using (SHA256 sha256 = SHA256.Create())
			{
				byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
				return Convert.ToBase64String(hashedBytes);
			}
		}
	}
}
