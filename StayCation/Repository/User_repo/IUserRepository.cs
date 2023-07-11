using Hotel.Models;

namespace Hotel.Repository.User_repo
{
	public interface IUserRepository
	{
		User GetUserByEmail(string email);
		User GetUserByEmailAndPassword(string email, string password);
		void AddUser(User user);
		List<User> GetUsers();

	}
}
