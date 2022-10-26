import 'package:modavest_core/domain/models/parameter.dart';
import 'package:modavest_core/domain/models/parameter_type.dart';

enum EnumParameters {
  pesTipoTelefone,
  pesTipoEmail,
  pesTipoContato,
  pesTipoRedeSocial,
}

extension EnumParametersExtension on EnumParameters {
  Parameter get value {
    switch (this) {
      case EnumParameters.pesTipoTelefone:
        return Parameter(parameterId: 13, code: "PESTIPOTELEFONE", items: [
          ParameterType(
              sequence: 1, parameterId: 13, variant: "91", value: "Comercial"),
          ParameterType(
            sequence: 2,
            parameterId: 13,
            variant: "92",
            value: "Celular",
          ),
          ParameterType(
              sequence: 3, parameterId: 13, variant: "93", value: "WhatsApp")
        ]);
      case EnumParameters.pesTipoEmail:
        return Parameter(parameterId: 14, code: "PESTIPOEMAIL", items: [
          ParameterType(
              sequence: 1, parameterId: 14, variant: "91", value: "Comercial"),
          ParameterType(
            sequence: 2,
            parameterId: 14,
            variant: "92",
            value: "NFe",
          ),
        ]);
      case EnumParameters.pesTipoContato:
        return Parameter(parameterId: 15, code: "PESTIPOCONTATO", items: [
          ParameterType(
              sequence: 1, parameterId: 15, variant: "91", value: "Comercial"),
          ParameterType(
              sequence: 2, parameterId: 15, variant: "92", value: "Financeiro"),
          ParameterType(
            sequence: 3,
            parameterId: 15,
            variant: "93",
            value: "Fiscal",
          ),
        ]);

      case EnumParameters.pesTipoRedeSocial:
        return Parameter(
          parameterId: 17,
          code: "PESTIPOREDESOCIAL",
          items: [
            ParameterType(
                sequence: 1, parameterId: 17, variant: "91", value: "Facebook"),
            ParameterType(
                sequence: 2,
                parameterId: 17,
                variant: "92",
                value: "Instagram"),
            ParameterType(
                sequence: 3, parameterId: 17, variant: "93", value: "Twitter"),
            ParameterType(
                sequence: 4, parameterId: 17, variant: "94", value: "WhatsApp"),
            ParameterType(
                sequence: 5, parameterId: 17, variant: "95", value: "Site"),
          ],
        );
    }
  }
}
