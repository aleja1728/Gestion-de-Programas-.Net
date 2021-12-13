using System;
using Microsoft.AspNetCore.Mvc;

namespace GestionUsuarios.Controllers
{
    public class CoordinadorController : Controller
    {
        // GET : Usuarios
        public IActionResult Index()
        {

            return View();
        }
        public IActionResult GesAlumnos()
        {

            return View();
        }
        public IActionResult GesCursos()
        {

            return View();
        }
        public IActionResult GesProfesor()
        {

            return View();
        }


    }
}