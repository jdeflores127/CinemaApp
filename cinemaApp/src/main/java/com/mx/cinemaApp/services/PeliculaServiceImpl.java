package com.mx.cinemaApp.services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.springframework.stereotype.Service;

import com.mx.cinemaApp.modelos.Pelicula;
@Service
public class PeliculaServiceImpl implements IPeliculaService{
	private ArrayList<Pelicula> listaPeliculas=inicializaPeliculas();
	@Override
	public ArrayList<Pelicula> buscarTodas() {
		return listaPeliculas;
	}

	@Override
	public Pelicula buscarPorId(int idPelicula) {
		return listaPeliculas.get(idPelicula-1);
	}

	@Override
	public void guardarPelicula(Pelicula pelicula) {
		// TODO Auto-generated method stub
		listaPeliculas.add(pelicula);
		System.out.println(pelicula.toString());
		System.out.println("Pelicula guardada");
	}
	private ArrayList<Pelicula> inicializaPeliculas() {
		ArrayList<Pelicula> listaPeliculas=new ArrayList<>();
		Pelicula p1=new Pelicula();
		p1.setId(1);
		p1.setTitulo("king kong");
		p1.setEstatus("Activo");
		p1.setGenero("clasica");
		p1.setImagen("kingkong.jpg");
		Calendar dateCalendar=new GregorianCalendar(1934,3,31);
		p1.setFechaEstreno(dateCalendar.getTime());
		p1.setDuracion(145);
		p1.setClasificacion("B15");
		Pelicula p2=new Pelicula();
		p2.setId(2);
		p2.setTitulo("Godzilla");
		p2.setEstatus("inactivo");
		p2.setGenero("Monstruos");
		p2.setImagen("godzilla.jpg");
		Calendar dateCalendar2=new GregorianCalendar(1990,8,22);
		p2.setFechaEstreno(dateCalendar2.getTime());
		p2.setDuracion(150);
		p2.setClasificacion("A");
		listaPeliculas.add(p1);
		listaPeliculas.add(p2);
		return listaPeliculas;
	}
}
