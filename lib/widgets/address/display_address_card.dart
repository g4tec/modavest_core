import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/assets/modavest_type_code.dart';
import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/utils/format_cep.dart';

class DisplayAddressCard extends StatelessWidget {
  final void Function()? onEdit;
  final Address address;
  final bool selected;
  final String? titleEdit;
  const DisplayAddressCard({
    Key? key,
    required this.address,
    this.onEdit,
    required this.selected,
    this.titleEdit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Card(
        elevation: 20,
        shape: selected
            ? RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              )
            : const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                height: 50,
                child: Radio<int>(
                  value: selected ? 1 : 0,
                  onChanged: (_) {},
                  groupValue: 1,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (addressTypes[address.addressType.toString()] != null)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 10),
                        child: Text(
                          "Endereço ${addressTypes[address.addressType.toString()] ?? ""}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: Text(
                        "${address.publicPlace ?? ""} ${address.address}, ${address.number ?? ""}${address.complement != null ? ", ${address.complement}" : ""}${address.neighborhood != null ? ", ${address.neighborhood}" : ""}, ${address.cityName}/${address.stateAbbreviation ?? ""} - ${formatCep(address.cep)}",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    // if (address.complement != null)
                    //   Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5),
                    //     child: Text(
                    //       address.complement!,
                    //       style: Theme.of(context).textTheme.headline5,
                    //     ),
                    //   ),
                    // if (address.neighborhood != null)
                    //   Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5),
                    //     child: Text(
                    //       address.neighborhood!,
                    //       style: Theme.of(context).textTheme.headline5,
                    //     ),
                    //   ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 5),
                    //   child: Text(
                    //     "${address.cityName}/${address.stateAbbreviation ?? ""}",
                    //     style: Theme.of(context).textTheme.headline5,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 5),
                    //   child: Text(
                    //     formatCep(address.cep),
                    //     style: Theme.of(context).textTheme.headline5,
                    //   ),
                    // ),
                  ],
                ),
              ),
              // if (onEdit != null)
              //   TextButton(
              //     onPressed: onEdit,
              //     child: SizedBox(
              //       child: Align(
              //         child: Text(
              //           titleEdit ??
              //               (selected
              //                   ? ModaVestLabels.selected.toUpperCase()
              //                   : ModaVestLabels.select.toUpperCase()),
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
