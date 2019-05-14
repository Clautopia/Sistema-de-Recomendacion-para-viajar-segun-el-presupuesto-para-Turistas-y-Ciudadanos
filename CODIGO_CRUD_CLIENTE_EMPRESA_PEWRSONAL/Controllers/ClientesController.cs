using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CRUD_buss.Models;

namespace CRUD_buss.Controllers
{
    public class ClientesController : Controller
    {

        //Instacia del Modelo
        sistemaviajesbusEntities bd = new sistemaviajesbusEntities();

        int numreg = 100;
        // GET: Clientes
       

        //lista clientes
        public ActionResult ListaClientes(int? pag = null)
        {
            //Recupero la cantidad de registros y almaceno el numero de alumnos
            int c = bd.clientes.Count();
  
            ViewBag.numreg = c % numreg != 0 ? c / numreg + 1 : c / numreg;

            //definir la pagina actual en reg de inicio y el reg final
            int pageact = pag == null ? 0 : (int)pag;
            int reginicio = pageact * numreg;
            int regfin = reginicio + numreg;

            //variable que almacenara los cluentes para la paginacion
            List<clientes> lista = new List<clientes>();
            for (int i = reginicio; i < regfin; i++)
            {
                if (i == c) break; //si i es igual a numero reg salir
                {
                    lista.Add(bd.clientes.ToList()[i]);
                }
            }


            return View(lista);
        }

        // GET: Clientes/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Clientes/Create
        
        public ActionResult Create(clientes reg)
        {
            //Definir un ViewBag para
            //enviar los clientes de
            //tb_paises
            try
            {
                //Bloque try, donde agrega el
                //objeto reg a la colección

                //bd.clientes.Add(reg);
                //bd.SaveChanges();
                //ViewBag.mensaje = "REGISTRO AGREGADO";
                //return Redirect("/");

                if (ModelState.IsValid)
                {
                    bd.clientes.Add(reg);
                    bd.SaveChanges();
                    return Redirect("/Clientes/ListaClientes");

                }

            }
            catch (Exception ex)
            {
                //Bloque catch, captura el error del proceso
                ViewBag.mensaje = ex.Message;
                //throw new Exception(ex.Message);
            }

            
           // return View(new clientes());
            return View(reg);
        }



        // GET: Clientes/Edit/5
        public ActionResult Edit(int id)
        {
            clientes cli = new clientes();


            using (sistemaviajesbusEntities db = new sistemaviajesbusEntities())
            {

                var oTabla = bd.clientes.Find(id);
                cli.nombre_cli = oTabla.nombre_cli;
                cli.apellidos_cli = oTabla.apellidos_cli;
                cli.direccion_cli = oTabla.direccion_cli;
                cli.dni_cli = oTabla.dni_cli;
                cli.telefono_cli = oTabla.telefono_cli;
                cli.usuario_cli = oTabla.usuario_cli;
                cli.clave_cli = oTabla.clave_cli;
                cli.fecha_cli = oTabla.fecha_cli;
                cli.codigo_cli = oTabla.codigo_cli;
            }
            return View(cli);
    
        }

        // POST: Clientes/Edit/5
        [HttpPost]
        public ActionResult Edit(clientes cli)
        {
            try
            {
                // TODO: Add update logic here
                if (ModelState.IsValid)
                {
                    using (sistemaviajesbusEntities db = new sistemaviajesbusEntities())
                    {
                        var oTabla = db.clientes.Find(cli.codigo_cli);
                        oTabla.nombre_cli = cli.nombre_cli;
                      
                        oTabla.apellidos_cli = cli.apellidos_cli;
                        oTabla.direccion_cli = cli.direccion_cli;
                       oTabla.dni_cli = cli.dni_cli;
                       oTabla.telefono_cli = cli.telefono_cli;
                        oTabla.usuario_cli = cli.usuario_cli;
                        oTabla.clave_cli = cli.clave_cli;
                        oTabla.fecha_cli = cli.fecha_cli;
                        

                        bd.Entry(oTabla).State = System.Data.Entity.EntityState.Modified;
                        bd.SaveChanges();
                    }
                    return Redirect("/Clientes/ListaClientes");
                }
                return View(cli);
            }
            
            catch(Exception ex)
            {
                //return View(cli);
                //ViewBag.mensaje = ex.Message;
                throw new Exception(ex.Message);
            }
            
        }

        // GET: Clientes/Delete/5
        [HttpGet]
        public ActionResult Delete(int Id)
        {
            clientes cli = new clientes();
            try
            {
                using (sistemaviajesbusEntities db = new sistemaviajesbusEntities())
                {

                    var oTabla = bd.clientes.Find(Id);
                    db.clientes.Remove(oTabla);
                    db.SaveChanges();
                }
                return Redirect("/Clientes/ListaClientes");
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }

       

    }
}
