class Ejercicio1 {
  // Método para verificar si dos números son divisibles
  String verificarDivisibilidad(int numero1, int numero2) {
    if (numero2 == 0) {
      return "El segundo número no puede ser 0";
    }
    if (numero1 % numero2 == 0) {
      return "Es divisible";
    } else {
      return "No es divisible";
    }
  }
}
