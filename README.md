# news_ffl

Base de app para FFL (Flag Football League).

## Stack definido (fijo)

- **Frontend:** Flutter
- **Backend / servicios:** Firebase (Auth, Firestore, Storage y Cloud Functions)

> Este stack queda definido desde esta fase para construir pantallas y módulos sobre la misma base.

## Estructura modular

```text
lib/
  modules/
    home/
    games/
    jornadas/
    jugadores/
    equipos/
    auth/
    admin/
    arbitro/
  shared/
    navigation/
    theme/
    widgets/
```

## Navegación inicial

La navegación principal está lista con rutas para:

- Home
- Juegos
- Jugadores
- Equipos
- Login
