package com.cristhiandiaz.project.repositories;

import com.cristhiandiaz.project.models.Producto;
import com.cristhiandiaz.project.models.Usuario;

import java.util.List;
import com.cristhiandiaz.project.models.Categoria;

public interface ProductoRepositorio extends RepositorioBase<Producto>{
    
    Producto findByNombre(String nombre);

    List<Producto> findByGenero(char genero);

    List<Producto> findByCategoriasIn(List<Categoria> categorias);

    List<Producto> findByUsuario(Usuario usuario);

}
