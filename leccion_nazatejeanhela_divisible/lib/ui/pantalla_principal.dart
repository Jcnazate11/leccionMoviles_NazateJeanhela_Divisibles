import 'package:flutter/material.dart';
import '../pages/ejercicio1.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final Ejercicio1 _logica = Ejercicio1();
  final TextEditingController _primerNumeroController = TextEditingController();
  final TextEditingController _segundoNumeroController = TextEditingController();

  String _resultado = "";

  void _calcularDivisibilidad() {
    int? numero1 = int.tryParse(_primerNumeroController.text);
    int? numero2 = int.tryParse(_segundoNumeroController.text);

    setState(() {
      if (numero1 == null || numero2 == null) {
        _resultado = "Por favor, ingrese números válidos.";
      } else {
        _resultado = _logica.verificarDivisibilidad(numero1, numero2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Divisibilidad'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Ingrese dos números para verificar si el segundo es divisible por el primero.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _primerNumeroController,
              label: 'Primer número',
              icon: Icons.looks_one,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _segundoNumeroController,
              label: 'Segundo número',
              icon: Icons.looks_two,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _calcularDivisibilidad,
              icon: const Icon(Icons.check_circle),
              label: const Text('Calcular'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 24),
            if (_resultado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _resultado == "Es divisible" ? Icons.thumb_up : Icons.error,
                      color: Colors.purple,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _resultado,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.purple, width: 2),
        ),
        filled: true,
        fillColor: Colors.purple[50],
      ),
    );
  }
}
