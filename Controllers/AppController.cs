using System;
using Microsoft.AspNetCore.Mvc;

namespace GestionUsuarios.Controllers
{
    public class AppController : Controller
    {
        // GET : Usuarios
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Register()
        {
            return View();
        }
        public IActionResult Forgot()
        {
            return View();
        }
           public IActionResult Login()
        {
            return View();
        }
    }
}