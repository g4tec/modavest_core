enum SyncEntities {
  officialStore,
  legalPerson,
  creditLimit,
  operationalArea,
  references,
  stock,
  other,
}

extension SyncEntitiesExtension on SyncEntities {
  String get name {
    switch (this) {
      case SyncEntities.references:
        return 'REFERENCES';
      case SyncEntities.creditLimit:
        return 'CREDIT_LIMIT';
      case SyncEntities.officialStore:
        return 'OFFICIAL_STORE';
      case SyncEntities.legalPerson:
        return 'LEGALPERSON';
      case SyncEntities.operationalArea:
        return 'OPERATIONAL_AREA';
      case SyncEntities.stock:
        return 'STOCK';
      default:
        return "";
    }
  }

  String get nameLabel {
    switch (this) {
      case SyncEntities.references:
        return 'Referências e produtos';
      case SyncEntities.creditLimit:
        return 'Limites de créditos';
      case SyncEntities.officialStore:
        return 'Lojas oficiais, tabelas de preços e escalas';
      case SyncEntities.legalPerson:
        return 'Clientes e endereços';
      case SyncEntities.operationalArea:
        return 'Áreas operacionais';
      case SyncEntities.stock:
        return 'Estoques';
      default:
        return "";
    }
  }

  SyncEntities getEnum(String str) {
    switch (str) {
      case 'REFERENCES':
        return SyncEntities.references;

      case 'CREDIT_LIMIT':
        return SyncEntities.creditLimit;

      case 'OFFICIAL_STORE':
        return SyncEntities.officialStore;

      case 'LEGALPERSON':
        return SyncEntities.legalPerson;

      case 'OPERATIONAL_AREA':
        return SyncEntities.operationalArea;

      case 'STOCK':
        return SyncEntities.stock;

      default:
        return SyncEntities.other;
    }
  }
}
