package com.mx.cinemaApp.services;

import java.util.List;
import com.mx.cinemaApp.modelos.Pelicula;

public interface IPeliculaService {
	public List<Pelicula> buscarTodas();
	public Pelicula buscarPorId(int idPelicula);
	public void guardarPelicula(Pelicula pelicula);
}
