using MoviesDB.EF;
using MoviesDB.ViewModels;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MoviesDB.Controllers
{
    public class CommentsController : Controller
    {
        MoviesDBEntities db = new MoviesDBEntities();
        // GET: Comments
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult _GetMovieComments(int id)/*, int? page*/
        {
            var movieComments = db.Comments.Where(x => x.EntertainmentId == id).Where(r => r.ReplyId == 0).ToList();

            // Set the page number and items per page
            //int pageNumber = page ?? 1;
            //int pageSize = 10;

            // Create the PagedList instance
            //var pagedMovieComments = movieComments.ToPagedList(pageNumber, pageSize);

            // Create the PaginationViewModel
            //var pagedMovieCommentsviewModel = new PaginationViewModel<Comments>
            //{
            //    Items = pagedMovieComments,
            //    CurrentPage = pageNumber,
            //    TotalPages = pagedMovieComments.TotalItemCount
            //};

            //return PartialView("_GetMovieComments", pagedMovieComments.ToPagedList(pageNumber, pageSize));
            //return PartialView("_GetMovieComments", pagedMovieCommentsviewModel);
            return PartialView("~/Views/Comments/_GetMovieComments.cshtml", movieComments);

        }

        [HttpPost]
        public ActionResult AddComment(int id, string text)
        {
            // Save the comment to the database
            // You can access the comment text from the "text" parameter
            var user = Session["UserName"].ToString();
            var userId = db.Users.Where(x => x.UserName == user).FirstOrDefault().Id;
            var comment = new Comments
            {
                EntertainmentId = id,
                UserId = userId,
                Comment = text,
                ReplyId = 0,
                CreationDate = DateTime.Now
            };

            // Save the comment to the database
            db.Comments.Add(comment);
            db.SaveChanges();

            // Redirect back to the original page or perform any other action
            return RedirectToAction("Details", "Movies", new { id = id });
        }
    }
}