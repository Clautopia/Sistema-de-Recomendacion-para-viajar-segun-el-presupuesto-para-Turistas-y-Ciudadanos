//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CRUD_buss.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class viajes
    {
        public Nullable<int> cod_viajes { get; set; }
        public int cod_uni { get; set; }
        public int cod_disp { get; set; }
        public string descripcion { get; set; }
    
        public virtual disponibilidad disponibilidad { get; set; }
        public virtual unidades unidades { get; set; }
    }
}
