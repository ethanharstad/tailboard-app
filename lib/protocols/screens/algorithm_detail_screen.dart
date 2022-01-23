import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tailboard_app/protocols/blocs/algorithm_bloc.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_drawer.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_stepper.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/beta_toast.dart';
import 'package:tailboard_app/widgets/unimplemented_dialog.dart';

class AlgorithmDetailScreen extends StatefulWidget {
  const AlgorithmDetailScreen({Key? key, required this.algorithm})
      : super(key: key);

  final Algorithm algorithm;

  @override
  State<StatefulWidget> createState() => _AlgorithmDetailScreenState();
}

class _AlgorithmDetailScreenState extends State<AlgorithmDetailScreen> {
  AlgorithmBloc bloc = AlgorithmBloc();
  bool docView = false;
  Future<PdfDocument>? _pdfDocument;
  PdfController? _pdfController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bloc.add(AlgorithmLoaded(algorithm: widget.algorithm));
    if (widget.algorithm.document != null) {
      downloadDocument(widget.algorithm.document!);
    }
    BetaToast.showBetaToast(context, 'protocol_detail_screen');
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Future<void> downloadDocument(String filename) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/$filename');
    await downloadToFile.create(recursive: true);

    try {
      // TODO Add progress indicator for download
      await FirebaseStorage.instance.ref(filename).writeToFile(downloadToFile);
      _pdfDocument = PdfDocument.openFile(downloadToFile.path);
      setState(() {
        _pdfController = PdfController(
          document: _pdfDocument!,
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
      child: BlocProvider.value(
        value: bloc,
        child: AppScaffold(
          scaffoldKey: scaffoldKey,
          title: widget.algorithm.name,
          endDrawer: widget.algorithm.notes.isNotEmpty
              ? AlgorithmDrawer(
                  notes: widget.algorithm.notes,
                )
              : null,
          actions: <Widget>[
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) =>
                    const UnimplementedDialog(featureName: 'History Saving'),
              ),
              icon: const Icon(Icons.save),
            ),
            IconButton(
              onPressed: _pdfController != null
                  ? () {
                      setState(() {
                        _pdfController = PdfController(
                          document: _pdfDocument!,
                        );
                        docView = !docView;
                      });
                    }
                  : null,
              icon: const Icon(Icons.attach_file),
            ),
            IconButton(
              onPressed: widget.algorithm.notes.isNotEmpty
                  ? () {
                      scaffoldKey.currentState!.openEndDrawer();
                    }
                  : null,
              icon: const Icon(Icons.notes),
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: docView
                ? _pdfController != null
                    ? PdfView(controller: _pdfController!)
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
                : const AlgorithmStepper(),
          ),
        ),
      ),
    );
  }
}
