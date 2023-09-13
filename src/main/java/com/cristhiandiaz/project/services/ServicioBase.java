package com.cristhiandiaz.project.services;

import java.util.List;
import java.util.Optional;

import com.cristhiandiaz.project.repositories.RepositorioBase;

public abstract class ServicioBase<T> {
    
    private RepositorioBase<T> repositorioBase;

    public ServicioBase(RepositorioBase<T> repositorioBase) {
        this.repositorioBase = repositorioBase;
    }

    public List<T> findAll(){
        return repositorioBase.findAll();
    }

    public T save(T b){
        return repositorioBase.save(b);
    }

    public T findById(Long id){
        Optional<T> optional = repositorioBase.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return null;
        }
    }

    public T update(T b){
        return save(b);
    }

    public void deleteById(Long id){
        repositorioBase.deleteById(id);
    }

}
