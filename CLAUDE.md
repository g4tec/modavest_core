# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This repo contains two distinct Flutter projects:

- **Root (`modavest_core`)** — A shared Flutter package (library) consumed by `modavest-app` and potentially other apps. Published internally via git dependency.
- **`modavest-app/`** — The main Modavest mobile app (B2B fashion sales). Has its own `CLAUDE.md` at `modavest-app/CLAUDE.md` with full app-specific guidance.

## modavest_core (root package)

A shared library providing models, widgets, utils, and assets used across Modavest apps.

### Commands

```bash
# Get dependencies
flutter pub get

# Analyze
flutter analyze

# Run tests
flutter test

# Generate Hive adapters (when modifying @HiveType models)
flutter pub run build_runner build
```

### Package structure

```
lib/
├── assets/       # Enums and constants (icons, parameters, labels, states, sizes, gender, etc.)
├── data/
│   └── models/   # Hive-backed data models (serializable, used for local storage)
├── domain/
│   └── models/   # Pure Dart domain models (Equatable, no Hive annotations)
├── features/     # Shared feature widgets (bag, customers, orders, products, goals)
├── utils/        # Formatting helpers (money, date, CEP, CPF/CNPJ) and validators
└── widgets/      # Reusable UI components (buttons, fields, forms, loading, filter drawer, etc.)
```

### Model layering convention

- `lib/data/models/` — Hive-annotated models for offline persistence. Each model directory typically contains `model.dart` (with `@HiveType`) and an adapter.
- `lib/domain/models/` — Clean domain models without persistence concerns, extending `Equatable`. These are what use cases and BLoCs work with.

### Key dependencies

| Package | Role |
|---|---|
| `hive` / `hive_flutter` | Local storage model serialization |
| `equatable` | Value equality for domain models |
| `flutter_bloc` / `bloc` | State management for shared feature widgets |
| `dartz` | Functional error handling (`Either`) |
| `intl` | Date/number formatting |
| `flutter_dotenv` | Env var loading |
| `syncfusion_flutter_datepicker` | Date range picker widget |

### Adding new models

1. Add domain model in `lib/domain/models/` extending `Equatable`.
2. If offline persistence is needed, add Hive model in `lib/data/models/<name>/` with `@HiveType` and a unique `typeId`. Register the adapter in the consuming app's Hive init.
3. Run `flutter pub run build_runner build` to regenerate `.g.dart` files.

## modavest-app

See `modavest-app/CLAUDE.md` for full guidance on running, building, and the app's architecture.
