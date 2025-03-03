using System.Collections.Generic;
using System.Data.Entity;

namespace WingtipToys.Models
{
  public class ProductDatabaseInitializer : DropCreateDatabaseIfModelChanges<ProductContext>
  {
    protected override void Seed(ProductContext context)
    {
        GetPrograms().ForEach(y => context.Programs.Add(y));
        //GetCompanies().ForEach(x => context.Companies.Add(x));
        // Companies does not work, the ProgID foreign key blocks it
      GetCategories().ForEach(c => context.Categories.Add(c));
      GetProducts().ForEach(p => context.Products.Add(p));
      GetEmployees().ForEach(e => context.Employees.Add(e));
      GetDocStatus().ForEach(d => context.DocStatus.Add(d));
      GetDocType().ForEach(a => context.DocTypes.Add(a));
    }
    private static List<Employee> GetEmployees()
    {
        var employees = new List<Employee> {
                new Employee
                {
        // it is ignoring the EmployeeID and it is assigning a new one
        // when EmployeeID is the primary key.
                    EmployeeID = 3,
                    FName = "Test First Name1",
                    LName = "Test Last Name1",
                    SSNo = "999999999",
                    CompID=1,
                    BirthDate = System.DateTime.Today,
                    LastUpdated = System.DateTime.Now
                },
                new Employee
                {
                    EmployeeID = 4,
                    FName = "Test First Name2",
                    LName = "Test Last Name2",
                    SSNo = "999999998",
                    CompID=2,
                    BirthDate = System.DateTime.Today,
                    LastUpdated = System.DateTime.Now
                },
            };
        return employees;
    }
    private static List<Program> GetPrograms()
    {
        var programs = new List<Program> {
                new Program
                {
        // it is ignoring the EmployeeID and it is assigning a new one
        // when EmployeeID is the primary key.
                    ProgID = 3,
                    ProgName="Test Program Name1",
                },
                new Program
                {
                    ProgID = 4,
                    ProgName="Test Program Name2",
                },
            };
        return programs;
    }
    private static List<Company> GetCompanies()
    {
        var companies = new List<Company> {
                new Company
                {
        // it is ignoring the CompID and it is assigning a new one
        // when CompID is the primary key.
                    CompID=1,
                    CompanyName = "Test Company Name1",
                    ProgID=1,
                },
                new Company
                {
                    CompID=2,
                    CompanyName = "Test Company Name2",
                    ProgID=1,
                },
            };
        return companies;
    }
    private static List<DocStatus> GetDocStatus()
    {
        var docstatus = new List<DocStatus> {
                new DocStatus
                {
                    Status = "CR",
                    Description = "Reviewed By Client"
                },
                new DocStatus
                {
                    Status = "E",
                    Description = "Exempt (Note Required)"
                },
                new DocStatus
                {
                    Status = "G",
                    Description = "Grandfathered"
                },
                new DocStatus
                {
                    Status = "I",
                    Description = "Incomplete"
                },
                new DocStatus
                {
                    Status = "PR",
                    Description = "Post Reviewed by RSI"
                },
                new DocStatus
                {
                    Status = "R",
                    Description = "Reviewed by RSI"
                },
            };
        return docstatus;
    }
    private static List<DocType> GetDocType()
    {
        var doctype = new List<DocType> {
                // going to have to add this doctype manually so
                // g200 starts off at one. Its ok if this is deleted
                // or put at 29 since there are only a few old documents
                // of this type. So maybe just delete and dont copy over
                // those records and make it 29.
                //new DocType
                //{
                //    DocTypeID = 0,
                //    DocumentType = "Regs", 
                //    Description = "Regulations"
                //}, 
                new DocType
                {
                    DocTypeID = 1,
                    DocumentType = "G200",
                    Description = "G200 MCS-90(part 387)"
                }, new DocType {
                    DocTypeID = 2,
                    DocumentType = "G300",
                    Description = "G300 Employment History Investigation"
                }, new DocType {
                    DocTypeID = 3,
                    DocumentType = "G310",
                    Description = "G310 Criminal Investigations"
                }, new DocType {
                    DocTypeID = 4,
                    DocumentType = "I-9",
                    Description = "I-9 IRS Form I-9"
                }, new DocType {
                    DocTypeID = 5,
                    DocumentType = "W-2",
                    Description = "W-2 IRS Form W-2"
                }, new DocType {
                    DocTypeID = 6,
                    DocumentType = "Insurance",
                    Description = "Insurance Enrollment Form"
                }, new DocType {
                    DocTypeID = 7,
                    DocumentType = "Safety",
                    Description = "Company Safety Training"
                }, new DocType {
                    DocTypeID = 8,
                    DocumentType = "Q200",
                    Description = "Employment Application for CMV Drivers"
                }, new DocType {
                    DocTypeID = 9,
                    DocumentType = "Q300",
                    Description = "Pre Employment Investigation Job History"
                }, new DocType {
                    DocTypeID = 10,
                    DocumentType = "R355",
                    Description = "Current Driver List Review/Update"
                }, new DocType {
                    DocTypeID = 11,
                    DocumentType = "S300",
                    Description = "SAP Evaluation"
                }, new DocType {
                    DocTypeID = 12,
                    DocumentType = "Q335",
                    Description = "Driver Receipt of Federal Motor Carrier Safety Regulations"
                }, new DocType {
                    DocTypeID = 13,
                    DocumentType = "Q340",
                    Description = "Drivers Pre Employment Statement of On-Duty Time"
                }, new DocType {
                    DocTypeID = 14,
                    DocumentType = "Q610",
                    Description = "Certification of Road Test"
                }, new DocType {
                    DocTypeID = 15,
                    DocumentType = "Q700",
                    Description = "Physical Exam Form"
                }, new DocType {
                    DocTypeID = 16,
                    DocumentType = "Q900",
                    Description = "Driver's License"
                }, new DocType {
                    DocTypeID = 17,
                    DocumentType = "I210",
                    Description = "DOT Drug and Alcohol Investigation Results"
                }, new DocType {
                    DocTypeID = 18,
                    DocumentType = "I315",
                    Description = "Pre Employment Drug Test Results"
                }, new DocType {
                    DocTypeID = 19,
                    DocumentType = "I400",
                    Description = "Receipt of Drug and Alcohol Testing Policy "
                }, new DocType {
                    DocTypeID = 20,
                    DocumentType = "I500",
                    Description = "Receipt of Drug and Alcohol Testing Training "
                }, new DocType {
                    DocTypeID = 21,
                    DocumentType = "Q400",
                    Description = "Annual Motor Vehicle Record"
                }, new DocType {
                    DocTypeID = 22,
                    DocumentType = "I610",
                    Description = "Drug and/or Alcohol Test Supervisor Notification"
                }, new DocType {
                    DocTypeID = 23,
                    DocumentType = "Q500",
                    Description = "Annual Statement of Violations"
                }, new DocType {
                    DocTypeID = 24,
                    DocumentType = "Q600",
                    Description = "Road Test Card"
                }, new DocType {
                    DocTypeID = 25,
                    DocumentType = "Q800",
                    Description = "Medical Card"
                }, new DocType {
                    DocTypeID = 26,
                    DocumentType = "I615",
                    Description = "Random Drug Test Result"
                }, new DocType {
                    DocTypeID = 27,
                    DocumentType = "T255",
                    Description = "Company Policy Questions and Answers"
                }, new DocType {
                    DocTypeID = 28,
                    DocumentType = "IRS1040",
                    Description = "IRS 1040 IRS Form 1040"
                },
            };
        return doctype;
    }
    private static List<Category> GetCategories()
    {
      var categories = new List<Category> {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Individuals"
                },
                new Category
                {
                    CategoryID = 2,
                    CategoryName = "Companies"
                },
                //new Category
                //{
                //    CategoryID = 1,
                //    CategoryName = "Cars"
                //},
                //new Category
                //{
                //    CategoryID = 2,
                //    CategoryName = "Planes"
                //},
                //new Category
                //{
                //    CategoryID = 3,
                //    CategoryName = "Trucks"
                //},
                //new Category
                //{
                //    CategoryID = 4,
                //    CategoryName = "Boats"
                //},
                //new Category
                //{
                //    CategoryID = 5,
                //    CategoryName = "Rockets"
                //},
            };

      return categories;
    }
    private static List<Product> GetProducts()
    {
      var products = new List<Product> {
                new Product
                {
                    ProductID = 1,
                    ProductName = "Individuals Driver Qualification File",
                    Description = "Having a complete Driver Qualification File is important to show a driver has all of the DOT required documents including " + 
                                  "Application for Employment, Previous Employer Investigation, Annual Motor Vehicle Record, Annual Statement of Violations, Certification of Road Test, Medical Card and Drivers License", 
                    ImagePath="truckearly.png",
                    UnitPrice = 9.99,
                    CategoryID = 1
               },
                new Product
                {
                    ProductID = 2,
                    ProductName = "Individuals Drug and Alcohol Testing File",
                    Description = "Complete your Drug and Alcohol Testing File to show employers you are drug and alcohol free " + 
                                  "and are up to date with the latest testing policies and procedures", 
                    ImagePath="truckbig.png",
                    UnitPrice = 9.99,
                    CategoryID = 1
               },
                new Product
                {
                    ProductID = 3,
                    ProductName = "Individuals Random Selection Pool",
                    Description = "Become a member and be placed into a Random Selection Pool to be selected for Drug and Alcohol Testing " + 
                                  "to satisfy DOT requirements.", 
                    ImagePath="truckfire.png",
                    UnitPrice = 19.99,
                    CategoryID = 1
               },
                new Product
                {
                    ProductID = 4,
                    ProductName = "Individuals Third Party Drug and Alcohol Administration",
                    Description = "Sign up for the complete package to include Driver Qualification File, Drug and Alcohol Testing File, Random Selection Pool, Compliance Procedures and Forms, and Training " + 
                                  "to satisfy DOT requirements.", 
                    ImagePath="truckearly.png",
                    UnitPrice = 99.99,
                    CategoryID = 1
               },
                new Product
                {
                    ProductID = 5,
                    ProductName = "Third Party Software",
                    Description = "Use our software to run your company. Pay as you go, only pay for what you use. " + 
                                  "Avoid website headaches, we do the maintenance for you.", 
                    ImagePath="rocket.png",
                    UnitPrice = 999.99,
                    CategoryID = 2
               },
                new Product
                {
                    ProductID = 6,
                    ProductName = "Company Driver Qualification File",
                    Description = "Having a complete Driver Qualification File is important to show a driver has all of the DOT required documents including " + 
                                  "Application for Employment, Previous Employer Investigation, Annual Motor Vehicle Record, Annual Statement of Violations, Certification of Road Test, Medical Card and Drivers License", 
                    ImagePath="truckearly.png",
                    UnitPrice = 9.99,
                    CategoryID = 2
               },
                new Product
                {
                    ProductID = 7,
                    ProductName = "Company Drug and Alcohol Testing File",
                    Description = "Complete your Drug and Alcohol Testing File to show employers you are drug and alcohol free " + 
                                  "and are up to date with the latest testing policies and procedures", 
                    ImagePath="truckbig.png",
                    UnitPrice = 9.99,
                    CategoryID = 2
               },
                new Product
                {
                    ProductID = 8,
                    ProductName = "Company Random Selection Pool",
                    Description = "Become a member and be placed into a Random Selection Pool to be selected for Drug and Alcohol Testing " + 
                                  "to satisfy DOT requirements.", 
                    ImagePath="truckfire.png",
                    UnitPrice = 19.99,
                    CategoryID = 2
               },
                new Product
                {
                    ProductID = 9,
                    ProductName = "Company Third Party Drug and Alcohol Administration",
                    Description = "Sign up for the complete package to include Driver Qualification File, Drug and Alcohol Testing File, Random Selection Pool, Compliance Procedures and Forms, and Training " + 
                                  "to satisfy DOT requirements.", 
                    ImagePath="truckearly.png",
                    UnitPrice = 99.99,
                    CategoryID = 2
               },
               // new Product
               // {
               //     ProductID = 1,
               //     ProductName = "Convertible Car",
               //     Description = "This convertible car is fast! The engine is powered by a neutrino based battery (not included)." + 
               //                   "Power it up and let it go!", 
               //     ImagePath="carconvert.png",
               //     UnitPrice = 22.50,
               //     CategoryID = 1
               //},
               // new Product 
               // {
               //     ProductID = 2,
               //     ProductName = "Old-time Car",
               //     Description = "There's nothing old about this toy car, except it's looks. Compatible with other old toy cars.",
               //     ImagePath="carearly.png",
               //     UnitPrice = 15.95,
               //      CategoryID = 1
               //},
               // new Product
               // {
               //     ProductID = 3,
               //     ProductName = "Fast Car",
               //     Description = "Yes this car is fast, but it also floats in water.",
               //     ImagePath="carfast.png",
               //     UnitPrice = 32.99,
               //     CategoryID = 1
               // },
               // new Product
               // {
               //     ProductID = 4,
               //     ProductName = "Super Fast Car",
               //     Description = "Use this super fast car to entertain guests. Lights and doors work!",
               //     ImagePath="carfaster.png",
               //     UnitPrice = 8.95,
               //     CategoryID = 1
               // },
               // new Product
               // {
               //     ProductID = 5,
               //     ProductName = "Old Style Racer",
               //     Description = "This old style racer can fly (with user assistance). Gravity controls flight duration." + 
               //                   "No batteries required.",
               //     ImagePath="carracer.png",
               //     UnitPrice = 34.95,
               //     CategoryID = 1
               // },
               // new Product
               // {
               //     ProductID = 6,
               //     ProductName = "Ace Plane",
               //     Description = "Authentic airplane toy. Features realistic color and details.",
               //     ImagePath="planeace.png",
               //     UnitPrice = 95.00,
               //     CategoryID = 2
               // },
               // new Product
               // {
               //     ProductID = 7,
               //     ProductName = "Glider",
               //     Description = "This fun glider is made from real balsa wood. Some assembly required.",
               //     ImagePath="planeglider.png",
               //     UnitPrice = 4.95,
               //     CategoryID = 2
               // },
               // new Product
               // {
               //     ProductID = 8,
               //     ProductName = "Paper Plane",
               //     Description = "This paper plane is like no other paper plane. Some folding required.",
               //     ImagePath="planepaper.png",
               //     UnitPrice = 2.95,
               //     CategoryID = 2
               // },
               // new Product
               // {
               //     ProductID = 9,
               //     ProductName = "Propeller Plane",
               //     Description = "Rubber band powered plane features two wheels.",
               //     ImagePath="planeprop.png",
               //     UnitPrice = 32.95,
               //     CategoryID = 2
               // },
               // new Product
               // {
               //     ProductID = 10,
               //     ProductName = "Early Truck",
               //     Description = "This toy truck has a real gas powered engine. Requires regular tune ups.",
               //     ImagePath="truckearly.png",
               //     UnitPrice = 15.00,
               //     CategoryID = 3
               // },
               // new Product
               // {
               //     ProductID = 11,
               //     ProductName = "Fire Truck",
               //     Description = "You will have endless fun with this one quarter sized fire truck.",
               //     ImagePath="truckfire.png",
               //     UnitPrice = 26.00,
               //     CategoryID = 3
               // },
               // new Product
               // {
               //     ProductID = 12,
               //     ProductName = "Big Truck",
               //     Description = "This fun toy truck can be used to tow other trucks that are not as big.",
               //     ImagePath="truckbig.png",
               //     UnitPrice = 29.00,
               //     CategoryID = 3
               // },
               // new Product
               // {
               //     ProductID = 13,
               //     ProductName = "Big Ship",
               //     Description = "Is it a boat or a ship. Let this floating vehicle decide by using its " + 
               //                   "artifically intelligent computer brain!",
               //     ImagePath="boatbig.png",
               //     UnitPrice = 95.00,
               //     CategoryID = 4
               // },
               // new Product
               // {
               //     ProductID = 14,
               //     ProductName = "Paper Boat",
               //     Description = "Floating fun for all! This toy boat can be assembled in seconds. Floats for minutes!" + 
               //                   "Some folding required.",
               //     ImagePath="boatpaper.png",
               //     UnitPrice = 4.95,
               //     CategoryID = 4
               // },
               // new Product
               // {
               //     ProductID = 15,
               //     ProductName = "Sail Boat",
               //     Description = "Put this fun toy sail boat in the water and let it go!",
               //     ImagePath="boatsail.png",
               //     UnitPrice = 42.95,
               //     CategoryID = 4
               // },
               // new Product
               // {
               //     ProductID = 16,
               //     ProductName = "Rocket",
               //     Description = "This fun rocket will travel up to a height of 200 feet.",
               //     ImagePath="rocket.png",
               //     UnitPrice = 122.95,
               //     CategoryID = 5
               // }
            };

      return products;
    }
  }
}