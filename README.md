# Closet AI 👗🤖

Aplicación móvil desarrollada en Flutter para la gestión inteligente de prendas de vestir, generación automática de outfits y seguimiento del uso del guardarropa.

---

# Estado Actual del Proyecto

## Versión actual

**MVP Funcional - Fase 13**

## Tecnologías utilizadas

- Flutter
- Dart
- Provider
- SQLite (sqflite)
- Path Provider
- Image Picker
- Material Design

---

# Funcionalidades Implementadas

## Gestión de Prendas

### Registro de prendas

Permite registrar:

- Nombre
- Marca
- Categoría
- Color
- Talla
- Temporada
- Ocasión de uso

### Categorías soportadas

- Blusa
- Camiseta
- Jean
- Falda
- Vestido
- Chaqueta
- Tenis
- Botas

### Favoritos

Las prendas pueden marcarse como favoritas para que el motor de recomendaciones las priorice.

### Eliminación

Las prendas pueden eliminarse mediante gesto Swipe (Dismissible).

---

# Gestión de Imágenes

## Selección desde Galería

El usuario puede elegir fotografías reales de sus prendas.

## Captura desde Cámara

Preparado para integración con cámara mediante `ImagePicker`.

## Almacenamiento Local

Las imágenes son copiadas y almacenadas dentro del directorio privado de la aplicación.

## Visualización

Las fotografías aparecen automáticamente en:

- Lista de prendas
- Generador de outfits
- Outfits guardados

---

# Base de Datos SQLite

## Tabla: garments

| Campo | Tipo |
|---------|---------|
| id | INTEGER |
| name | TEXT |
| category | TEXT |
| color | TEXT |
| size | TEXT |
| brand | TEXT |
| season | TEXT |
| occasion | TEXT |
| imagePath | TEXT |
| isFavorite | INTEGER |
| lastWorn | TEXT |
| createdAt | TEXT |

---

## Tabla: outfits

| Campo | Tipo |
|---------|---------|
| id | INTEGER |
| name | TEXT |
| topId | INTEGER |
| bottomId | INTEGER |
| shoesId | INTEGER |
| accessoryId | INTEGER |
| notes | TEXT |
| createdAt | TEXT |

---

## Tabla: outfit_usage

| Campo | Tipo |
|---------|---------|
| id | INTEGER |
| outfitId | INTEGER |
| usedAt | TEXT |

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
---

# Dashboard

Actualmente muestra:

- Total de prendas
- Total de favoritas
- Total de outfits
- Color predominante

---

# Generador de Outfits

Actualmente considera:

## Ocasión

- Universidad
- Presentación
- Evento Académico
- Salida Casual

## Clima

- Soleado
- Nublado
- Lluvioso
- Frío

## Temporada

- Todo el año
- Verano
- Invierno
- Primavera
- Otoño

---

# Reglas Inteligentes Implementadas

## Presentación

Prioriza:

- Blusas

## Evento Académico

Prioriza:

- Chaquetas

## Salida Casual

Prioriza:

- Camisetas

## Clima Lluvioso

Prioriza:

- Botas

## Clima Frío

Prioriza:

- Chaquetas
- Botas

## Favoritos

Las prendas favoritas tienen prioridad sobre las demás.

---

# Navegación Principal

Bottom Navigation Bar:

1. Inicio
2. Prendas
3. Outfits
4. Estadísticas

---

# Pantallas Disponibles

## HomeScreen

Pantalla principal con estadísticas rápidas.

## GarmentListScreen

Listado de prendas registradas.

### Funcionalidades

- Ver prendas
- Ver fotografías
- Marcar favoritas
- Eliminar prendas

---

## GarmentFormScreen

Registro de nuevas prendas.

### Funcionalidades

- Formulario de registro
- Selección de imagen
- Validaciones

---

## OutfitGeneratorScreen

Generación automática de outfits.

### Funcionalidades

- Selección de ocasión
- Selección de clima
- Selección de temporada
- Generación automática
- Guardado de outfits

---

## SavedOutfitsScreen

Visualización de outfits guardados.

### Funcionalidades

- Historial de outfits
- Consulta rápida

---

## OutfitHistoryScreen

Historial de outfits utilizados.

---

## DashboardScreen

Visualización de estadísticas generales.

---

# Funcionalidades Visuales

## Outfit Visual Card

Permite visualizar:

- Prendas generadas
- Fotografías reales
- Categorías
- Información resumida

---

# Próximas Fases

## Fase 13.4

### Detalle completo del outfit

- Ver prendas asociadas
- Ver fotografías ampliadas
- Ver fecha de creación
- Ver ocasión
- Ver clima
- Ver temporada

---

## Fase 14

### Motor de recomendación avanzado

- Compatibilidad de colores
- Combinaciones inteligentes
- Evitar repetir prendas recientes
- Aprendizaje basado en favoritos
- Priorización por temporada
- Recomendaciones dinámicas

---

## Fase 15

### Dashboard Profesional

- Gráficas interactivas
- Categorías más usadas
- Colores más usados
- Prendas olvidadas
- Historial de utilización
- Métricas de uso

---

## Fase 16

### Calendario de Outfits

- Planificación semanal
- Planificación mensual
- Recordatorios
- Agenda de vestimenta

---

## Fase 17

### Versión Comercial

- Login
- Registro
- Perfil de usuario
- Modo oscuro
- Animaciones
- Personalización
- Compartir outfits
- Exportación PDF
- Sincronización en la nube

---

# Estado General del Proyecto

| Módulo | Progreso |
|----------|----------|
| Base de Datos | ✅ 100% |
| CRUD Prendas | ✅ 100% |
| Providers | ✅ 100% |
| Repositories | ✅ 100% |
| Dashboard Básico | ✅ 100% |
| Generador de Outfits | ✅ 90% |
| Fotos de Prendas | ✅ 90% |
| Outfits Guardados | ✅ 90% |
| Historial | ✅ 80% |
| IA de Recomendación | 🚧 40% |
| Dashboard Avanzado | 🚧 20% |
| Calendario | ⏳ 0% |
| Versión Comercial | ⏳ 0% |

---

# Progreso Global

**70% Completado**

## MVP Funcional Operativo

Actualmente Closet AI ya permite:

✅ Registrar prendas

✅ Guardar información localmente

✅ Gestionar fotografías

✅ Marcar favoritas

✅ Generar outfits

✅ Guardar outfits

✅ Consultar historial

✅ Visualizar estadísticas

✅ Navegar entre módulos

🚀 Próximo objetivo: convertir Closet AI en una aplicación de recomendación de outfits inteligente.