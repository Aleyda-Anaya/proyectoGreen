package com.cristhiandiaz.project.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "categorias")
@Getter
@Setter
@NoArgsConstructor
public class Categoria extends ModeloBase{
    
    @NotBlank
    @NotNull
    private String nombreCategoria;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "categorias_productos", 
        joinColumns = @JoinColumn(name = "categoria_id"), 
        inverseJoinColumns = @JoinColumn(name = "producto_id")
    )
    private List<Producto> productos;

}
