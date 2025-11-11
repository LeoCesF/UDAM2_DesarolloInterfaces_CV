import 'package:flutter/material.dart';

//Widget Personalizado: Contenedor de texto
class TextContainer extends StatelessWidget {
  final String titulo;
  final String contenedor;
  final TextStyle? estiloTitulo;
  final TextStyle? estiloContenido;
  final Color? colorContenido;

  const TextContainer({
    super.key,
    required this.titulo,
    required this.contenedor,
    this.estiloTitulo,
    this.estiloContenido,
    this.colorContenido,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorContenido,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(titulo, style: estiloTitulo),
          ),
          Text(contenedor, style: estiloContenido),
        ],
      ),
    );
  }
}