package com.cristhiandiaz.project.repositories;

import com.cristhiandiaz.project.models.Usuario;

public interface UsuarioRepositorio extends RepositorioBase<Usuario>{
    
    Usuario findByEmail(String email);

}
