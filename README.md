# TokTik

Aplicación Flutter que simula la interfaz y funcionalidad de TikTok, permitiendo visualizar videos en formato vertical con scroll continuo.

## 📱 Descripción

TokTik es una aplicación móvil desarrollada en Flutter que replica la experiencia de usuario de TikTok. Los usuarios pueden navegar a través de videos en formato vertical con desplazamiento suave, visualizar información de interacción (likes y vistas) y disfrutar de una interfaz oscura optimizada para la visualización de contenido multimedia.

## ✨ Características

- **Scroll vertical de videos**: Navegación fluida entre videos usando gestos verticales
- **Interfaz tipo TikTok**: Diseño familiar e intuitivo similar a redes sociales populares
- **Sistema de likes y vistas**: Visualización de estadísticas de interacción para cada video
- **Formateo de números**: Números formateados en notación compacta (K, M, B) para mejor legibilidad
- **Tema oscuro**: Interfaz optimizada en modo oscuro para mejor experiencia visual
- **Gestión de estado con Provider**: Arquitectura escalable y mantenible
- **Carga asíncrona**: Simulación de carga de contenido con indicadores de progreso
- **Código documentado**: Comentarios descriptivos en todo el código para mejor mantenibilidad

## 🏗️ Arquitectura del Proyecto

El proyecto sigue una arquitectura limpia organizada en capas:

```
lib/
├── config/           # Configuración de la aplicación
│   ├── helpers/     # Funciones helper y utilidades
│   └── theme/       # Temas y estilos
├── domain/          # Lógica de negocio y entidades
│   └── entities/    # Entidades del dominio
├── infrastructure/  # Implementaciones técnicas
│   └── models/      # Modelos de datos
├── presentation/    # Capa de presentación
│   ├── providers/   # Gestión de estado
│   ├── screens/     # Pantallas de la aplicación
│   └── widgets/     # Componentes reutilizables
└── shared/          # Recursos compartidos
    └── data/        # Datos locales y constantes
```

## 🚀 Instalación

1. **Clonar el repositorio**:
   ```bash
   git clone <url-del-repositorio>
   cd toktik
   ```

2. **Instalar dependencias**:
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**:
   ```bash
   flutter run
   ```

## 📦 Dependencias Principales

- **flutter**: SDK de Flutter
- **provider**: Gestión de estado reactiva
- **intl**: Formateo de números y fechas internacionalizadas
- **video_player** (futura integración): Reproducción de videos

## 🎯 Uso

1. Al iniciar la aplicación, se cargarán automáticamente los videos disponibles
2. Desliza verticalmente para navegar entre diferentes videos
3. Observa las estadísticas de likes y vistas en la esquina inferior derecha
4. Los videos se cargan con un efecto de transición suave tipo TikTok

## 📁 Estructura de Datos

Los videos se definen en formato JSON local con la siguiente estructura:

```dart
{
  'name': 'Título del video',
  'videoUrl': 'assets/videos/video.mp4',
  'likes': 1000,
  'views': 5000
}
```

## 🔧 Configuración de Desarrollo

### Requisitos previos
- Flutter SDK (versión 3.0 o superior)
- Dart SDK
- Android Studio / Xcode (para desarrollo móvil)
- VS Code o Android Studio como IDE

### Variables de entorno
No se requieren variables de entorno especiales para el desarrollo local.

## 🎨 Personalización del Tema

El tema de la aplicación se puede personalizar editando el archivo `lib/config/theme/app_theme.dart`:

```dart
ThemeData getTheme() => ThemeData(
  brightness: Brightness.dark,
  // Añade más personalizaciones aquí
);
```

## 📝 Próximas Características

- [ ] Reproducción real de videos con video_player
- [ ] Implementación de sonido y controles de volumen
- [ ] Sistema de comentarios
- [ ] Funcionalidad de compartir
- [ ] Perfiles de usuario
- [ ] Sistema de seguimiento
- [ ] Integración con backend real

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto es un ejemplo educativo y está disponible para uso libre.

## 📚 Recursos de Flutter

- [Documentación oficial de Flutter](https://docs.flutter.dev/)
- [Lab: Escribe tu primera app Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Ejemplos útiles de Flutter](https://docs.flutter.dev/cookbook)
- [Provider Package](https://pub.dev/packages/provider)
