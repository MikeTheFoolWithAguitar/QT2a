using System.Data.Entity;
namespace WingtipToys.Models
{
  public class ProductContext : DbContext
  {
    public ProductContext()
          : base("QualifiedTruckers")
    {
    }
    public virtual DbSet<Accident> Accidents { get; set; }
    public virtual DbSet<AlcoholTest> AlcoholTests { get; set; }
    public virtual DbSet<AlcoholViolation> AlcoholViolations { get; set; }
    public virtual DbSet<CollectionSite> CollectionSites { get; set; }
    public virtual DbSet<Company> Companies { get; set; }
    public virtual DbSet<DocStatus> DocStatus { get; set; }
    public virtual DbSet<DocType> DocTypes { get; set; }
    public virtual DbSet<Document> Documents { get; set; }
    public virtual DbSet<DrugTestResult> DrugTestResults { get; set; }
    public virtual DbSet<DrugTestType> DrugTestTypes { get; set; }
    public virtual DbSet<DrugType> DrugTypes { get; set; }
    public virtual DbSet<Employee> Employees { get; set; }
    public virtual DbSet<EndorsementLetter> EndorsementLetters { get; set; }
    public virtual DbSet<EndorsementsAndRestrictions> EndorsementsandRestrictions { get; set; }
    public virtual DbSet<Injury> Injuries { get; set; }
    public virtual DbSet<Laboratory> Laboratories { get; set; }
    public virtual DbSet<Location> Locations { get; set; }
    public virtual DbSet<MedicalReviewOfficer> MedicalReviewOfficers { get; set; }
    public virtual DbSet<Pool> Pools { get; set; }
    public virtual DbSet<PrevEmployer> PrevEmployers { get; set; }
    public virtual DbSet<Program> Programs { get; set; }
    public virtual DbSet<Provider> Providers { get; set; }
    public virtual DbSet<RestrictionLetter> RestrictionLetters { get; set; }
    public virtual DbSet<Security> Security { get; set; }
    public virtual DbSet<State> States { get; set; }
    public virtual DbSet<Training> Trainings { get; set; }
    public virtual DbSet<Vehicle> Vehicles { get; set; }
        
    // 
    public DbSet<Category> Categories { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<CartItem> ShoppingCartItems { get; set; }
    public DbSet<Order> Orders { get; set; }
    public DbSet<OrderDetail> OrderDetails { get; set; }
  }
}