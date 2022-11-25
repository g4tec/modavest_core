import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/modavest_legal_person_status.dart';
import 'package:modavest_core/domain/models/customer.dart';

class CustomerListTile extends StatelessWidget {
  final Customer customer;
  final double width;
  final Function(Customer customer)? onTap;
  const CustomerListTile(
      {super.key, required this.customer, required this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () => onTap?.call(customer),
        // onTap: () => widget.onSelectCustomer != null
        //     ? widget.onSelectCustomer!.call(customer)
        //     : bloc.add(SetCustomerEvent(customer: customer)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.18,
                height: 60,
                child: customer.image != null
                    ? Image.network(customer.image!)
                    : FittedBox(
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            customer.name?.substring(0, 1) ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
              Column(
                children: [
                  Container(
                    width: width * 0.75,
                    height: 80,
                    padding: EdgeInsets.only(left: width * 0.05),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          customer.name ??
                              (customer.fantasyName ?? customer.integrationId)
                                  .toString(),
                          maxLines: 2,
                          style: LegalPersonStatus.active
                              .style(context)
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        if (customer.cpfCnpj != null)
                          AutoSizeText(
                            "CNPJ: ${customer.cpfCnpj.toString()}",
                            style: LegalPersonStatus.active
                                .style(context)
                                ?.copyWith(fontSize: 14),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
