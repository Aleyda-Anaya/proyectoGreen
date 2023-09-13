// Obtén todos los botones de talla
const sizeButtons = document.querySelectorAll('.size-button');

// Función para manejar el clic en un botón de talla
function handleSizeClick(event) {
  // Deselecciona todos los botones de talla
  sizeButtons.forEach((button) => {
    button.classList.remove('selected');
    button.style.backgroundColor = 'transparent';
    button.style.color = 'black';
  });

  // Selecciona el botón clicado
  const clickedButton = event.target;
  clickedButton.classList.add('selected');
  clickedButton.style.backgroundColor = 'black';
  clickedButton.style.color = 'white';
}

// Agrega el controlador de eventos clic a todos los botones de talla
sizeButtons.forEach((button) => {
  button.addEventListener('click', handleSizeClick);
});

const likeButton = document.getElementById('likeButton');

likeButton.addEventListener('click', function () {
  if (likeButton.classList.contains('liked')) {
    likeButton.classList.remove('liked');
  } else {
    likeButton.classList.add('liked');
  }
});

// Obtiene la imagen del producto por su ID
const productoImagen = document.getElementById('producto-imagen');

// Obtiene todas las opciones de color
const colorOptions = document.querySelectorAll('.color-option');

// Itera a través de las opciones de color y agrega un evento clic a cada una
colorOptions.forEach((option) => {
  option.addEventListener('click', (event) => {
    // Obtiene el valor del color desde el atributo data-color
    const selectedColor = event.currentTarget.getAttribute('data-color');
    
    // Actualiza la imagen del producto según el color seleccionado
    if (selectedColor === 'green') {
      productoImagen.src = './img/short_green.jpg';
    } else if (selectedColor === 'gray') {
      productoImagen.src = './img/short_gray.png';
    } else if (selectedColor === 'red') {
      productoImagen.src = './img/short_red.png';
    }
    // Agrega más casos para otros colores según tu caso

    // Opcional: Puedes cambiar la clase CSS de la opción seleccionada para resaltarla
    colorOptions.forEach((colorOption) => {
      colorOption.classList.remove('selected');
    });
    event.currentTarget.classList.add('selected');
  });
});