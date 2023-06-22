using MoviesDB.EF;
using X.PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace MoviesDB.Controllers
{
    public class AccountController : Controller
    {
        MoviesDBEntities db = new MoviesDBEntities();


        //[Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            ViewBag.MoviesCount = db.Entertainments.Where(X => X.IsDeleted == false).Count();
            ViewBag.CommentsCount = db.Comments.Count();
            ViewBag.UsersCount = db.Users.Count();
            ViewBag.Movies = db.Entertainments.OrderByDescending(x => x.Ratings).Take(4).ToList();
            ViewBag.Users = db.Users.OrderByDescending(x => x.Created_Date).Take(4).ToList();
            //return View(db.Users.ToList());
            if (Session["UserRole"]?.ToString() == "Admin")
            {
                //return View(db.Users.ToList());
                return View(db.Entertainments.ToList());
            }
            // Create AccessDenied Page
            return RedirectToAction("Unauthorized");
        }
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Register(Users user)
        {
            if (ModelState.IsValid)
            {
                if (!db.Users.Where(u => u.UserName == user.UserName).Any())
                {

                    user.IsActive = false;
                    user.Created_Date = DateTime.Now;
                    user.RoleId = 2; // User Role
                    user.isDeleted = false;
                    db.Users.Add(user);
                    db.SaveChanges();
                    TempData["Succes"] = "User created successfully. It need an approval from the admin.";
                    return View("Login");
                }
                else
                {
                    ViewBag.Error = "There is a user with same username";
                }
            }
            return View();
        }

        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Users user)
        {
            var login = db.Users.Where(x => x.UserName == user.UserName && x.Password == user.Password).FirstOrDefault();
            //var login = Convert.ToBoolean(db.Users.Where(x => x.UserName == user.UserName && x.Password == user.Password).FirstOrDefault());
            if (login != null)
            //if (login)
            {
                if (login.IsActive != false)
                {
                    Session["Id"] = user.Id.ToString();
                    Session["UserName"] = user.UserName.ToString();
                    Session["UserRole"] = login.Roles.RoleName;
                    return RedirectToAction("Index", "Movies");
                }
                else
                {
                    ViewBag.Error = "Contact Admin for Activating the user. ";
                }

            }
            else
            {
                
                ViewBag.Error = "Error Login.";
            }
            return View();
        }
        public ActionResult Logout()
        {
            // Clear the session variables or sign out the user
            Session.Clear(); // Clear all session variables
            Session.Abandon(); // End the session

            // Redirect to the login page or any other desired page
            return RedirectToAction("Index", "Movies"); // Assuming "Login" is the login action and "Account" is the controller name
        }

        public ActionResult Unauthorized()
        {
            return View();
        }

        //public ActionResult _AllUsers(int? page)
        //{
        //    var users = db.Users.ToList();
        //    int pageSize = 5;
        //    int pageNumber = (page ?? 1);

        //    return View(users.ToPagedList(pageNumber, pageSize));
        //}
        public ActionResult _AllUsers()
        {
            return PartialView("_AllUsers", db.Users.ToList());
        }

        // Activate User
        [HttpPost]
        public ActionResult ActivateOrDeactivateUser(int userId, bool isActivated)
        {
            try
            {
                // Retrieve the user from the database
                var user = db.Users.Find(userId);
                //var user = db.Users.Where(x => x.Id == userId).FirstOrDefault();

                if (user != null)
                {
                    // Update the user's "isActivated" property
                    user.IsActive = !isActivated;

                    db.Entry(user).State = EntityState.Modified;
                    // Save changes to the database
                    db.SaveChanges();

                    // Return a success response
                    return Json(new { success = true });
                    //return PartialView("_AllUsers", db.Users.ToList());
                }
                else
                {
                    // Return an error response if the user is not found
                    return Json(new { success = false, message = "User not found." });
                }
            }
            catch (Exception ex)
            {
                // Handle the exception and return an error response
                return Json(new { success = false, message = "Error activating user: " + ex.Message });
            }
        }

        public ActionResult _GetAllMovies()
        {
            return PartialView("_GetAllMovies", db.Entertainments.ToList().Where(x => x.IsDeleted == false));
        }

        public ActionResult _GetDashboard()
        {
            ViewBag.MoviesCount = db.Entertainments.Where(X => X.IsDeleted == false).Count();
            ViewBag.CommentsCount = db.Comments.Count();
            ViewBag.UsersCount = db.Users.Count();
            ViewBag.Movies = db.Entertainments.OrderByDescending(x => x.Ratings).Take(4).ToList();
            ViewBag.Users = db.Users.OrderByDescending(x => x.Created_Date).Take(4).ToList();

            return PartialView("_GetDashboard");
        }

        public ActionResult _TopMovies()
        {

            return PartialView("_TopMovies");
        }
        
        //public ActionResult _ToComments()
        //{

        //    return PartialView("_TopComments", db.Comments.OrderByDescending(x => x.CreationDate).Take(4).ToList());
        //}
        public ActionResult _LatestUsers()
        {
            return PartialView("_LatestUsers");
        }
    }
}