//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------
using System.ComponentModel.DataAnnotations;
namespace CRUD_buss.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class clientes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public clientes()
        {
            this.reservar = new HashSet<reservar>();
        }
    
        public int codigo_cli { get; set; }
        [Required]
        public string nombre_cli { get; set; }
        public string apellidos_cli { get; set; }
        public string direccion_cli { get; set; }
        public string dni_cli { get; set; }
        public string telefono_cli { get; set; }
        public string usuario_cli { get; set; }
        public string clave_cli { get; set; }
        [DataType(DataType.Date)]
        [Display(Name ="Fecha de NACI")]
        [DisplayFormat(DataFormatString ="{0:dd-MM-yyyy}",ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> fecha_cli { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<reservar> reservar { get; set; }
    }
}
