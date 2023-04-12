import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/modavest_public_places.dart';
import 'package:modavest_core/domain/models/sales_order.dart';
import 'package:modavest_core/utils/format_cep.dart';
import 'package:modavest_core/utils/format_date.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class DeliveryCards extends StatelessWidget {
  final SalesOrder salesOrder;
  const DeliveryCards({
    super.key,
    required this.salesOrder,
  });

  Widget buildRow({
    required String title,
    required String title2,
    required BuildContext context,
    bool filled = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: filled ? Colors.grey.shade300 : Colors.white30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: AutoSizeText(
              title2,
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildRow(
          title: "Previsão de faturamento",
          title2: (salesOrder.items ?? []).isEmpty &&
                  salesOrder.items!.first.billingForecastDate != null
              ? formatDate(salesOrder.items!.first.billingForecastDate!)
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "CNPJ da transpostadora",
          title2: salesOrder.shippingCompanyCpfCnpj ?? " - ",
          context: context,
        ),
        buildRow(
          title: "Transpostadora",
          title2: salesOrder.shippingCompanyName ?? " - ",
          context: context,
          filled: true,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
          child: Text(
            "Endereço de entrega",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.black),
          ),
        ),
        buildRow(
          title: "Tipo de logradouro",
          title2: salesOrder.shippingAddress?.publicPlace != null
              ? publicPlaces[salesOrder.shippingAddress?.publicPlace!] ??
                  salesOrder.shippingAddress!.publicPlace!
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Logradouro",
          title2: salesOrder.shippingAddress?.address != null
              ? salesOrder.shippingAddress!.address
              : " - ",
          context: context,
        ),
        buildRow(
          title: "Número",
          title2: salesOrder.shippingAddress?.number != null
              ? salesOrder.shippingAddress!.number.toString()
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Complemento",
          title2: salesOrder.shippingAddress?.complement != null
              ? salesOrder.shippingAddress!.complement!
              : " - ",
          context: context,
        ),
        buildRow(
          title: "Bairro",
          title2: salesOrder.shippingAddress?.neighborhood != null
              ? salesOrder.shippingAddress!.neighborhood!
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "Cidade",
          title2: salesOrder.shippingAddress?.cityName != null
              ? salesOrder.shippingAddress!.cityName
              : " - ",
          context: context,
        ),
        buildRow(
          title: "Estado",
          title2: salesOrder.shippingAddress?.stateAbbreviation != null
              ? salesOrder.shippingAddress!.stateAbbreviation!
              : " - ",
          context: context,
          filled: true,
        ),
        buildRow(
          title: "CEP",
          title2: salesOrder.shippingAddress?.cep != null
              ? formatCep(salesOrder.shippingAddress!.cep)
              : " - ",
          context: context,
        ),
        buildRow(
          title: "Referência",
          title2: salesOrder.shippingAddress?.reference != null
              ? salesOrder.shippingAddress!.reference!
              : " - ",
          context: context,
          filled: true,
        ),
      ],
    );
  }
}
