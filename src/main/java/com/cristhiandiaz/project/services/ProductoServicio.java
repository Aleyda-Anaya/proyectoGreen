package com.cristhiandiaz.project.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cristhiandiaz.project.models.Categoria;
import com.cristhiandiaz.project.models.Producto;
import com.cristhiandiaz.project.models.Usuario;
import com.cristhiandiaz.project.repositories.ProductoRepositorio;

@Service
public class ProductoServicio extends ServicioBase<Producto>{

    private final ProductoRepositorio productoRepositorio;

    public ProductoServicio(ProductoRepositorio productoRepositorio) {
        super(productoRepositorio);
        this.productoRepositorio = productoRepositorio;
    }

    public Producto findByNombre(String nombre){
        return productoRepositorio.findByNombre(nombre);
    }

    public List<Producto> findByGenero(char Genero){
        return productoRepositorio.findByGenero(Genero);
    }

    public List<Producto> findByCategorias(List<Categoria> categorias){
        return productoRepositorio.findByCategoriasIn(categorias);
    }

    public List<Producto> findByUsuario(Usuario usuario){
        return productoRepositorio.findByUsuario(usuario);
    }
    
}
