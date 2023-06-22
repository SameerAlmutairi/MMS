using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MoviesDB.ViewModels
{
    public class PaginationViewModel<T>
    {
        public IPagedList<T> Items { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
    }
}