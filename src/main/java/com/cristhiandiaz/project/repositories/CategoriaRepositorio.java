package com.cristhiandiaz.project.repositories;

import com.cristhiandiaz.project.models.Categoria;
import java.util.List;


public interface CategoriaRepositorio extends RepositorioBase<Categoria>{

    List<Categoria> findByNombreCategoria(String nombreCategoria);

}
