import 'package:flutter/material.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/custom_appbar.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/custom_header.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          CustomHeader(
              subtitle: 'Invítame a un café',
              title: 'Sobre nosotros',
              iconShowSearch: false),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Quiénes somos?',
                  style: textStyle.labelLarge,
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  '¡Bienvenido a MetaGaming! Somos un equipo apasionado de desarrolladores que ha creado esta plataforma para todos los amantes de los videojuegos. Nos dedicamos a proporcionar un espacio gratuito y accesible donde los jugadores pueden descubrir, compartir y disfrutar de información detallada sobre sus juegos favoritos.',
                  style: textStyle.bodyMedium
                      ?.copyWith(color: const Color(0xFF7B8395)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nuestro objetivo',
                  style: textStyle.labelLarge,
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  'En MetaGaming, buscamos:\n\n'
                  '1. Explorar y Descubrir: Ofrecer juegos desde clásicos hasta lanzamientos recientes.\n'
                  '2. Colaborar y Compartir: Fomentar la colaboración comunitaria para conocer detalles y reseñas.\n'
                  '3. Acceder a Contenido Gratuito: Plataforma gratuita con información detallada sobre videojuegos.\n'
                  '4. Crear Comunidad: Conectar a jugadores, compartir experiencias y celebrar la pasión por los videojuegos.',
                  style: textStyle.bodyMedium
                      ?.copyWith(color: const Color(0xFF7B8395)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    width: double.infinity,
                    height:
                        57, // Ancho del contenedor al ancho máximo disponible
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción a realizar al presionar el botón
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary, // Color de fondo azul
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18), // Bordes redondeados
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centrar contenido horizontalmente
                        children: [
                          Text(
                            'Invítanos a un café',
                            style: textStyle.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ), // Texto del botón
                          SizedBox(
                              width: 8.0), // Espacio entre el texto y el icono
                          Icon(
                            Icons.favorite_rounded,
                            color: colors.onBackground,
                          ), // Icono de corazón
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
