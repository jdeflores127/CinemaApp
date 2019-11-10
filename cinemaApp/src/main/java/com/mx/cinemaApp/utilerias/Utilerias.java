package com.mx.cinemaApp.utilerias;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Utilerias {
	public static ArrayList<String> ObtenerfechasSiguientes(int diasSiguientes){
		Calendar cal=new GregorianCalendar();
		ArrayList<String> listaFechas=new ArrayList<>();
		System.out.println("la fecha actual"+cal.getTime().toString());
		listaFechas.add(cal.get(Calendar.DAY_OF_MONTH)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.YEAR));
		for(int i=0;i<diasSiguientes;i++) {
			cal.add(Calendar.DAY_OF_MONTH, 1);
			System.out.println("la fecha pasados "+i+" dias es: "+cal.getTime().toString());
			listaFechas.add(cal.get(Calendar.DAY_OF_MONTH)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.YEAR));
		}
		return listaFechas;
	}
}
