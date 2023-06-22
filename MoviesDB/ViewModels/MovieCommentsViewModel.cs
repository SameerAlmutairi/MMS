using MoviesDB.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MoviesDB.ViewModels
{
    public class MovieCommentsViewModel
    {
        public Entertainments Entertainment { get; set; }
        //public IPagedList<Comments> Comments { get; set; }
        public IList<Comments> Comments { get; set; }
    }
}