package com.mx.cineApp.PruebaJPA;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Optional;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.mx.cinemaApp.modelos.Noticia;
import com.mx.cinemaApp.repository.NoticiasJPARepository;
import com.mx.cinemaApp.repository.NoticiasRepository;

//@EnableJpaRepositories(basePackages = "com.mx.cinemaApp.repository")
@EntityScan(basePackages="com.mx.cinemaApp.modelos")
public class AppConexion {

	/**
	 * @param args
	 */
	/**
	 * @param args
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws ParseException {
		//Generamos una entidad de root aplication contex
		//por default los archivos guardados en resources son agregados en el classpath
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("root-context.xml");
		Noticia noticia=new Noticia();
		noticia.setTitulo("King kong");
		noticia.setEstatus("Activa");
		noticia.setDetalle("insercion en base de datos "+Math.random()*1000);
		NoticiasRepository repo= context.getBean("noticiasRepository",NoticiasRepository.class);
		System.out.println("Se inserta nuevo registro");
		repo.save(noticia);
		//evitar el nullpointerexception
		Optional<Noticia> noticiaOptional=repo.findById(1);
		if(noticiaOptional.isPresent()) {
			noticiaOptional.get().setDetalle("modificado y persistido");
			repo.save(noticiaOptional.get());
			System.out.println(noticiaOptional);
		}
		//exist by id
		if(repo.existsById(1)) {
			System.out.println("registro eliminado");
			repo.deleteById(1);
		}
		else {
			System.out.println("registro no encontrado");
		}
		System.out.println("se muestra el listado de peliculas");
		Iterable<Noticia> listaNoticias=repo.findAll();
		for(Noticia noticiaItem:listaNoticias){
			System.out.println(noticiaItem);
		}
		//System.out.println("Se elimina todo el listado");
		//repo.deleteAll();
		ArrayList<Integer> idPeliculasBuscar=new ArrayList<>();
		idPeliculasBuscar.add(1);
		idPeliculasBuscar.add(5);
		idPeliculasBuscar.add(6);
		idPeliculasBuscar.add(8);
		System.out.println("buscar por lista de id");
		Iterable<Noticia>listaNoticiasItems=repo.findAllById(idPeliculasBuscar);
		for(Noticia noticiaItem:listaNoticiasItems) {
			System.out.println(noticiaItem);
		}
		// pruebas con JPARepository
		System.out.println("select con JPArepository con ordenamiento");
		NoticiasJPARepository noticiasJPARepository= context.getBean("noticiasJPARepository",NoticiasJPARepository.class);
		List<Noticia> instancias= noticiasJPARepository.findAll(Sort.by("titulo").descending().and(Sort.by("detalle")));
		for(Noticia noticiaItem : instancias) {
			System.out.println(noticiaItem);
		}
		System.out.println("select con paginacion");
		Page<Noticia> noticiasPaginadas=noticiasJPARepository.findAll(PageRequest.of(0, 3, Sort.by("titulo")));
		for(Noticia noticiaItem: noticiasPaginadas){
			System.out.println(noticiaItem);
		}
		System.out.println("ejemplo buscando con findBy");
		List<Noticia> noticias=noticiasJPARepository.findByEstatus("Inactiva");
		for(Noticia noticiaItem: noticias) {
			System.out.println(noticiaItem);
		}
		System.out.println("ejemplo buscando con findBy2");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd"); 
		List<Noticia> noticiasDate=noticiasJPARepository.findByFecha(sdf.parse("2017/09/02"));
		for(Noticia noticiaItem : noticiasDate)
		{
			System.out.println(noticiaItem);
		}
		context.close(); 
	}

}
