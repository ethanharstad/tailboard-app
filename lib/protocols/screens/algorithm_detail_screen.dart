import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';
import 'package:tailboard_app/protocols/models/algorithm_transition.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_stepper.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/beta_toast.dart';

class AlgorithmDetailScreen extends StatefulWidget {
  const AlgorithmDetailScreen({Key? key, required this.algorithm})
      : super(key: key);

  final Algorithm algorithm;

  @override
  State<StatefulWidget> createState() => _AlgorithmDetailScreenState();
}

class _AlgorithmDetailScreenState extends State<AlgorithmDetailScreen> {
  bool docView = false;
  PdfController? pdfController;
  late AlgorithmStep currentStep;
  LinkedHashMap<DateTime, AlgorithmStep> history = LinkedHashMap();

  @override
  void initState() {
    super.initState();
    currentStep = widget.algorithm.steps
        .firstWhere((element) => element.id == widget.algorithm.start);
    if (widget.algorithm.document != null) {
      downloadDocument(widget.algorithm.document!);
    }
    BetaToast.showBetaToast(context, 'protocol_detail_screen');
  }

  Future<void> downloadDocument(String filename) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/$filename');
    await downloadToFile.create(recursive: true);

    try {
      // TODO Add progress indicator for download
      await FirebaseStorage.instance.ref(filename).writeToFile(downloadToFile);
      setState(() {
        pdfController = PdfController(
          document: PdfDocument.openFile(downloadToFile.path),
        );
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (docView) {
          setState(() {
            docView = false;
          });
          return false;
        }
        return true;
      },
      child: AppScaffold(
        title: widget.algorithm.name,
        actions: <Widget>[
          IconButton(
            onPressed: () => setState(() {
              docView = !docView;
            }),
            icon: const Icon(Icons.file_present),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: docView
              ? pdfController != null
                  ? PdfView(controller: pdfController!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
              : AlgorithmStepper(
                  step: currentStep,
                  history: history,
                  onTransition: (AlgorithmTransition transition) => setState(() {
                    history[DateTime.now()] = currentStep;
                    currentStep = widget.algorithm.steps
                        .firstWhere((element) => element.id == transition.to);
                  }),
                ),
        ),
      ),
    );
  }
}
