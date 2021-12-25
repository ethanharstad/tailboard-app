import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class BLSProtocolPdfScreen extends StatelessWidget {
  BLSProtocolPdfScreen({Key? key}) : super(key: key);

  final pdfController = PdfController(
      document: PdfDocument.openAsset(
          'assets/protocols/AlgorithmBLS_Adult_200624.pdf'));

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'BLS Protocol',
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: PdfView(
          controller: pdfController,
        ),
      ),
    );
  }
}
