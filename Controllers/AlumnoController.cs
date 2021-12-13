using System;
using Microsoft.AspNetCore.Mvc;

namespace GestionUsuarios.Controllers
{
    public class AlumnoController : Controller
    {
        // GET : Usuarios
        public IActionResult Index()
        {
            ViewBag.nombres =  "Alejandra Fiscal";
          
            return View();
        }


        public IActionResult Calculadora(String operacion, int valorA, int valorB){

            int respuesta = 0;
            switch (operacion)
            {
                case "suma":
                respuesta = valorA + valorB;
                break;
                case "resta":
                respuesta = valorA - valorB;
                break;
                case "multiplicacion":
                respuesta = valorA * valorB;
                break;
                case "division":
                respuesta = valorA / valorB;
                break;
                
            }
            ViewData["resp"] = respuesta;
            return View();
        }
    }
}