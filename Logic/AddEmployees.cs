// this will write into the employee table
// 

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WingtipToys.Models;

namespace WingtipToys.Logic
{
    public class AddEmployees
    {
        // add a single employee into the new DB.
        public bool AddEmployee(string EmployeeID, string CompID, string FName, string LName, string MInitial, string SSNo, string Title, string CDLDriver, string CMVDriver, string LicenseSt, string LicenseNo, string LicenseClass, string Sex, string BirthDate, string AirBrakeRestr, string Notes, string Address, string City, string State, string ZipCode, string HPhone, string UpdatedBy, string LastUpdated)
        {
            var myEmployee = new Employee();

            // this is working except it is ignoring the EmployeeID and 
            // creating a new one on it's own when employeeid is the primary key
            //
            // it is ignoring the next line when employeeid is the primay key
            myEmployee.EmployeeID = Convert.ToInt32(EmployeeID);
            myEmployee.CompID = Convert.ToInt32(CompID);
            myEmployee.FName = FName;
            myEmployee.LName = LName;
            if (MInitial != "") { myEmployee.MInitial = MInitial; }
            myEmployee.SSNo = SSNo;
            if (Title != "") { myEmployee.Title = Title; }
            if (CDLDriver != "") { myEmployee.CDLdriver = bool.Parse(CDLDriver); }
            if (CMVDriver != "") { myEmployee.CMVdriver = bool.Parse(CMVDriver); }
            if (LicenseSt != "") { myEmployee.LicSt = LicenseSt; }
            if (LicenseNo != "") { myEmployee.LicenseNo = LicenseNo; }
            if (LicenseClass != "") { myEmployee.LicenseClass = LicenseClass; }
            if (Sex != "") { myEmployee.Sex = bool.Parse(Sex); }
            if (BirthDate != "") { myEmployee.BirthDate = DateTime.Parse(BirthDate); }
            if (AirBrakeRestr != "") { myEmployee.AirBrakeRestr = bool.Parse(AirBrakeRestr); }
            if (Notes != "") { myEmployee.Notes = Notes; }
            if (Address != "") { myEmployee.Address1 = Address; }
            if (City != "") { myEmployee.City1 = City; }
            if (State != "") { myEmployee.State1 = State; }
            if (ZipCode != "") { myEmployee.ZipCode1 = ZipCode; }
            if (HPhone != "") { myEmployee.PhoneNo1 = HPhone; }
            if (UpdatedBy != "") { myEmployee.UpdatedBy = UpdatedBy; }
            if (LastUpdated != "") { myEmployee.LastUpdated = DateTime.Parse(LastUpdated); }

            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.Employees.Add(myEmployee);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }// end add employee

        // add a single document into the new DB.
        public bool AddDocument(string DocID, string EmployeeID, string CompanyID, string Doc_Type, string ExpirationDate, string DateCreated, string FileName, string Notes, string DateReviewed, string Location, string Status, string Doc_Format, string Reviewer, string Completed, string Doc_Order, string UpdatedBy, string LastUpdated)
        {
            var myDocument = new Document();
            //
            // its working but stopping on the first record that has an
            // EmployeeID thats not in the employees table becuase of the
            // foreign key constraint. Have to load all of the employees first.

            // it is ignoring the next line when docid is the primay key
            myDocument.DocID = Convert.ToInt32(DocID);
            myDocument.EmployeeID = Convert.ToInt32(EmployeeID);
            myDocument.CompanyID = Convert.ToInt32(CompanyID);
            myDocument.DocTypeID = Convert.ToInt32(Doc_Type);
            if (ExpirationDate != "") { myDocument.ExpirationDate = DateTime.Parse(ExpirationDate); }
            if (DateCreated != "") { myDocument.DateCreated = DateTime.Parse(DateCreated); }
            if (FileName != "") { myDocument.FileName = FileName; }
            if (Notes != "") { myDocument.Notes = Notes; }
            if (DateReviewed != "") { myDocument.DateReviewed = DateTime.Parse(DateReviewed); }
            if (Location != "") { myDocument.Location = Location; }
            if (Status != "") { myDocument.Status = Status; }
            if (Doc_Format != "") { myDocument.DocFormat = Doc_Format; }
            if (Reviewer != "") { myDocument.Reviewer = Reviewer; }
            if (Completed != "") { myDocument.Completed = bool.Parse(Completed); }
            if (Doc_Order != "") { myDocument.DocOrder = Convert.ToInt32(Doc_Order); }
            if (UpdatedBy != "") { myDocument.UpdatedBy = UpdatedBy; }
            if (LastUpdated != "") { myDocument.LastUpdated = DateTime.Parse(LastUpdated); }
 
            using (ProductContext _db = new ProductContext())
            {
                // Add product to DB.
                _db.Documents.Add(myDocument);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }// end add document
    }
}
