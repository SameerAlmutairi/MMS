using MoviesDB.EF;
using MoviesDB.ViewModels;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MoviesDB.Controllers
{
    public class MoviesController : Controller
    {
        MoviesDBEntities db = new MoviesDBEntities();
        // GET: Movies
        public ActionResult Index()
        {
            return View(db.Entertainments.Where(x => x.IsDeleted == false).ToList());
        }

        // Search for Specific Movie
        public ActionResult _MoviesCatalog(string searchTerm)
        {
            var searchResults = db.Entertainments.Where(m => m.Title.Contains(searchTerm)).Where(x => x.IsDeleted == false).ToList();
            //return PartialView("_MoviesCatalog", searchResults);
            return PartialView("_MoviesCatalogPartial", searchResults);
        }
        // --------------------  sulaiman
        public ActionResult Create()
        {

            ViewBag.genres = new SelectList(db.Genres.Where(x => x.IsDeleted == false), "Id", "Name");
            ViewBag.directors = new SelectList(db.Directors.Where(x => x.isDeleted == false), "Id", "Name");
            //return View();

            // TODO: Need to Fix the Genre to multiple select
            if (Session["UserRole"]?.ToString() == "Admin")
            {
                //    return View(db.Users.ToList());
                //    return View(db.Entertainments.ToList());
                return View();

            }
            //Create AccessDenied Page
            return RedirectToAction("Unauthorized", "Account");

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        //public ActionResult Create(Entertainments entertainments, HttpPostedFileBase Image_Cover, List<string> genre, string director)
        public ActionResult Create([Bind(Include = "Title, Description, Release_Year, Duration, Image_Cover, Ratings")] Entertainments entertainments, HttpPostedFileBase Image_Cover, List<string> genre)
        {
            
            if (ModelState.IsValid)
            {
                var addimg = ProcessImageFile(Image_Cover);
                if (addimg == false)
                {
                    // message that the image is not saved.
                    return View(entertainments);
                }
                
                //entertainments.Director_Id = db.Directors.Where(x => x.Name.Contains(director)).FirstOrDefault().Id;
                entertainments.Image_Cover = Image_Cover.FileName;
                db.Entertainments.Add(entertainments);
                db.SaveChanges();
                int newId = entertainments.Id;

                
                foreach(var genreName in genre)
                {
                    Genres genres = db.Genres.FirstOrDefault(g => g.Name == genreName);
                    var movieGenree = new Ent_Genre
                    {
                        Entertainment_Id = newId,
                        Genre_Id = genres.Id
                    };
                    db.Ent_Genre.Add(movieGenree);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }

            ViewBag.genres = new SelectList(db.Genres.Where(x => x.IsDeleted == false), "Id", "Name");
            ViewBag.directors = new SelectList(db.Directors.Where(x => x.isDeleted == false), "Id", "Name");
            return View(entertainments);
        }

        private bool ProcessImageFile(HttpPostedFileBase imageFile)
        {
            if (imageFile != null && imageFile.ContentLength > 0)
            {
                string fileName = Path.GetFileName(imageFile.FileName);
                string filePath = Path.Combine(Server.MapPath("~/Content/images/movies/"), fileName);
                imageFile.SaveAs(filePath);
                return true;
            }
            return false;
        }
        // GET: Movies/Details/2
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            //var entertainments = db.Entertainments.Find(id);
            var entertainments = db.Entertainments.Where(x => x.IsDeleted == false).FirstOrDefault(m => m.Id == id);
            if (entertainments == null)
            {
                return HttpNotFound();
            }
            //var entertainment = db.Entertainments.Find(id).Where(x => x.IsDeleted == false);
            var comments = db.Comments.Where(c => c.EntertainmentId == id).Include(r => r.Users).ToList();

            //var pagedMovieComments = comments.ToPagedList(1, 4);

            var viewModel = new MovieCommentsViewModel
            {
                Entertainment = entertainments,
                Comments = comments
                //Comments = comments
            };

            //return View(entertainments);
            return View(viewModel);
        }
    }
}