package com.cristhiandiaz.project.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.cristhiandiaz.project.models.Usuario;
import com.cristhiandiaz.project.repositories.UsuarioRepositorio;

@Service
public class UsuarioServicio extends ServicioBase<Usuario>{

    private final UsuarioRepositorio usuarioRepositorio;

    public UsuarioServicio(UsuarioRepositorio usuarioRepositorio) {
        super(usuarioRepositorio);
        this.usuarioRepositorio = usuarioRepositorio;
    }

    public Usuario findByEmail(String email){
        return usuarioRepositorio.findByEmail(email);
    }

    public Usuario registerUsuario(Usuario usuario) {
        String hashed = BCrypt.hashpw(usuario.getPassword(), BCrypt.gensalt());
        usuario.setPassword(hashed);
        return usuarioRepositorio.save(usuario);
    }

    public boolean authenticateUsuario(String email, String password) {
        Usuario usuario = usuarioRepositorio.findByEmail(email);
        if(usuario == null) {
            return false;
        } else {
            if(BCrypt.checkpw(password, usuario.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }



}
