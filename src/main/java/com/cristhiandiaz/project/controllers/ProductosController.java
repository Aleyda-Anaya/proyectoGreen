package com.cristhiandiaz.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cristhiandiaz.project.models.Categoria;
import com.cristhiandiaz.project.models.Producto;
import com.cristhiandiaz.project.models.Usuario;
import com.cristhiandiaz.project.services.CategoriaServicio;
import com.cristhiandiaz.project.services.ProductoServicio;
import com.cristhiandiaz.project.services.UsuarioServicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/productos")
public class ProductosController {

    @Autowired
    ProductoServicio productoServicio;
    @Autowired
    UsuarioServicio usuarioServicio;
    @Autowired
    CategoriaServicio categoriaServicio;

    @GetMapping("")
    public String todosLosProductos(HttpSession session, Model model) {
        // session.setAttribute("ultimaurl", "productos");
        List<Producto> productos = productoServicio.findAll();
        model.addAttribute("products", productos);
        Long userID = (Long) session.getAttribute("usuarioId");
        if (userID != null) {
            Usuario usuario = usuarioServicio.findById(userID);
            model.addAttribute("usuario", usuario);
        }
        return "productos";
    }

    @GetMapping("/new")
    public String nuevoProducto(@ModelAttribute("producto") Producto producto, HttpSession session) {
        if (session.getAttribute("usuarioId") == null) {
            return "redirect:/";
        }
        return "nuevoProducto";
    }

    @PostMapping("/new")
    public String validarProducto(@Valid @ModelAttribute("producto") Producto producto, BindingResult result,
            Model model,
            HttpSession session) {
        if (result.hasErrors()) {
            return "nuevoProducto";
        }
        Long userID = (Long) session.getAttribute("usuarioId");
        Usuario usuario = usuarioServicio.findById(userID);
        producto.setUsuario(usuario);
        productoServicio.save(producto);
        return "redirect:/productos/" + producto.getId() + "/add";
    }

    @GetMapping("/tusProductos")
    public String productosUsuario(HttpSession session, @ModelAttribute Producto producto, Model model){
        Long userID = (Long) session.getAttribute("usuarioId");
        Usuario usuario = usuarioServicio.findById(userID);
        model.addAttribute("usuario", usuario);
        List<Producto> usuarioProductos = productoServicio.findByUsuario(usuario);
        model.addAttribute("usuarioProductos", usuarioProductos);
        return "productosUsuario";
    }

    @GetMapping("/{productoId}")
    public String detallesProducto(@PathVariable("productoId") Long productoId, Model model, HttpSession session) {
        Producto producto = productoServicio.findById(productoId);
        model.addAttribute("producto", producto);
        return "detallesProducto";
    }

    @GetMapping("/{productoId}/add")
    public String vistaProductoId(@PathVariable("productoId") Long productoId, Model model) {
        Producto producto = productoServicio.findById(productoId);
        model.addAttribute("producto", producto);
        List<Categoria> listaCategorias = categoriaServicio.findAll();
        model.addAttribute("categorias", listaCategorias);
        return "agregarCategoria";
    }

    // metodo que permite agregar categorias a un producto
    @PostMapping("/{productoId}/add")
    public String agregarCategoriaAProducto(
            @PathVariable("productoId") Long productoId,
            @RequestParam("categoriaId") Long categoriaId) {

        Categoria categoria = categoriaServicio.findById(categoriaId);
        Producto producto = productoServicio.findById(productoId);
        categoria.getProductos().add(producto);
        categoriaServicio.save(categoria);
        return "redirect:/productos/" + productoId;
    }

    @GetMapping("/mujer")
    private String ropaMujer(HttpSession session, Model model){
        //La F siempre es en mayuscula y es para mujer.
        char genero = 'F';
        List<Producto> productos = productoServicio.findByGenero(genero);
        model.addAttribute("products", productos);
        return "productos";
    }

    @GetMapping("/mujer/camisas")
    private String camisasMujer(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Camisas Mujer");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }

    @GetMapping("/mujer/chaquetas")
    private String chaquetasMujer(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Chaquetas Mujer");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }

    @GetMapping("/mujer/pantalones")
    private String pantalonesMujer(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Pantalones Mujer");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }

    @GetMapping("/mujer/zapatos")
    private String zapatosMujer(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Zapatos Mujer");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }

    @GetMapping("/hombre")
    private String ropaHombre(HttpSession session, Model model){
        Long userID = (Long) session.getAttribute("usuarioId");
        Usuario usuario = usuarioServicio.findById(userID);
        model.addAttribute("usuario", usuario);
        //La M siempre es en mayuscula y es para hombre.
        char genero = 'M';
        List<Producto> productos = productoServicio.findByGenero(genero);
        model.addAttribute("products", productos);
        return "productos";
    }

    @GetMapping("/hombre/camisas")
    private String camisasHombre(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Camisas Hombre");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }

    @GetMapping("/hombre/chaquetas")
    private String camisasChaquetas(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Chaquetas Hombre");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }

    @GetMapping("/hombre/pantalones")
    private String camisasPantalones(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Pantalones Hombre");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }

    @GetMapping("/hombre/zapatos")
    private String camisasZapatos(Model model){
        List<Categoria> categorias = categoriaServicio.findByNombreCategoria("Zapatos Hombre");
        List<Producto> productosCategoria = productoServicio.findByCategorias(categorias);
        model.addAttribute("products", productosCategoria);
        return "productos";
    }
}