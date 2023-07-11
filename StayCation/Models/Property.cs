using System;
using System.Collections.Generic;

namespace Hotel.Models;

public partial class Property
{
    public string Group { get; set; } = null!;

    public string Image { get; set; } = null!;

    public string Price { get; set; } = null!;

    public string NameOfProp { get; set; } = null!;

    public string Location { get; set; } = null!;

    public string? Popularity { get; set; }
}
