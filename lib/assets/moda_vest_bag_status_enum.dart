enum EnumStatusBag {
  active,
  deleted,
  finished,
  other,
  moved,
  movedBetweenPriceTables
}

extension EnumStatusBagExtension on EnumStatusBag {
  String get value {
    switch (this) {
      case EnumStatusBag.active:
        return 'active';
      case EnumStatusBag.deleted:
        return 'deleted';
      case EnumStatusBag.moved:
        return 'moved';
      case EnumStatusBag.finished:
        return 'finished';
      case EnumStatusBag.movedBetweenPriceTables:
        return 'movedBetweenPriceTables';
      default:
        return 'other';
    }
  }
}

extension StringEnumStatusBagExtension on String {
  EnumStatusBag get toStatusBag {
    switch (this) {
      case 'active':
        return EnumStatusBag.active;
      case 'deleted':
        return EnumStatusBag.deleted;
      case 'finished':
        return EnumStatusBag.finished;
      case 'moved':
        return EnumStatusBag.moved;
      case 'movedBetweenPriceTables':
        return EnumStatusBag.movedBetweenPriceTables;
      default:
        return EnumStatusBag.other;
    }
  }
}

extension StringLabelEnumStatusBagExtension on EnumStatusBag {
  String get toLabelStatusBag {
    switch (this) {
      case EnumStatusBag.active:
        return "Ativa";
      case EnumStatusBag.deleted:
        return "Deletada";
      case EnumStatusBag.finished:
        return "Finalizada";
      case EnumStatusBag.moved:
        return "Movida";
      case EnumStatusBag.movedBetweenPriceTables:
        return 'Movida entre tabela de preço';
      default:
        return "Outro";
    }
  }
}