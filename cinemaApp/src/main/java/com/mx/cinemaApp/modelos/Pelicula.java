package com.mx.cinemaApp.modelos;

import java.util.Date;

public class Pelicula {
	//Agregan atributos por defecto
	private int id;
	private String titulo;
	private int duracion=500;
	private String clasificacion;
	private String genero;
	private String imagen;
	private Date fechaEstreno;
	private String Estatus="activo";
	private Detalle detalle;
	public Pelicula() {
		System.out.println("instancia creada de clase pelicula");
	}
	
	
	//getters y setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}
	public String getClasificacion() {
		return clasificacion;
	}
	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public Date getFechaEstreno() {
		return fechaEstreno;
	}
	public void setFechaEstreno(Date fechaEstreno) {
		this.fechaEstreno = fechaEstreno;
	}
	public String getEstatus() {
		return Estatus;
	}
	public void setEstatus(String Estatus) {
		this.Estatus = Estatus;
	}
	public Detalle getDetalle() {
		return detalle;
	}


	public void setDetalle(Detalle detalle) {
		this.detalle = detalle;
	}


	@Override
	public String toString() {
		return "Pelicula [id=" + id + ", titulo=" + titulo + ", duracion=" + duracion + ", clasificacion="
				+ clasificacion + ", genero=" + genero + ", imagen=" + imagen + ", fechaEstreno=" + fechaEstreno
				+ ", Estatus=" + Estatus + ", detalle="+detalle.toString()+"]";
	}
	
}
