package com.mx.cinemaApp.services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.cinemaApp.modelos.Pelicula;
import com.mx.cinemaApp.repository.PeliculasRepository;
@Service
public class PeliculaServiceImpl implements IPeliculaService{
	@Autowired
	private PeliculasRepository peliculasRepository;
	
	@Override
	public List<Pelicula> buscarTodas() {
		return peliculasRepository.findAll();
	}

	@Override
	public Pelicula buscarPorId(int idPelicula) {
		Optional<Pelicula> pelicula= peliculasRepository.findById(idPelicula);
		return pelicula.get();
		//return listaPeliculas.get(idPelicula-1);
	}

	@Override
	public void guardarPelicula(Pelicula pelicula) {
		// TODO Auto-generated method stub
		peliculasRepository.save(pelicula);
		System.out.println(pelicula.toString());
		System.out.println("Pelicula guardada");
	}
}
