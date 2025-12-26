import 'package:intl/intl.dart';

/// Clase helper para formatear datos en formatos legibles para humanos
/// 
/// Proporciona métodos estáticos para convertir números y otros datos
/// en representaciones más amigables para la interfaz de usuario
class HumanFormats {
  
  /// Convierte un número en formato compacto legible
  /// 
  /// Transforma números grandes en notación compacta (K, M, B)
  /// Por ejemplo: 1000 -> 1K, 1000000 -> 1M
  /// 
  /// [number] El número a formatear
  /// Returns: String con el número formateado en notación compacta
  static String humanReadableNumber(double number){
    // Crea un formateador de números compactos sin decimales ni símbolo de moneda
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format( number);

    return formatterNumber;
  }
}