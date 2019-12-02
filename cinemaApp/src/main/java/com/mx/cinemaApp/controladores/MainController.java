package com.mx.cinemaApp.controladores;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mx.cinemaApp.modelos.Noticia;
import com.mx.cinemaApp.modelos.Pelicula;
import com.mx.cinemaApp.services.IPeliculaService;
import com.mx.cinemaApp.utilerias.Utilerias;

@Controller
public class MainController {
	@Autowired
	private IPeliculaService peliculaService;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String goHome() {
		return "home";
	}
	@RequestMapping(value="/mostrarDetalle/{id}", method=RequestMethod.GET)
	public String mostrarDetalle(Model model, @PathVariable("id") int idPelicula) {
		String nombrePelicula="King kong";
		int duracion=120;
		double precio=12.67;
		List<Pelicula> peliculas=peliculaService.buscarTodas();
		Pelicula pelicula=peliculas.get(idPelicula);
		model.addAttribute("nombre", pelicula.getTitulo());
		model.addAttribute("duracion",pelicula.getDuracion());
		model.addAttribute("estatus",pelicula.getEstatus());
		
		model.addAttribute("listaPeliculas", peliculas);
		return "mostrarDetalle";
	}
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String goIndex(Model model, @RequestParam(name="diasSiguientes", required=false) int diasSiguientes) {
		model.addAttribute("fechasSiguientes",Utilerias.ObtenerfechasSiguientes(diasSiguientes));
		model.addAttribute("listaPeliculas", peliculaService.buscarTodas());
		return "index";
	}
	@RequestMapping(value="/detalle", method=RequestMethod.GET)
	public String goMostrarDetalle(Model model, @RequestParam("idPelicula") int idPelicula, @RequestParam(name="fecha", required=false) Date fechaEstreno) {
		System.out.println("El id de la pelicula es :"+ idPelicula);
		System.out.println("El id de la pelicula es :"+ fechaEstreno.toString());
		model.addAttribute("pelicula", peliculaService.buscarPorId(idPelicula));
		return "detalle";
	}
	@PostMapping(value="/filtraFecha")
	public String filtrarFecha(@RequestParam("fecha") Date fecha) {	
		return "index";
	}
	@PostMapping(value="/capturaNoticia")
	public String capturaNoticia(Noticia noticia,Model model) {
		System.out.println(noticia.toString());
		model.addAttribute("DatosNoticiaForm", noticia);
		return "creaNota";
	}
	@GetMapping(value="/creaNota")
	public String crearNoticia() { 
		System.out.println("hola");
		return "creaNota";
	}
	@GetMapping(value="/CreaPelicula")
	public String crearPelicula(@ModelAttribute Pelicula pelicula) { 
		System.out.println("hola");
		return "CreaPelicula";
	}
	@PostMapping(value="/capturaPelicula")
	public String capturaPelicula(@ModelAttribute Pelicula pelicula,BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("existen errores en etapa databinding");
			for(ObjectError error: result.getAllErrors()) {
				System.out.println(error.getDefaultMessage());
			}
			return "CreaPelicula";
		}
		peliculaService.guardarPelicula(pelicula);
		return "redirect:/indexPeliculas";
	}
	@GetMapping(value="/indexPeliculas")
	public String  mostrarIndex(Model model) {
		List<Pelicula> listado=peliculaService.buscarTodas();
		model.addAttribute("peliculasList", listado);
		return "listPeliculas";
	}
	
	
}
