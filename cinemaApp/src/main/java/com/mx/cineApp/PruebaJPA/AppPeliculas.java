package com.mx.cineApp.PruebaJPA;


import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import com.mx.cinemaApp.modelos.Horario;
import com.mx.cinemaApp.modelos.Pelicula;
import com.mx.cinemaApp.repository.HorarioRepository;
import com.mx.cinemaApp.repository.PeliculasRepository;

public class AppPeliculas {
	public static void main (String[] args) {
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("root-context.xml");
		PeliculasRepository peliculasRepository=context.getBean("peliculasRepository",PeliculasRepository.class);
		Page<Pelicula> peliculas=peliculasRepository.findAll(PageRequest.of(2, 2, Sort.by("titulo")));
		System.out.println("Obtenemos lista de pelis");
		for(Pelicula pelicula: peliculas) {
			System.out.println(pelicula.toString());
		}
		System.out.println("obtenemos horarios");
		HorarioRepository hr=context.getBean("horarioRepository", HorarioRepository.class);
		List<Horario> horarios=hr.findAll();
		for(Horario horario:horarios) {
			System.out.println(horario.toString());
		}
	}
}
