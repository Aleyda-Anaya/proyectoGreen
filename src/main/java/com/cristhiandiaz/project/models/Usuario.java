package com.cristhiandiaz.project.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "usuarios")
@Getter
@Setter
@NoArgsConstructor
public class Usuario extends ModeloBase{
    
    @NotBlank
    @NotNull
    @Size(min = 2, max = 40)
    private String nombre;

    @NotBlank
    @NotNull
    @Size(min = 2, max = 40)
    private String apellido;

    @NotBlank
    @NotNull
    @Email
    private String email;

    @NotBlank
    @NotNull
    @Size(min = 8)
    private String password;

    @Transient
    private String confirmPassword;

    private String dni;

    private String telefono;

    private int likes;

    @OneToMany(mappedBy = "usuario", fetch = FetchType.LAZY)
    private List<Producto> productos;

}
