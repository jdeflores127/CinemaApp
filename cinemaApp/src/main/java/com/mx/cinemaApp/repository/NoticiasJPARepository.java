package com.mx.cinemaApp.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mx.cinemaApp.modelos.Noticia;

@Repository
public interface NoticiasJPARepository extends JpaRepository<Noticia,Integer>{
	List<Noticia> findByEstatus(String estatus);
	List<Noticia> findByFecha(Date fecha);
}
