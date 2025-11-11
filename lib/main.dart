import 'package:flutter/material.dart';

import 'package:t3_2/widgets/drawer_container.dart';
import 'package:t3_2/widgets/text_container.dart';

//Constantes de color:
const Color colorPrincipal = Color(0xFF282828); //Color Jet
const Color colorContraste = Color(0xFF6A9FB4); //Color AirSuperirityBlue
const Color colorContrasteClaro = Color(0xFFA6C1CB); //Color Light Blue
const Color colorTextos = Color(0xFFE2E2E2); //Color Platinum
const Color colorTextosAlter = Color(0xFF3F403F); //Color Onyx

//Constantes de texto:
const TextStyle tituloPrincipal = TextStyle(
  fontSize: 30,
  color: colorContrasteClaro,
  fontWeight: FontWeight.bold,
);
const TextStyle tituloApartados = TextStyle(
  fontSize: 24,
  color: colorTextos,
  fontWeight: FontWeight.bold,
);
const TextStyle tituloApartadosAlter = TextStyle(
  fontSize: 20,
  color: colorTextosAlter,
  fontWeight: FontWeight.bold,
);

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _avatarImage = 'assets/perfil.jpg';
  bool _isTecnologiasExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Lista de datos para la experiencia laboral
    final List<Map<String, String?>> experiencias = [
      {
        'apartado':
            'Practicas: FP Dual Superior Desarollo de programación multiplataforma',
        'ubicacionYFecha': 'Cinfo, Mayo 2025 - Julio 2025',
        'descripcion':
            '- Desarollo de Página Web usando Angular,SpringBoot y Java\n- Aprendizaje de las Metodologías Agile y marco de trabajo Scrum',
      },
      {
        'apartado':
            'Practicas: FP Superior Animaciones 3D, Videojuegos y Entornos Interactivos',
        'ubicacionYFecha':
            'Digital Monster Collective, Mayo 2024 - Octubre 2024',
        'descripcion':
            '- Testeo de videojuegos\n- Participación en el desarollo de videojuegos para Game Jam',
      },
    ];

    // Lista de datos para los estudios
    final List<Map<String, String?>> estudios = [
      {
        'apartado':
            'FP Dual Superior Desarollo de programación multiplataforma',
        'ubicacionYFecha': 'IES Fernado Wirtz,2025 - 2026',
        'descripcion':
            '- Aprendizaje de Java\n- Aprendizaje de Dart y Flutter\n- Aprendizaje de AndroidStudio\n- Aprendizaje del manejo de bases de datos',
      },
      {
        'apartado':
            'FP Superior Animaciones 3D, Videojuegos y Entornos Interactivos',
        'ubicacionYFecha': 'Ilerna Online, 2021 - 2025',
        'descripcion':
            '- Aprendizaje de Unity y C# de videojuegos 2D y 3D\n- Aprendizaje de modelado y animaciones 3D en Maya\n- Aprendizaje de ilustración y animaciones 2D en Krita',
      },
    ];

    return Scaffold(
      backgroundColor: colorPrincipal, //Color de fondo de la aplicación general
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorTextos, // Color de fondo del botón
        foregroundColor: colorTextosAlter, // Color del ícono
        onPressed: () {
          setState(() {
            _avatarImage = _avatarImage == 'assets/perfil.jpg'
                ? 'assets/perfil2.jpg'
                : 'assets/perfil.jpg';
          });
        },
        child: const Icon(Icons.switch_account),
      ),
      body: Row(
        children: [
          // Contenedor Sobre mi: Foto, info personal, tecnologías
          Container(
            width: 175,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(color: colorContraste),
            child: Align(
              alignment: const Alignment(0.0, -0.8),
              child: ListView(
                shrinkWrap: true,
                children: [
                  // --- Sección de Imagen ---
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(_avatarImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: TextContainer(
                      titulo: 'Sobre Mi',
                      contenedor:
                          'Soy un joven estudiante, apasionado por la informática y los videojuegos desde niño. Mi meta es poder contar historias a través de los proyectos que haga',
                      estiloTitulo: tituloApartadosAlter,
                      estiloContenido: TextStyle(
                        fontSize: 14,
                        color: colorTextosAlter,
                      ),
                    ),
                  ),
                  // --- Sección de Tecnologías (Expandible) ---
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isTecnologiasExpanded = !_isTecnologiasExpanded;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  'Tecnologías',
                                  style: tituloApartadosAlter,
                                ),
                              ),
                              Icon(
                                _isTecnologiasExpanded
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: colorTextosAlter,
                              ),
                            ],
                          ),
                        ),
                        if (_isTecnologiasExpanded) // Se muestra solo si está expandido
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                            ), // Espacio entre el título y la lista
                            child: Text(
                              'Flutter\nDart\nJava\nSpringBoot\nAngular\nUnity\nC#',
                              style: TextStyle(
                                fontSize: 14,
                                color: colorTextosAlter,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Contenedor Info: Información estudios, información experiencia laboral
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              color: colorPrincipal,
              child: ListView(
                children: [
                  // --- Sección de Estudios ---
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: colorContraste,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Icon(
                                Icons.book,
                                color: colorTextos,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        const Text('Estudios', style: tituloPrincipal),
                      ],
                    ),
                  ),
                  ...estudios.map((estudio) {
                    return DrawerContainer(
                      apartado: estudio['apartado']!,
                      ubicacionYFecha: estudio['ubicacionYFecha']!,
                      descripcion: estudio['descripcion'],
                      estiloApartado: tituloApartados,
                      estiloUbicacionYFecha: const TextStyle(
                        fontSize: 16,
                        color: colorTextos,
                        fontStyle: FontStyle.italic,
                      ),
                      estiloDescripcion: const TextStyle(
                        fontSize: 14,
                        color: colorTextos,
                      ),
                      colorContenedor: colorContraste,
                    );
                  }).toList(),
                  // --- Sección de Experiencia Laboral ---
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: colorContraste,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Icon(
                                Icons.work,
                                color: colorTextos,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            'Experiencia Laboral',
                            style: tituloPrincipal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...experiencias.map((exp) {
                    return DrawerContainer(
                      apartado: exp['apartado']!,
                      ubicacionYFecha: exp['ubicacionYFecha']!,
                      descripcion: exp['descripcion'],
                      estiloApartado: tituloApartados,
                      estiloUbicacionYFecha: const TextStyle(
                        fontSize: 16,
                        color: colorTextos,
                        fontStyle: FontStyle.italic,
                      ),
                      estiloDescripcion: const TextStyle(
                        fontSize: 14,
                        color: colorTextos,
                      ),
                      colorContenedor: colorContraste,
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
