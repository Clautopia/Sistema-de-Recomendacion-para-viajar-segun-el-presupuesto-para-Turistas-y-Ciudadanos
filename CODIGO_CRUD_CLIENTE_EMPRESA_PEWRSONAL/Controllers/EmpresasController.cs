using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CRUD_buss.Models;

namespace CRUD_buss.Controllers
{
    public class EmpresasController : Controller
    {
        //Instacia del Modelo
        sistemaviajesbusEntities bd = new sistemaviajesbusEntities();

        int numreg = 100;
        // GET: Empresa


        //lista Empresa
        public ActionResult ListaEmpresas(int? pag = null)
        {
            //Recupero la cantidad de registros y almaceno el numero de Empresa
            int c = bd.empresa.Count();

            ViewBag.numreg = c % numreg != 0 ? c / numreg + 1 : c / numreg;

            //definir la pagina actual en reg de inicio y el reg final
            int pageact = pag == null ? 0 : (int)pag;
            int reginicio = pageact * numreg;
            int regfin = reginicio + numreg;

            //variable que almacenara los cluentes para la paginacion
            List<empresa> lista = new List<empresa>();
            for (int i = reginicio; i < regfin; i++)
            {
                if (i == c) break; //si i es igual a numero reg salir
                {
                    lista.Add(bd.empresa.ToList()[i]);
                }
            }


            return View(lista);
        }

        public ActionResult Create(empresa reg)
        {
       
            try
            {

                if (ModelState.IsValid)
                {
                    bd.empresa.Add(reg);
                    bd.SaveChanges();
                    return Redirect("/Empresas/ListaEmpresas");

                }

            }
            catch (Exception ex)
            {
      
                ViewBag.mensaje = ex.Message;

            }

            return View(reg);
        }

        // GET: empresas/Edit/5
        public ActionResult Edit(int id)
        {
            empresa en = new empresa();


            using (sistemaviajesbusEntities db = new sistemaviajesbusEntities())
            {

                var oTabla = bd.empresa.Find(id);
                en.perfil_emp = oTabla.perfil_emp;
                 en.nombre_emp= oTabla.nombre_emp;
                en.ruck_emp = oTabla.ruck_emp;
                en.direccion_emp = oTabla.direccion_emp;
                en.telefono_emp = oTabla.telefono_emp;
                en.valoracion = oTabla.valoracion;


            }
            return View(en);

        }

        // POST: empresas/Edit/5
        [HttpPost]
        public ActionResult Edit(empresa en)
        {
            try
            {
                // TODO: Add update logic here
                if (ModelState.IsValid)
                {
                    using (sistemaviajesbusEntities db = new sistemaviajesbusEntities())
                    {
                        var oTabla = db.empresa.Find(en.codigo_emp);
                        en.perfil_emp = oTabla.perfil_emp;
                        en.nombre_emp = oTabla.nombre_emp;
                        en.ruck_emp = oTabla.ruck_emp;
                        en.direccion_emp = oTabla.direccion_emp;
                        en.telefono_emp = oTabla.telefono_emp;
                        en.valoracion = oTabla.valoracion;


                        bd.Entry(oTabla).State = System.Data.Entity.EntityState.Modified;
                        bd.SaveChanges();
                    }
                    return Redirect("/Empresas/ListaEmpresas");
                }
                return View(en);
            }

            catch (Exception ex)
            {
                //return View(cli);
                //ViewBag.mensaje = ex.Message;
                throw new Exception(ex.Message);
            }

        }

        // GET: empresas/Delete/5
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
                return Redirect("/Empresas/ListaEmpresas");
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
        }
    }
}