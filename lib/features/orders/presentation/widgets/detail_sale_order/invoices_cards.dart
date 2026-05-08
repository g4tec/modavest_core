import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:modavest_core/domain/models/invoice.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class InvoicesCard extends StatefulWidget {
  final List<Invoice> invoices;
  final Future<String> Function(String accessKey)? onFetchDanfe;

  const InvoicesCard({
    super.key,
    this.invoices = const [],
    this.onFetchDanfe,
  });

  @override
  State<InvoicesCard> createState() => _InvoicesCardState();
}

class _InvoicesCardState extends State<InvoicesCard> {
  final Map<int, bool> _loadingShare = {};
  final Map<int, bool> _loadingView = {};

  Future<File> _downloadDanfe(String accessKey) async {
    final String base64Pdf = await widget.onFetchDanfe!(accessKey);
    final List<int> bytes = base64Decode(base64Pdf);
    final Directory dir = await getTemporaryDirectory();
    final File file = File('${dir.path}/danfe_$accessKey.pdf');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<void> _fetchAndShareDanfe(int index, String accessKey) async {
    setState(() => _loadingShare[index] = true);
    try {
      final file = await _downloadDanfe(accessKey);
      await Share.shareXFiles(
        [XFile(file.path, mimeType: 'application/pdf')],
        subject: 'Nota Fiscal',
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao carregar a nota fiscal.')),
        );
      }
    } finally {
      if (mounted) setState(() => _loadingShare[index] = false);
    }
  }

  Future<void> _fetchAndViewDanfe(int index, String accessKey) async {
    setState(() => _loadingView[index] = true);
    try {
      final file = await _downloadDanfe(accessKey);
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Nota Fiscal')),
            body: PDFView(filePath: file.path),
          ),
        ),
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao carregar a nota fiscal.')),
        );
      }
    } finally {
      if (mounted) setState(() => _loadingView[index] = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.invoices.length,
        itemBuilder: (context, index) {
          final invoice = widget.invoices[index];
          final bool showDanfeButton =
              widget.onFetchDanfe != null &&
              invoice.accessKey != null &&
              invoice.accessKey!.isNotEmpty;
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
                  if (showDanfeButton) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            onPressed: _loadingShare[index] == true
                                ? null
                                : () => _fetchAndShareDanfe(index, invoice.accessKey!),
                            icon: _loadingShare[index] == true
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.share),
                            label: const Text('Compartilhar'),
                          ),
                        ),
                        Expanded(
                          child: TextButton.icon(
                            onPressed: _loadingView[index] == true
                                ? null
                                : () => _fetchAndViewDanfe(index, invoice.accessKey!),
                            icon: _loadingView[index] == true
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.visibility_outlined),
                            label: const Text('Visualizar'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
