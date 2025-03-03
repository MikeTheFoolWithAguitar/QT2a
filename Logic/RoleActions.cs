// 3/15/15 Updated By Mike
// Added roles Client and RSI.
// Set the UserName and Password for the canEdit role. 
// canEdit role will be left as is and only be used to handle the products.
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WingtipToys.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace WingtipToys.Logic
{
    internal class RoleActions
    {
        internal void AddUserAndRole()
        {
            // Access the application context and create result variables.
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the ApplicationDbContext object. 
            // The RoleStore is only allowed to contain IdentityRole objects.
            var roleStore = new RoleStore<IdentityRole>(context);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Then, you create the "canEdit" role if it doesn't already exist.
            // UPDATE we will keep this role and use it just for the products
            if (!roleMgr.RoleExists("canEdit"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "canEdit" });
            }

            // UPDATE there are 2 additional roles: RSI and Client
            if (!roleMgr.RoleExists("RSI"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "RSI" });
            }
            if (!roleMgr.RoleExists("Client"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "Client" });
            }

            // Create a UserManager object based on the UserStore object and the ApplicationDbContext  
            // object. Note that you can create new objects and use them as parameters in
            // a single line of code, rather than using multiple lines of code, as you did
            // for the RoleManager object.
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            {
                UserName = "help@qualifiedtruckers.com",
                Email = "help@qualifiedtruckers.com"
            };
            IdUserResult = userMgr.Create(appUser, "Qqqqqq1!");

            // If the new "canEdit" user was successfully created, 
            // add the "canEdit" user to the "canEdit" role. 
            if (!userMgr.IsInRole(userMgr.FindByEmail("help@qualifiedtruckers.com").Id, "canEdit"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("help@qualifiedtruckers.com").Id, "canEdit");
            }
        }
    }
}