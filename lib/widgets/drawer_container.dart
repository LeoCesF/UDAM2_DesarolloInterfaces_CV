import 'package:flutter/material.dart';

//Widget Personalizado: Contenedor de experiencia/estudios
class DrawerContainer extends StatelessWidget {
  final String apartado;
  final String ubicacionYFecha;
  final String? descripcion;
  final TextStyle? estiloApartado;
  final TextStyle? estiloUbicacionYFecha;
  final TextStyle? estiloDescripcion;
  final Color? colorContenedor;

  const DrawerContainer({
    super.key,
    required this.apartado,
    required this.ubicacionYFecha,
    this.descripcion,
    this.estiloApartado,
    this.estiloUbicacionYFecha,
    this.estiloDescripcion,
    this.colorContenedor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorContenedor,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(apartado, style: estiloApartado),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: descripcion != null ? 8.0 : 0.0),
            child: Text(ubicacionYFecha, style: estiloUbicacionYFecha),
          ),
          if (descripcion != null) ...[
            Text(descripcion!, style: estiloDescripcion),
          ],
        ],
      ),
    );
  }
}