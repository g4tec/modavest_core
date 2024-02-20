// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'official_store_sales_questions_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveOfficialStoreSalesQuestionsAdapter
    extends TypeAdapter<HiveOfficialStoreSalesQuestions> {
  @override
  final int typeId = 30;

  @override
  HiveOfficialStoreSalesQuestions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveOfficialStoreSalesQuestions(
      integrationId: fields[0] as num,
      officialStoreId: fields[1] as num,
      questionId: fields[2] as num,
      description: fields[3] as String,
      questionType: fields[4] as String,
      isDeliverImmediately: fields[5] as bool,
      isMakeToOrder: fields[6] as bool,
      classifications: (fields[7] as HiveList?)?.castHiveList(),
      options: (fields[8] as HiveList?)?.castHiveList(),
      observations: (fields[9] as List?)?.cast<String>(),
      isRequired: fields[10] as bool,
      isRepresentativeApp: fields[11] as bool?,
      isSellerApp: fields[12] as bool?,
      isShopkeeperApp: fields[13] as bool?,
      answer: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveOfficialStoreSalesQuestions obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.integrationId)
      ..writeByte(1)
      ..write(obj.officialStoreId)
      ..writeByte(2)
      ..write(obj.questionId)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.questionType)
      ..writeByte(5)
      ..write(obj.isDeliverImmediately)
      ..writeByte(6)
      ..write(obj.isMakeToOrder)
      ..writeByte(7)
      ..write(obj.classifications)
      ..writeByte(8)
      ..write(obj.options)
      ..writeByte(9)
      ..write(obj.observations)
      ..writeByte(10)
      ..write(obj.isRequired)
      ..writeByte(11)
      ..write(obj.isRepresentativeApp)
      ..writeByte(12)
      ..write(obj.isSellerApp)
      ..writeByte(13)
      ..write(obj.isShopkeeperApp)
      ..writeByte(14)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveOfficialStoreSalesQuestionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
