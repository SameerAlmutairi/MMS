//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MoviesDB.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comments
    {
        public int Id { get; set; }
        public string Comment { get; set; }
        public int EntertainmentId { get; set; }
        public Nullable<int> UserId { get; set; }
        public int ReplyId { get; set; }
        public Nullable<int> LikesCount { get; set; }
        public Nullable<int> DisLikesCount { get; set; }
        public Nullable<System.DateTime> CreationDate { get; set; }
    
        public virtual Entertainments Entertainments { get; set; }
        public virtual Users Users { get; set; }
    }
}
