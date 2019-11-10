package com.mx.cinemaApp.services;

import java.util.ArrayList;

import com.mx.cinemaApp.modelos.Pelicula;

public interface IPeliculaService {
	public ArrayList<Pelicula> buscarTodas();
	public Pelicula buscarPorId(int idPelicula);
	public void guardarPelicula(Pelicula pelicula);
}
