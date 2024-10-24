import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/commissioned.dart';
import 'package:modavest_core/utils/commissioned_types.dart';

class CommissionedListWidget extends StatelessWidget {
  final List<Commissioned> commissioneds;

  const CommissionedListWidget({Key? key, required this.commissioneds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commissioneds.length,
      itemBuilder: (context, index) {
        final commissioned = commissioneds[index];
        return Card(
          child: ListTile(
            title: Text(commissioned.representativeName ?? 'No Name'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Código do representante: ${commissioned.representativeCode ?? 'N/A'}'),
                // Text(
                //     'Comissão de faturamento: ${commissioned.commissionPercentageBilling?.toStringAsFixed(2) ?? 'N/A'}%'),
                // Text(
                //     'Comissão de receita: ${commissioned.commissionPercentageReceipt?.toStringAsFixed(2) ?? 'N/A'}%'),
                // Text(
                //     'Tipo de comissão: ${commissionedTypes[commissioned.commissionedType] ?? 'N/A'}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
