package com.mx.cinemaApp.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mx.cinemaApp.modelos.Noticia;
@Repository
public interface NoticiasRepository extends CrudRepository<Noticia, Integer>{
	
}
