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
    
    public partial class Entertainments
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Entertainments()
        {
            this.Ent_Genre = new HashSet<Ent_Genre>();
            this.Comments = new HashSet<Comments>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Release_Year { get; set; }
        public string Duration { get; set; }
        public string Image_Cover { get; set; }
        public string Item_Type { get; set; }
        public Nullable<int> Director_Id { get; set; }
        public string Ratings { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual Directors Directors { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ent_Genre> Ent_Genre { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comments> Comments { get; set; }
    }
}
