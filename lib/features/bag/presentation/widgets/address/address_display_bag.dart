import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/domain/models/individual.dart';
import 'package:modavest_core/domain/models/legal_person.dart';
import 'package:modavest_core/widgets/address/add_address_card.dart';
import 'package:modavest_core/widgets/address/display_address_card.dart';

class AddressDisplayBag extends StatelessWidget {
  final void Function()? onPressedAdd;
  final void Function(int id)? onSelect;
  final int? selected;
  final Function({bool? force})? getAddresses;
  final Object? personCustomer;
  final Address? address;
  final String? error;
  const AddressDisplayBag({
    super.key,
    this.onPressedAdd,
    this.onSelect,
    required this.selected,
    this.getAddresses,
    this.personCustomer,
    this.error,
    this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Builder(
        builder: ((context) {
          if ((personCustomer is LegalPerson &&
                  (personCustomer as LegalPerson?)?.addresses != null) ||
              (personCustomer is Individual &&
                  (personCustomer as Individual?)?.addresses != null)) {
            return RefreshIndicator(
              onRefresh: () async {
                getAddresses?.call(force: true);
              },
              child: ListView(
                children: [
                  if (onPressedAdd != null)
                    AddAddressCard(onPressed: onPressedAdd),
                  ...(personCustomer is LegalPerson
                          ? (personCustomer! as LegalPerson).addresses
                          : (personCustomer! as Individual).addresses)
                      .asMap()
                      .map(
                        (key, e) => MapEntry(
                          key,
                          DisplayAddressCard(
                            onEdit: () {
                              onSelect?.call(key);
                            },
                            address: e,
                            selected: key == selected ||
                                (key ==
                                    (personCustomer is LegalPerson
                                            ? (personCustomer! as LegalPerson)
                                                .addresses
                                            : (personCustomer! as Individual)
                                                .addresses)
                                        .indexWhere(
                                      (element) => element == address,
                                    )),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddAddressCard(onPressed: onPressedAdd),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  error ?? ModaVestLabels.serverError,
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () => getAddresses?.call(force: true),
                  icon: const Icon(Icons.replay_outlined),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
