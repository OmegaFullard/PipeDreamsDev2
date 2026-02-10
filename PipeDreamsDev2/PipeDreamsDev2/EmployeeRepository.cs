using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PipeDreamsDev2
{
    public partial class Employee
    {
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Title { get; set; } 
        public string Location { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string PhotoUrl { get; set; }
        public string Bio { get; set; }

        public string FullName => $"{FirstName} {LastName}";
    }
    public class EmployeeRepository
    {
        // Replace with DB calls as needed.
        public static List<Employee> GetAll()
        {
            return new List<Employee>
            {
                new Employee
                {
                    EmployeeId = 1,
                    FirstName = "Lola",
                    LastName = "James",
                    Title = "Director of Operations",
                    Location = "Downtown Royal City, PA",
                    Phone = "(555) 123-4567",
                    Email = "Lola.James@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/lola.png"),
                    Bio = "Lola leads client operations and ensures package offerings meet expectations."
                },
                new Employee
                {
                    EmployeeId = 2,
                    FirstName = "Bill",
                    LastName = "Gully",
                    Title = "Senior Developer",
                    Location = "Downtown Royal City, PA",
                    Phone = "(555) 987-6543",
                    Email = "Bill.Gully@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/bill.png"),
                    Bio = "Bill specializes in project management and software development."
                },
                new Employee
                {
                    EmployeeId = 3,
                    FirstName = "Nicole",
                    LastName = "Rappenport",
                    Title = "UI/UX Designer",
                    Location = "Royal City, PA",
                    Phone = "(555) 555-1212",
                    Email = "Nicole.Rappenport@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/nicole.jpg"),
                    Bio = "Nicole designs user-friendly interfaces and enhances user experiences."
                },
                new Employee
                {
                    EmployeeId = 4,
                    FirstName = "Jessie",
                    LastName = "Baker",
                    Title = "Marketing Specialist",
                    Location = "Midtown Royal City, PA",
                    Phone = "(555) 123-4567",
                    Email = "Jessie.Baker@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/jessie.png"),
                    Bio = "Jessie specializes in digital marketing strategies."
                },
                new Employee
                {
                    EmployeeId = 5,
                    FirstName = "Lilith",
                    LastName = "Carlton",
                    Title = "Senior Data Analyst",
                    Location = "Midtown Royal City, PA",
                    Phone = "(555) 987-6543",
                    Email = "Lilith.Carlton@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/lilith.png"),
                    Bio = "Lilith specializes in data analysis and visualization."
                },
                new Employee
                {
                    EmployeeId = 6,
                    FirstName = "Kannady",
                    LastName = "Linberg",
                    Title = "Technical Support Specialist",
                    Location = "Royal City, PA",
                    Phone = "(555) 555-1212",
                    Email = "Kannady.Linberg@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/kannady.png"),
                    Bio = "Kannady specializes in technical support and customer service."
                },

                new Employee
                {
                    EmployeeId = 7,
                    FirstName = "Skylar",
                    LastName = "Olstein",
                    Title = "Product Manager",
                    Location = "Uptown Royal City, PA",
                    Phone = "(555) 123-4567",
                    Email = "Skylar.Olstein@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/skylar.png"),
                    Bio = "Skylar oversees product development and manages cross-functional teams."
                },
                new Employee
                {
                    EmployeeId = 8,
                    FirstName = "Adam",
                    LastName = "Black",
                    Title = "Director of Sales and Marketing",
                    Location = "Midtown Royal City, PA",
                    Phone = "(555) 987-6543",
                    Email = "Adam.Black@pipedreamsdev.com",
                    PhotoUrl = VirtualPaths.EmployeePhoto("images/adam.png"),
                    Bio = "Marcus specializes in advertisement and marketing strategies."
                },
            };
        }

        public static Employee GetById(int id)
        {
            return GetAll().Find(e => e.EmployeeId == id);
        }
    }

    // Small helper to create app-rooted virtual paths consistently.
    internal static class VirtualPaths
    {
        public static string EmployeePhoto(string relativePath)
        {
            // Ensure path starts with /
            if (string.IsNullOrWhiteSpace(relativePath)) return "/images/employee-placeholder.png";
            return relativePath.StartsWith("~") ? relativePath.Substring(1) : (relativePath.StartsWith("/") ? relativePath : "/" + relativePath);
        }
    }
}