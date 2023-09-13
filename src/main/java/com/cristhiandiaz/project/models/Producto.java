package com.cristhiandiaz.project.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "productos")
@Getter
@Setter
@NoArgsConstructor
public class Producto extends ModeloBase{
    
    @NotBlank
    @NotNull
    @Size(min = 2, max = 45)
    private String nombre;

    @NotBlank
    @NotNull
    private String descripcion;

    @NotNull
    private double precio;

    @NotBlank
    @NotNull
    private String talla;

    @NotNull
    private char genero;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "categorias_productos", 
        joinColumns = @JoinColumn(name = "producto_id"), 
        inverseJoinColumns = @JoinColumn(name = "categoria_id")
    )
    private List<Categoria> categorias;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;
}
