package com.example.demo.ServiciosExternos;


import com.example.demo.ServiciosExternos.DatosGeoRef.Departamento;
import com.example.demo.ServiciosExternos.DatosGeoRef.Municipio;
import com.example.demo.ServiciosExternos.DatosGeoRef.Provincia;

import java.io.IOException;

public abstract class ServicioUbicacion {


  public abstract Provincia provinciaBuscadaPorNombre(String nombre) throws IOException;



  public abstract Municipio municipioBuscadoPorNombre(String nombre) throws IOException;


  public abstract Departamento deptoBuscadoPorNombre(String nombre) throws IOException;



}
