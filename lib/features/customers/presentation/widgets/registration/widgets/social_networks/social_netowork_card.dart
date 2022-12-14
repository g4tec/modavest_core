import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/moda_vest_parameters.dart';
import 'package:modavest_core/domain/models/enterprise_social_network.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class SocialNetworkCard extends StatelessWidget {
  final void Function(EnterpriseSocialNetwork) onEdit;
  final EnterpriseSocialNetwork socialNetwork;
  const SocialNetworkCard({
    super.key,
    required this.socialNetwork,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Builder(
                    builder: (context) {
                      final int indexParam = EnumParameters
                          .pesTipoRedeSocial.value.items
                          .indexWhere(
                        (element) =>
                            element.variant ==
                            socialNetwork.typeCode.toString(),
                      );

                      return ModavestTitle(
                        indexParam >= 0
                            ? (EnumParameters.pesTipoRedeSocial.value
                                .items[indexParam].value)
                            : "Tipo da rede social ${socialNetwork.typeCode.toString()}",
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (socialNetwork.address != null &&
                          socialNetwork.address!.isNotEmpty)
                        Text("Endereço: ${socialNetwork.address}"),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => onEdit.call(socialNetwork),
                  child: Text(ModaVestLabels.edit.toUpperCase()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
