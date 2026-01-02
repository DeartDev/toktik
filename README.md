# TokTik

Aplicación Flutter que simula la interfaz y funcionalidad de TikTok, permitiendo visualizar videos en formato vertical con scroll continuo.

## 📱 Descripción

TokTik es una aplicación móvil desarrollada en Flutter que replica la experiencia de usuario de TikTok. Los usuarios pueden navegar a través de videos en formato vertical con desplazamiento suave, visualizar información de interacción (likes y vistas) y disfrutar de una interfaz oscura optimizada para la visualización de contenido multimedia.

## ✨ Características

- **Scroll vertical de videos**: Navegación fluida entre videos usando gestos verticales similar a TikTok
- **Reproducción automática**: Los videos se reproducen automáticamente con loop infinito
- **Controles de reproducción**: Toque en pantalla para pausar/reanudar videos
- **Interfaz tipo TikTok**: Diseño familiar e intuitivo similar a redes sociales populares
- **Sistema de likes y vistas**: Visualización de estadísticas de interacción para cada video
- **Formateo de números**: Números formateados en notación compacta (K, M, B) para mejor legibilidad
- **Gradiente decorativo**: Fondo con gradiente para mejorar legibilidad del texto
- **Tema oscuro**: Interfaz optimizada en modo oscuro para mejor experiencia visual
- **Gestión de estado con Provider**: Arquitectura escalable y mantenible
- **Carga asíncrona**: Simulación de carga de contenido con indicadores de progreso
- **Animaciones**: Efectos visuales con animate_do para mejor UX
- **Código documentado**: Comentarios descriptivos en todo el código para mejor mantenibilidad

## 🏗️ Arquitectura del Proyecto

El proyecto sigue una arquitectura limpia organizada en capas:

```
lib/
├── config/              # Configuración de la aplicación
│   ├── helpers/        # Funciones helper y utilidades
│   │   └── human_formats.dart
│   └── theme/          # Temas y estilos
│       └── app_theme.dart
├── domain/             # Lógica de negocio y entidades
│   └── entities/       # Entidades del dominio
│       └── video_post.dart
├── infrastructure/     # Capa de datos y servicios externos
│   └── models/         # Modelos de datos
│       └── local_video_model.dart
├── presentation/       # Capa de presentación (UI)
│   ├── providers/      # Gestión de estado con Provider
│   │   └── discover_provider.dart
│   ├── screens/        # Pantallas de la aplicación
│   │   └── discover/
│   │       └── discover_screen.dart
│   └── widgets/        # Widgets reutilizables
│       └── shared/
│           ├── video/
│           │   ├── fullscreen_player.dart
│           │   └── video_background.dart
│           ├── video_buttons.dart
│           └── video_scrollable_view.dart
├── shared/             # Recursos compartidos
│   └── data/           # Datos locales
│       └── local_video_posts.dart
└── main.dart           # Punto de entrada de la aplicación
```

### Capas de la Arquitectura

- **Config**: Configuración global (temas, helpers, constantes)
- **Domain**: Entidades del negocio puras sin dependencias externas
- **Infrastructure**: Implementaciones técnicas, modelos y adaptadores
- **Presentation**: UI, widgets, screens y gestión de estado
- **Shared**: Recursos compartidos entre capas (datos, assets)

## 🚀 Instalación

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/DeartDev/toktik.git
   cd toktik
   ```

2. **Instalar dependencias**:
   ```bash
   flutter pub get
   ```

3. **Agregar videos** (opcional):
   - Los videos de prueba ya están incluidos en `assets/videos/`
   - Para usar tus propios videos, reemplázalos asegurándote que sean compatibles (H.264 Baseline/Main Profile)

4. **Ejecutar la aplicación**:
   ```bash
   flutter run
   ```

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2          # Gestión de estado reactiva
  intl: ^0.19.0            # Formateo internacional
  video_player: ^2.10.0    # Reproducción de videos
  animate_do: ^3.3.4       # Animaciones predefinidas
```

## 🎯 Uso

1. **Inicio**: Al abrir la aplicación, verás un indicador de carga mientras se preparan los videos
2. **Navegación**: Desliza verticalmente (arriba/abajo) para cambiar entre videos
3. **Reproducción**: 
   - Los videos se reproducen automáticamente en loop
   - Toca la pantalla para pausar/reanudar
4. **Interacción**: Observa las estadísticas de likes y vistas en la parte inferior derecha
5. **Caption**: Lee la descripción del video en la parte inferior izquierda

## 📁 Estructura de Datos

Los videos se definen en formato JSON en `lib/shared/data/local_video_posts.dart`:

```dart
{
  'name': 'Título del video',
  'videoUrl': 'assets/videos/1.mp4',
  'likes': 23230,
  'views': 1523
}
```

## 🔧 Configuración de Desarrollo

### Requisitos previos
- **Flutter SDK**: 3.5.1 o superior
- **Dart SDK**: Incluido con Flutter
- **Android Studio** / **Xcode**: Para desarrollo móvil
- **VS Code** o **Android Studio**: Como IDE
- **Git**: Para control de versiones

### Configuración de Gradle
- **Gradle**: 8.5
- **Android Gradle Plugin**: 8.3.0
- **Kotlin**: 1.9.22
- **minSdkVersion**: Por defecto de Flutter
- **targetSdkVersion**: Por defecto de Flutter

### Compatibilidad de Videos
Los videos deben cumplir con estos requisitos para funcionar en todos los dispositivos:
- **Codec**: H.264 (AVC)
- **Profile**: Baseline o Main Profile (Level 3.0 - 4.1)
- **Formato**: MP4
- **Resolución recomendada**: 720p o 1080p

Para convertir videos incompatibles:
```bash
ffmpeg -i input.mp4 -c:v libx264 -profile:v baseline -level 3.0 -c:a aac output.mp4
```

## 🎨 Personalización del Tema

El tema de la aplicación se puede personalizar en `lib/config/theme/app_theme.dart`:

```dart
ThemeData getTheme() => ThemeData(
  brightness: Brightness.dark,
  // Personaliza colores, tipografías, etc.
);
```

## 📝 Próximas Características

- [ ] Compartir videos en redes sociales
- [ ] Sistema de comentarios
- [ ] Perfil de usuario
- [ ] Subida de videos desde la cámara
- [ ] Filtros y efectos de video
- [ ] Música de fondo personalizada
- [ ] Sistema de seguimiento de usuarios
- [ ] Feed personalizado basado en intereses
- [ ] Integración con backend real (API REST)
- [ ] Notificaciones push

## 🐛 Solución de Problemas

### Videos no se reproducen
- Verifica que los videos estén en formato MP4 con codec H.264
- Revisa que los archivos estén en `assets/videos/`
- Asegúrate de haber ejecutado `flutter pub get`

### Pantalla negra
- Puede ser un problema de codec incompatible
- Intenta con los videos de prueba incluidos
- Verifica los logs en la consola para ver errores específicos

### Error de Gradle
- Limpia el proyecto: `flutter clean`
- Ejecuta: `flutter pub get`
- Si persiste, verifica las versiones en `android/settings.gradle`

## 👨‍💻 Autor

**DeartDev**
- GitHub: [@DeartDev](https://github.com/DeartDev)

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 🙏 Agradecimientos

- Inspirado en la interfaz de TikTok
- Comunidad de Flutter por los excelentes paquetes
- Recursos de videos de prueba de Google

---

⭐ Si te gustó este proyecto, ¡dale una estrella en GitHub!
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
