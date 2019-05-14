using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD_buss.Controllers
{
    public class BusesController : Controller
    {
        // GET: Buses
        public ActionResult Index()
        {
            return View();
        }

        // GET: Buses/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Buses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Buses/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Buses/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Buses/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Buses/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Buses/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
