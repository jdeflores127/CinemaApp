package com.mx.cinemaApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.mx.cinemaApp.modelos.Pelicula;;
@Repository
public interface PeliculasRepository extends JpaRepository<Pelicula, Integer>{

}
