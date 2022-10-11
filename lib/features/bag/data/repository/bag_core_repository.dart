import 'package:modavest_core/domain/models/official_store_sales_questions.dart';
import 'package:modavest_core/domain/models/options.dart';

class BagCoreRepository {
  List<dynamic> mapQuestionsToObservations({
    required List<OfficialStoreSalesQuestions> questions,
    required Map<num, dynamic>? answers,
    List<dynamic>? observations,
    List<dynamic>? representativeObservations,
    Map? data,
    List<dynamic>? classifications,
  }) {
    observations ??= [];
    for (final num questionId in answers?.keys ?? []) {
      final OfficialStoreSalesQuestions question =
          questions.firstWhere((element) => element.questionId == questionId);
      switch (question.questionType) {
        case 'TEXTO':
          final String description =
              "${question.description} : ${answers?[questionId]}";
          final String descriptionString = description.length > 77
              ? "${description.substring(0, 77)}..."
              : description;
          observations.add(
            {
              "observation": descriptionString,
            },
          );

          break;
        case 'LISTA DE SELEÇÃO':
          final Options option = answers?[questionId] as Options;
          dynamic value;

          final String description =
              "${question.description} : ${option.observation}";
          final String descriptionString = description.length > 77
              ? "${description.substring(0, 77)}..."
              : description;
          observations.add(
            {"observation": descriptionString},
          );
          switch (option.definedFieldType) {
            case "DATE":
              value = DateTime.parse(option.definedFieldValue!)
                  .toUtc()
                  .toString()
                  .replaceAll(" ", "T");
              data?[option.definedField] = value;

              break;

            case "INTEGER":
              value = int.parse(option.definedFieldValue!);
              data?[option.definedField] = value;

              break;
          }

          if (option.typeCode != null && option.code != null) {
            classifications?.add({
              "classificationTypeCode": option.typeCode,
              "classificationCode": option.code,
            });
          }

          break;

        case 'CAIXA DE SELEÇÃO':
          final List<Options> options = answers?[questionId] as List<Options>;
          for (final Options option in options) {
            final String description =
                "${question.description} : ${option.observation}";
            final String descriptionString = description.length > 77
                ? "${description.substring(0, 77)}..."
                : description;
            observations.add(
              {"observation": descriptionString},
            );
          }
          for (final Options option in options) {
            classifications?.add({
              "classificationTypeCode": option.typeCode,
              "classificationCode": option.code,
            });
          }
          break;
        case 'TEXTO REPRESENTANTE':
          final String? description = answers?[questionId] as String?;
          if (description != null) {
            final String descriptionString = description.length > 77
                ? "${description.substring(0, 77)}..."
                : description;
            representativeObservations?.add(
              {
                "observation": descriptionString,
              },
            );
          }

          break;
      }
    }
    return observations;
  }
}
