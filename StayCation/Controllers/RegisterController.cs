using Hotel.Repository.User_repo;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using System.Security.Principal;

namespace Hotel.Controllers
{
    public class RegisterController : Controller
    {
         private readonly IUserRepository _userRepository;	
        public RegisterController(IUserRepository userRepository) 
        {
            _userRepository = userRepository;
        }




	
		public IActionResult Login() 
		{
			return View();
		}




		[HttpPost]
        public IActionResult Login(LoginUser login)
        {

			if (ModelState.IsValid)
			{

				var UserExist = _userRepository.GetUserByEmailAndPassword(login.Email, login.Password);



				if (UserExist != null)
				{
					//string loggedInUserId = UserExist.UserId.ToString();
					//HttpContext.Session.SetString("loggedIn_UserId", loggedInUserId);
					TempData["Message"] = "Login Successful";
					return RedirectToAction("Index", "Home");
				}
				else
				{
					// Invalid credentials, display an error message
					TempData["ErrorMessage"] = "Invalid Sign in Credentials.";
					return View(login);
				}
			}
			else
			{
				// If the model state is not valid or the login is unsuccessful,
				// return the view with validation errors or error message
				TempData["ErrorMessage"] = "A problem occurred. Please check your input.";
				return View(login);
			}
		}



		public IActionResult Signup()
		{
			return View();
		}






			[HttpPost]
		public IActionResult Signup(User user)
		{
			if (ModelState.IsValid)
			{

				User UserExist = _userRepository.GetUserByEmail(user.Email);



				if (UserExist is null)
				{
					_userRepository.AddUser(user);
					// Redirect to Login page
					TempData["Message"] = "Registration was successful. Login here.";
					return RedirectToAction("Login", "Register");



				}
				else
				{
					TempData["ErrorMessage"] = "User Already Exist.";
					return View(user);
				}

			}
			else
			{
				// If the model state is not valid, return the view with validation errors
				TempData["ErrorMessage"] = "A problem occurred. Please check your input.";
				return View(user);
			}
 
		}






	}


}
