enum EnumStatusBag { active, deleted, finished, other, moved }

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
      default:
        return EnumStatusBag.other;
    }
  }
}
