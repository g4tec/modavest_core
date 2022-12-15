import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/enterprise_social_network.dart';
import 'package:modavest_core/features/customers/presentation/widgets/registration/widgets/social_networks/social_netowork_card.dart';

class ListSocialNetworks extends StatelessWidget {
  final List<EnterpriseSocialNetwork> socialNetworks;
  final void Function() onAddSocialNetwork;
  final void Function(EnterpriseSocialNetwork) onEditSocialNetwork;
  const ListSocialNetworks({
    super.key,
    required this.socialNetworks,
    required this.onAddSocialNetwork,
    required this.onEditSocialNetwork,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...socialNetworks.map(
          (e) => SocialNetworkCard(
            socialNetwork: e,
            onEdit: onEditSocialNetwork,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: DottedBorder(
            color: Theme.of(context).primaryColor,
            dashPattern: const [8, 4],
            strokeWidth: 2,
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        ModaVestLabels.addSocialNetwork,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    IconButton(
                      onPressed: onAddSocialNetwork,
                      iconSize: 42,
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
