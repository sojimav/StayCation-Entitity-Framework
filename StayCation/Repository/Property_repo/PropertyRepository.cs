using Hotel.Models;

namespace Hotel.Repository.Property_repo
{
    public class PropertyRepository : IPropertyRepository
    {

        private readonly VictorDbContext _propertydbContext;
        public PropertyRepository(VictorDbContext dbContext)
        {
            _propertydbContext = dbContext;
        }






        //public Property GetHotelById(int id)
        //{
        //    return _propertydbContext.Hotels.FirstOrDefault(hotel => hotel.HotelId == id);
        //}






        public List<Property> GetHotels()
        {
            return _propertydbContext.Hotels.ToList();
        }
    }
}
