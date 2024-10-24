import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modavest_core/domain/models/invoice.dart';

class InvoicesCard extends StatelessWidget {
  final List<Invoice> invoices;

  const InvoicesCard({super.key, this.invoices = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoices[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transportadora: ${invoice.shippingCompanyName ?? ' - '}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Peso Bruto: ${invoice.grossWeight ?? ' - '}'),
                  Text('Peso Líquido: ${invoice.netWeight ?? ' - '}'),
                  Text('Status: ${invoice.status ?? ' - '}'),
                  Wrap(
                    children: [
                      const Text('Código de Rastreio: '),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(text: invoice.accessKey ?? ""),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Código de rastreio copiado!'),
                            ),
                          );
                        },
                        child: Text(
                          invoice.accessKey ?? ' - ',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
