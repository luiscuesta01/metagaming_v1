import 'package:flutter_dotenv/flutter_dotenv.dart';

//Obtenemos las variables de entorno.
class Environment {

  static String rawgKey = dotenv.env['RAWG_API_KEY'] ?? 'No hay api key';
  

}