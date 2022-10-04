import 'package:flutter/material.dart';

import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/address.dart';
import 'package:modavest_core/widgets/buttons/modavest_button.dart';
import 'package:modavest_core/widgets/forms/address_form.dart';
import 'package:modavest_core/widgets/text/page_title_back.dart';

class AddressFormBag extends StatefulWidget {
  final void Function()? onClose;
  final void Function(Address) setAddress;
  final Address? initialAddress;

  const AddressFormBag({
    super.key,
    required this.setAddress,
    this.onClose,
    this.initialAddress,
  });

  @override
  AddressFormBagState createState() => AddressFormBagState();
}

class AddressFormBagState extends State<AddressFormBag> {
  final GlobalKey<AddressFormState> formKey = GlobalKey<AddressFormState>();
  Address? initialAddress;

  @override
  void initState() {
    initialAddress = widget.initialAddress;
    super.initState();
  }

  void submitForm() {
    final AddressFormState addressFormState = formKey.currentState!;

    if (addressFormState.validate()) {
      final Address address = addressFormState.save();
      setState(() {
        initialAddress = address;
      });
      address.addressType = 5;

      widget.setAddress.call(address);
    }
  }

  bool setAsMainAddress = false;

  bool copyFromMainAddress = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              TitlePageBack(
                title: ModaVestLabels.addDeliveryAddres,
                onPop: widget.onClose,
              ),
              // TODO: adicionar ação de copiar do endereço principal
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   height: 100,
              //   child: FittedBox(
              //     child: Row(
              //       children: [
              //         Row(
              //           children: [
              //             Switch(
              //               value: setAsMainAddress,
              //               onChanged: (value) {
              //                 setState(() {
              //                   setAsMainAddress = value;
              //                 });
              //               },
              //             ),
              //             SizedBox(
              //               width: 120,
              //               child: Text(
              //                 ModaVestLabels.setAsMainAddress,
              //               ),
              //             )
              //           ],
              //         ),
              //         Row(
              //           children: [
              //             Switch(
              //               value: copyFromMainAddress,
              //               onChanged: (value) {
              //                 setState(() {
              //                   copyFromMainAddress = value;
              //                 });
              //               },
              //             ),
              //             SizedBox(
              //               width: 120,
              //               child: Text(ModaVestLabels.copyFromMainAddress),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: AddressForm(
                  stateKey: formKey,
                  initialAddress: initialAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ModaVestTextButton(
                  title: ModaVestLabels.save.toUpperCase(),
                  onPressed: submitForm,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
