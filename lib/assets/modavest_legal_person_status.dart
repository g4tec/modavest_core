import 'package:flutter/material.dart';

enum LegalPersonStatus {
  active,
  inactive,
  bloqued,
  other,
}

extension LegalPersonStatusNamed on LegalPersonStatus {
  String get name {
    switch (this) {
      case LegalPersonStatus.active:
        return "Active";

      case LegalPersonStatus.inactive:
        return "Inactive";

      case LegalPersonStatus.bloqued:
        return "Bloqued";

      case LegalPersonStatus.other:
        return "Other";
    }
  }
}

extension LegalPersonStatusLabel on LegalPersonStatus {
  String get label {
    switch (this) {
      case LegalPersonStatus.active:
        return "Ativo";

      case LegalPersonStatus.inactive:
        return "Inativo";

      case LegalPersonStatus.bloqued:
        return "Bloqueado";

      case LegalPersonStatus.other:
        return "Outro";
    }
  }
}

extension LegalPersonStatusFromNamed on LegalPersonStatus {
  static LegalPersonStatus fromNamed(String? name) {
    switch (name) {
      case "Active":
        return LegalPersonStatus.active;

      case "Inactive":
        return LegalPersonStatus.inactive;

      case "Bloqued":
        return LegalPersonStatus.bloqued;
    }
    return LegalPersonStatus.other;
  }
}

extension LegalPersonStatusStyle on LegalPersonStatus {
  TextStyle? style(BuildContext context) {
    switch (this) {
      case LegalPersonStatus.active:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
            );

      case LegalPersonStatus.inactive:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).disabledColor,
            );

      case LegalPersonStatus.bloqued:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            );
      case LegalPersonStatus.other:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
            );
    }
  }
}
