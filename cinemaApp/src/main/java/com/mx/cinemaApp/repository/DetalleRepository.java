package com.mx.cinemaApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mx.cinemaApp.modelos.Detalle;

@Repository
public interface DetalleRepository extends JpaRepository<Detalle,Integer>{

}
