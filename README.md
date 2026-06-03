# 👗 Closet AI

Closet AI es una aplicación móvil desarrollada en Flutter para la gestión inteligente de prendas de vestir y generación automática de outfits.

Está diseñada para funcionar completamente **offline**, almacenando toda la información localmente en SQLite.

---

## 🚀 Características principales

- 📸 Registro de prendas con imagen local
- 🧥 Organización por categoría, color, talla, marca y ocasión
- 💾 Almacenamiento local con SQLite (sin backend)
- ❤️ Sistema de favoritos
- 🔎 Filtros avanzados por tipo de prenda
- ✨ Generador automático de outfits basado en reglas
- 🌦️ Selección de clima y ocasión para sugerencias
- 📚 Historial de outfits guardados
- 🗑️ Eliminación de outfits
- 📱 Interfaz moderna y minimalista
- ⚡ Funciona 100% offline

---

## 🧠 Lógica de generación de outfits

El sistema de generación de outfits utiliza reglas como:

- Priorización de prendas favoritas
- Compatibilidad por categoría (top, bottom, shoes)
- Ajuste según clima:
  - ☀️ Soleado: prendas ligeras
  - 🌧️ Lluvia: botas y chaquetas
  - ❄️ Frío: chaquetas y ropa abrigada
- Ajuste por ocasión:
  - Universidad
  - Presentación
  - Evento académico
  - Salida casual

---

## 🏗️ Arquitectura del proyecto

```plaintext
lib/
├── models/
│   ├── garment.dart
│   ├── outfit.dart
│   ├── outfit_usage.dart
│   ├── weather_type.dart
│   └── outfit_request.dart
│
├── db/
│   └── database_helper.dart
│
├── repositories/
│   ├── garment_repository.dart
│   ├── outfit_repository.dart
│   └── outfit_usage_repository.dart
│
├── providers/
│   ├── garment_provider.dart
│   └── outfit_provider.dart
│
├── services/
│   └── outfit_generator_service.dart
│
├── screens/
│   ├── garments/
│   └── outfits/
│
└── widgets/

```


## 🗄️ Base de datos (SQLite)

### Tabla: garments
- id
- name
- category
- color
- size
- brand
- season
- occasion
- imagePath
- isFavorite
- lastWorn
- createdAt

### Tabla: outfits
- id
- name
- topId
- bottomId
- shoesId
- accessoryId
- notes
- createdAt

### Tabla: outfit_usage
- id
- outfitId
- usedAt

---

## ⚙️ Tecnologías usadas

- Flutter
- Dart
- SQLite (sqflite)
- Provider (gestión de estado)
- Path Provider (archivos locales)
- Image Picker (imágenes locales)

---

## 📱 Plataformas soportadas

- Android 📱
- iOS 🍎

---

## 🧪 Estado del proyecto

✔ CRUD de prendas completo  
✔ Base de datos local funcional  
✔ Generador de outfits operativo  
✔ Historial de outfits implementado  
⏳ Dashboard y estadísticas (Fase futura)

---

## 🎯 Próximas mejoras (Fase 12)

- 📊 Dashboard de estadísticas
- 📅 Calendario de outfits
- 📈 Prenda más usada
- 🌈 Análisis de colores
- 🤖 Integración opcional con Gemini AI

---

## 👩‍💻 Autor

Proyecto desarrollado como sistema de aprendizaje y portafolio en Flutter.

---

## 📌 Nota

Este proyecto funciona completamente offline, sin backend ni autenticación.
