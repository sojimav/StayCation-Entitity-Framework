using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Hotel.Models;

public partial class User
{
    public int Id { get; set; }


	[Required]
	public string FullName { get; set; } = null!;

	[Required]
	[EmailAddress]
	public string Email { get; set; } = null!;

	[Required]
	public string Password { get; set; } = null!;
}
